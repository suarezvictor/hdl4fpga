--                                                                            --
-- Author(s):                                                                 --
--   Miguel Angel Sagreras                                                    --
--                                                                            --
-- Copyright (C) 2015                                                         --
--    Miguel Angel Sagreras                                                   --
--                                                                            --
-- This source file may be used and distributed without restriction provided  --
-- that this copyright statement is not removed from the file and that any    --
-- derivative work contains  the original copyright notice and the associated --
-- disclaimer.                                                                --
--                                                                            --
-- This source file is free software; you can redistribute it and/or modify   --
-- it under the terms of the GNU General Public License as published by the   --
-- Free Software Foundation, either version 3 of the License, or (at your     --
-- option) any later version.                                                 --
--                                                                            --
-- This source is distributed in the hope that it will be useful, but WITHOUT --
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or      --
-- FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for   --
-- more details at http://www.gnu.org/licenses/.                              --
--                                                                            --

library ieee;
use ieee.std_logic_1164.all;

library ecp5u;
use ecp5u.components.all;

entity ecp5_ddrdqphy is
	generic (
		data_gear   : natural;
		byte_size   : natural);
	port (
		rst         : in  std_logic;
		sclk        : in  std_logic;
		eclk        : in  std_logic;
		ddrdel      : in  std_logic;
		pause       : in  std_logic;

		phy_wlreq   : in  std_logic;
		phy_wlrdy   : buffer std_logic;
		phy_rlreq   : in  std_logic := 'U';
		phy_rlrdy   : buffer std_logic;
		phy_rlcal   : out std_logic;
		phy_sti     : in  std_logic := 'U';
		phy_dmt     : in  std_logic_vector(0 to data_gear-1) := (others => '-');
		phy_dmi     : in  std_logic_vector(data_gear-1 downto 0) := (others => '-');
		phy_dmo     : out std_logic_vector(data_gear-1 downto 0);
		phy_dqo     : out std_logic_vector(data_gear*byte_size-1 downto 0);
		phy_dqt     : in  std_logic_vector(0 to data_gear-1);
		phy_dqi     : in  std_logic_vector(data_gear*byte_size-1 downto 0);
		phy_dqso    : in  std_logic_vector(0 to data_gear-1);
		phy_dqst    : in  std_logic_vector(0 to data_gear-1);

		ddr_dmt     : out std_logic;
		ddr_dmi     : in  std_logic := '-';
		ddr_dmo     : out std_logic;
		ddr_dqi     : in  std_logic_vector(byte_size-1 downto 0);
		ddr_dqt     : out std_logic_vector(byte_size-1 downto 0);
		ddr_dqo     : out std_logic_vector(byte_size-1 downto 0);

		ddr_dqsi    : in  std_logic;
		ddr_dqst    : out std_logic;
		ddr_dqso    : out std_logic);

end;

library hdl4fpga;
use hdl4fpga.std.all;

architecture lscc of ecp5_ddrdqphy is

	signal dqsr90  : std_logic;
	signal dqsw270 : std_logic;
	signal dqsw    : std_logic;
	
	
	signal dqi    : std_logic_vector(phy_dqi'range);

	signal dqt    : std_logic_vector(phy_dqt'range);
	signal dqst   : std_logic_vector(phy_dqst'range);
	signal dqso   : std_logic_vector(phy_dqso'range);
	signal wle    : std_logic;

	signal rdpntr : std_logic_vector(3-1 downto 0);
	signal wrpntr : std_logic_vector(3-1 downto 0);

	signal read   : std_logic_vector(0 to 2-1);
	signal readclksel : std_logic_vector(3-1 downto 0);
	signal wlpha  : std_logic_vector(8-1 downto 0);

	constant delay : time := 6 ns;
	signal xxx      : std_logic_vector(0 to 0);
begin

	rl_b : block
		signal adjdqs_req : std_logic;
		signal adjdqs_rdy : std_logic;
		signal adjdqi_req : std_logic;
		signal adjdqi_rdy : std_logic_vector(ddr_dqi'range);
		signal adjsto_req : std_logic;
		signal adjsto_rdy : std_logic;

	begin
		readclksel <= "000";
		xxx_b : block
			signal q : std_logic_vector(0 to 3-1);
		begin
			q(0) <= phy_sti;
			process(sclk)
			begin
				if rising_edge(sclk) then
					q(1 to q'right) <= q(0 to q'right-1);
				end if;
			end process;
			read(1) <= word2byte(q(0 to q'right-1), '1');
			read(0) <= word2byte(q(1 to q'right),   '1');
		end block;

		process (sclk)
			type states is (sync_start, sync_sto);
			variable state : states;
			variable aux : std_logic;
		begin
			if rising_edge(sclk) then
				if (to_bit(phy_rlreq) xor to_bit(phy_rlrdy))='0' then
					adjdqs_req <= to_stdulogic(to_bit(adjdqs_rdy));
					adjsto_req <= to_stdulogic(to_bit(adjsto_rdy));
					state := sync_start;
				else
					case state is
					when sync_start =>
						adjdqs_req <= not to_stdulogic(to_bit(adjdqs_rdy));
						state := sync_sto;
					when sync_sto =>
						if (to_bit(adjdqs_req) xor to_bit(adjdqs_rdy))='0' then
							adjdqi_req <= not to_stdulogic(to_bit(adjsto_req));
							adjsto_req <= not adjsto_rdy;
							state := sync_sto;
						end if;
					end case;
	
				end if;
			end if;
		end process;

		phy_rlcal <= to_stdulogic(to_bit(adjsto_req) xor to_bit(adjsto_rdy));
	end block;

	wl_b : block
		signal step_rdy : std_logic;
		signal step_req : std_logic;
	begin

		step_delay_e : entity hdl4fpga.align
		generic map (
			n => 1,
			d => (0 => 4))
		port map (
			clk => sclk,
			di(0) => step_req,
			do(0) => step_rdy);
	
		xxx(0) <= transport ddr_dqsi after delay;
		adjdqs_e : entity hdl4fpga.adjpha
		generic map (
			taps     => 2**wlpha'length-1)
		port map (
			edge     => std_logic'('0'),
			clk      => sclk,
			req      => phy_wlreq,
			rdy      => phy_wlrdy,
			step_req => step_req,
			step_rdy => step_rdy,
			smp      => xxx,
			delay    => wlpha);

	end block;

	dqsbufm_i : dqsbufm 
	port map (
		rst       => rst,
		sclk      => sclk,
		eclk      => eclk,

		ddrdel    => ddrdel,
		pause     => pause,

		dqsi      => xxx(0), --ddr_dqsi,
		dqsr90    => dqsr90,

		read0     => read(0),
		read1     => read(1),
		readclksel0 => readclksel(0),
		readclksel1 => readclksel(1),
		readclksel2 => readclksel(2),

		rdpntr2   => rdpntr(2),
		rdpntr1   => rdpntr(1),
		rdpntr0   => rdpntr(0),
		wrpntr2   => wrpntr(2),
		wrpntr1   => wrpntr(1),
		wrpntr0   => wrpntr(0),

		datavalid => open,
		rdmove    => '0',
		wrmove    => '0',
		burstdet  => open,
		rdcflag   => open,
		wrcflag   => open,

		rdloadn   => '0',
		rddirection => '0',
		wrloadn   => '0',
		wrdirection => '0',

		dyndelay0 => wlpha(0),
		dyndelay1 => wlpha(1),
		dyndelay2 => wlpha(2),
		dyndelay3 => wlpha(3),
		dyndelay4 => wlpha(4),
		dyndelay5 => wlpha(5),
		dyndelay6 => wlpha(6),
		dyndelay7 => wlpha(7),

		dqsw      => dqsw,
		dqsw270   => dqsw270);

	iddr_g : for i in 0 to byte_size-1 generate
		signal d : std_logic;
		signal z : std_logic;
	begin
		d <= transport ddr_dqi(i) after delay;
		delay_i : delayg
		generic map (
			del_mode => "DQS_ALIGNED_X2")
		port map (
			a => d,
			z => z);

		iddrx2_i : iddrx2dqa
		port map (
			rst     => rst,
			sclk    => sclk,
			eclk    => eclk,
			dqsr90  => dqsr90,
			rdpntr2 => rdpntr(2),
			rdpntr1 => rdpntr(1),
			rdpntr0 => rdpntr(0),
			wrpntr2 => wrpntr(2),
			wrpntr1 => wrpntr(1),
			wrpntr0 => wrpntr(0),
			d       => z,
			q2      => phy_dqo(0*byte_size+i),
			q3      => phy_dqo(1*byte_size+i),
			q0      => phy_dqo(2*byte_size+i),
			q1      => phy_dqo(3*byte_size+i));
	end generate;

	dmi_g : block
		signal d : std_logic;
	begin
		delay_i : delayg
		generic map (
			del_mode => "DQS_ALIGNED_X2")
		port map (
			a => ddr_dmi,
			z => d);

		iddrx2_i : iddrx2dqa
		port map (
			rst     => rst,
			sclk    => sclk,
			eclk    => eclk,
			dqsr90  => dqsr90,
			rdpntr0 => rdpntr(0),
			rdpntr1 => rdpntr(1),
			rdpntr2 => rdpntr(2),
			wrpntr0 => wrpntr(0),
			wrpntr1 => wrpntr(1),
			wrpntr2 => wrpntr(2),
			d       => d,
			q0      => phy_dmo(0),
			q1      => phy_dmo(1),
			q2      => phy_dmo(2),
			q3      => phy_dmo(3));
	end block;

	wle <= to_stdulogic(to_bit(phy_wlrdy)) xor phy_wlreq;

	dqt <= phy_dqt when wle='0' else (others => '1');
	oddr_g : for i in 0 to byte_size-1 generate
		tshx2dqa_i : tshx2dqa
		port map (
			rst  => rst,
			sclk => sclk,
			eclk => eclk,
			dqsw270 => dqsw270,
			t1  => dqt(2*0),
			t0  => dqt(2*1),
			q   => ddr_dqt(i));

		oddrx2dqa_i : oddrx2dqa
		port map (
			rst     => rst,
			sclk => sclk,
			eclk => eclk,
			dqsw270 => dqsw270,
			d0   => phy_dqi(0*byte_size+i),
			d1   => phy_dqi(1*byte_size+i),
			d2   => phy_dqi(2*byte_size+i),
			d3   => phy_dqi(3*byte_size+i),
			q    => ddr_dqo(i));
	end generate;

	dm_b : block
	begin
		tshx2dqa_i : tshx2dqa
		port map (
			rst  => rst,
			sclk => sclk,
			eclk => eclk,
			dqsw270 => dqsw270,
			t0  => dqt(2*1),
			t1  => dqt(2*0),
			q   => ddr_dmt);

		oddrx2dqa_i : oddrx2dqa
		port map (
			rst  => rst,
			sclk => sclk,
			eclk => eclk,
			dqsw270 => dqsw270,
			d0   => phy_dmi(0),
			d1   => phy_dmi(1),
			d2   => phy_dmi(2),
			d3   => phy_dmi(3),
			q    => ddr_dmo);
	end block;

	dqst <= phy_dqst when wle='0' else (others => '0');
	dqso <= phy_dqso when wle='0' else (others => '1');

	dqso_b : block 
	begin

		tshx2dqsa_i : tshx2dqsa
		port map (
			rst  => rst,
			sclk => sclk,
			eclk => eclk,
			dqsw => dqsw,
			t0   => dqst(2*1),
			t1   => dqst(2*0),
			q    => ddr_dqst);

		oddrx2dqsb_i : oddrx2dqsb
		port map (
			rst  => rst,
			sclk => sclk,
			eclk => eclk,
			dqsw => dqsw,
			d0   => '0',
			d1   => dqso(2*1),
			d2   => '0',
			d3   => dqso(2*0),
			q    => ddr_dqso);

	end block;
end;
