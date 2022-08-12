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
use ieee.numeric_std.all;

library hdl4fpga;
use hdl4fpga.std.all;
use hdl4fpga.profiles.all;
use hdl4fpga.sdr_db.all;
use hdl4fpga.sdr_param.all;

entity sdr_ctlr is
	generic (
		debug        : boolean := false;

		tcp          : real := 0.0;
		fpga         : fpga_devices;
		chip         : sdram_chips;

		cmmd_gear    : natural :=  1;
		bank_size    : natural :=  2;
		addr_size    : natural := 13;
		sclk_phases  : natural :=  4;
		sclk_edges   : natural :=  2;
		data_phases  : natural :=  2;
		data_edges   : natural :=  2;
		data_gear    : natural :=  2;
		word_size    : natural := 16;
		byte_size    : natural :=  8);
	port (
		ctlr_alat    : out std_logic_vector(2 downto 0);
		ctlr_blat    : out std_logic_vector(2 downto 0);
		ctlr_bl      : in std_logic_vector(2 downto 0);
		ctlr_cl      : in std_logic_vector(2 downto 0);
		ctlr_cwl     : in std_logic_vector(2 downto 0);
		ctlr_wrl     : in std_logic_vector(2 downto 0);
		ctlr_rtt     : in std_logic_vector;

		ctlr_rst     : in std_logic;
		ctlr_clks    : in std_logic_vector(0 to sclk_phases/sclk_edges-1);
		ctlr_cfgrdy  : out std_logic;
		ctlr_inirdy  : out std_logic;

		ctlr_frm     : in  std_logic;
		ctlr_trdy    : out std_logic;
		ctlr_fch     : out std_logic;
		ctlr_cmd     : out std_logic_vector(0 to 2);
		ctlr_rw      : in  std_logic;
		ctlr_b       : in  std_logic_vector(bank_size-1 downto 0);
		ctlr_a       : in  std_logic_vector(addr_size-1 downto 0);
		ctlr_di_dv   : in  std_logic;
		ctlr_di_req  : out std_logic;
		ctlr_do_dv   : out std_logic_vector(data_phases*word_size/byte_size-1 downto 0);
		ctlr_do_req  : out std_logic;
		ctlr_dio_req : out std_logic;
		ctlr_act     : out std_logic;
		ctlr_ras     : out std_logic;
		ctlr_cas     : out std_logic;
		ctlr_dm      : in  std_logic_vector(data_gear*word_size/byte_size-1 downto 0) := (others => '0');
		ctlr_di      : in  std_logic_vector(data_gear*word_size-1 downto 0);
		ctlr_do      : out std_logic_vector(data_gear*word_size-1 downto 0);
		ctlr_refreq  : out std_logic;
		phy_frm      : in  std_logic := '0';
		phy_trdy     : out std_logic;
		phy_rw       : in  std_logic := '-';
		phy_inirdy   : in  std_logic := '1';
		phy_wlrdy    : in  std_logic := '-';
		phy_wlreq    : out std_logic;
		phy_rlreq    : out std_logic;
		phy_rlrdy    : in  std_logic := '1';
		phy_rst      : out std_logic;
		phy_cke      : out std_logic;
		phy_cs       : out std_logic;
		phy_ras      : out std_logic;
		phy_cas      : out std_logic;
		phy_we       : out std_logic;
		phy_b        : out std_logic_vector(bank_size-1 downto 0);
		phy_a        : out std_logic_vector(addr_size-1 downto 0);
		phy_odt      : out std_logic;
		phy_dmi      : in  std_logic_vector(data_gear*word_size/byte_size-1 downto 0);
		phy_dmt      : out std_logic_vector(data_gear*word_size/byte_size-1 downto 0);
		phy_dmo      : out std_logic_vector(data_gear*word_size/byte_size-1 downto 0);

		phy_dqi      : in  std_logic_vector(data_gear*word_size-1 downto 0);
		phy_dqt      : out std_logic_vector(data_gear*word_size/byte_size-1 downto 0);
		phy_dqo      : out std_logic_vector(data_gear*word_size-1 downto 0);
		phy_sti      : in  std_logic_vector(data_phases*word_size/byte_size-1 downto 0);
		phy_sto      : out std_logic_vector(data_gear*word_size/byte_size-1 downto 0);

		phy_dqsi     : in  std_logic_vector(data_phases*word_size/byte_size-1 downto 0);
		phy_dqso     : out std_logic_vector(data_gear*word_size/byte_size-1 downto 0);
		phy_dqst     : out std_logic_vector(data_gear*word_size/byte_size-1 downto 0));

end;

library hdl4fpga;
use hdl4fpga.std.all;

architecture mix of sdr_ctlr is

	function sdr_rotval (
		constant LINE_SIZE : natural;
		constant WORD_SIZE : natural;
		constant lat_val : std_logic_vector;
		constant lat_cod : std_logic_vector;
		constant lat_tab : natural_vector)
		return std_logic_vector is

		subtype word is std_logic_vector(unsigned_num_bits(LINE_SIZE/WORD_SIZE-1)-1 downto 0);
		type word_vector is array(natural range <>) of word;

		subtype latword is std_logic_vector(0 to lat_val'length-1);
		type latword_vector is array (natural range <>) of latword;

		constant algn : natural := unsigned_num_bits(WORD_SIZE-1);

		function to_latwordvector(
			constant arg : std_logic_vector)
			return latword_vector is
			variable aux : unsigned(0 to arg'length-1);
			variable val : latword_vector(0 to arg'length/latword'length-1);
		begin
			aux := unsigned(arg);
			for i in val'range loop
				val(i) := std_logic_vector(aux(latword'range));
				aux := aux sll latword'length;
			end loop;
			return val;
		end;

		function select_lat (
			constant lat_val : std_logic_vector;
			constant lat_cod : latword_vector;
			constant lat_sch : word_vector)
			return std_logic_vector is
			variable val : word;
		begin
			val := (others => '-');
			for i in 0 to lat_tab'length-1 loop
				if lat_val = lat_cod(i) then
					for j in word'range loop
						val(j) := lat_sch(i)(j);
					end loop;
				end if;
			end loop;
			return val;
		end;

		constant lc   : latword_vector := to_latwordvector(lat_cod);

		variable sel_sch : word_vector(lc'range);
		variable val : unsigned(unsigned_num_bits(LINE_SIZE-1)-1 downto 0) := (others => '0');
		variable disp : natural;

	begin

		setup_l : for i in 0 to lat_tab'length-1 loop
			sel_sch(i) := std_logic_vector(to_unsigned(lat_tab(i) mod (LINE_SIZE/WORD_SIZE), word'length));
		end loop;

		val(word'range) := unsigned(select_lat(lat_val, lc, sel_sch));
		val := val sll algn;
		return std_logic_vector(val);
	end;

	constant stdr    : sdr_standards    := sdrmark_standard(chip);

	constant bl_cod  : std_logic_vector := sdr_latcod(stdr, bl);
	constant cl_cod  : std_logic_vector := sdr_latcod(stdr, cl);
	constant cwl_cod : std_logic_vector := sdr_latcod(stdr, cwl); --sdr_selcwl(stdr));


	subtype byte is std_logic_vector(0 to byte_size-1);
	type byte_vector is array (natural range <>) of byte;

	signal sdr_refi_rdy   : std_logic;
	signal sdr_refi_req   : std_logic;
	signal sdr_init_rst   : std_logic;
	signal sdr_init_cke   : std_logic;
	signal sdr_init_cs    : std_logic;
	signal sdr_init_req   : std_logic;
	signal sdr_init_rdy   : std_logic;
	signal sdr_init_ras   : std_logic;
	signal sdr_init_cas   : std_logic;
	signal sdr_init_we    : std_logic;
	signal sdr_init_odt   : std_logic;
	signal sdr_init_a     : std_logic_vector(addr_size-1 downto 0);
	signal sdr_init_b     : std_logic_vector(bank_size-1 downto 0);

	signal sdr_pgm_frm    : std_logic;
	signal sdr_pgm_rw     : std_logic;
	signal sdr_pgm_cmd    : std_logic_vector(0 to 2);

	signal sdr_mpu_rst    : std_logic;
	signal sdr_mpu_trdy   : std_logic;
	signal sdr_mpu_ras    : std_logic;
	signal sdr_mpu_cas    : std_logic;
	signal sdr_mpu_we     : std_logic;
	signal sdr_mpu_wri    : std_logic;
	signal sdr_mpu_rea    : std_logic;
	signal sdr_mpu_rwin   : std_logic;
	signal sdr_mpu_wwin   : std_logic;
	signal sdr_mpu_rwwin  : std_logic;

	signal sdr_sch_odt    : std_logic_vector(0 to cmmd_gear-1);
	signal sdr_sch_dqsz   : std_logic_vector(0 to data_gear-1);
	signal sdr_sch_dqs    : std_logic_vector(sdr_sch_dqsz'range);
	signal sdr_sch_dqz    : std_logic_vector(sdr_sch_dqsz'range);
	signal sdr_sch_st     : std_logic_vector(sdr_sch_dqsz'range);
	signal sdr_sch_wwn    : std_logic_vector(0 to data_gear-1);
	signal sdr_sch_rwn    : std_logic_vector(sdr_sch_dqsz'range);
	signal sdr_wclks      : std_logic_vector(0 to data_phases*word_size/byte_size-1);
	signal sdr_wenas      : std_logic_vector(0 to data_phases*word_size/byte_size-1);

	signal sdr_win_dqs    : std_logic_vector(phy_dqsi'range);
	signal sdr_win_dq     : std_logic_vector(phy_dqsi'range);
	signal sdr_wr_dm      : std_logic_vector(ctlr_dm'range);

	signal rot_val        : std_logic_vector(unsigned_num_bits(data_gear*word_size-1)-1 downto 0);
	signal rot_di         : std_logic_vector(ctlr_di'range);

	signal sdr_cwl        : std_logic_vector(ctlr_cwl'range);

	signal sdr_mr_addr    : std_logic_vector(3-1 downto 0);
	signal sdr_mr_data    : std_logic_vector(13-1 downto 0);
	signal sdr_mpu_sel    : std_logic;
	signal init_rdy       : std_logic;


	signal refreq : std_logic;
	signal fifo_bypass : std_logic;
begin

	ctlr_trdy    <= sdr_mpu_trdy when phy_inirdy='1' else '0';
	phy_trdy     <= sdr_mpu_trdy when phy_inirdy='0' else '0';
	sdr_pgm_frm  <= ctlr_frm     when phy_inirdy='1' else phy_frm;
	sdr_pgm_rw   <= ctlr_rw      when phy_inirdy='1' else phy_rw;
	sdr_cwl      <= ctlr_cl      when stdr=ddr2      else ctlr_cwl;
	sdr_init_req <= ctlr_rst;

	sdr_init_e : entity hdl4fpga.sdr_init
	generic map (
		debug          => debug,
		tcp            => tcp,
		fpga           => fpga,
		chip           => chip,

		addr_size      => addr_size,
		bank_size      => bank_size)
	port map (
		sdr_init_bl    => ctlr_bl,
		sdr_init_cl    => ctlr_cl,
		sdr_init_cwl   => sdr_cwl,
		sdr_init_bt    => "0",
		sdr_init_ods   => "0",
		sdr_init_wr    => ctlr_wrl,
		sdr_init_rtt   => ctlr_rtt,

		sdr_init_clk   => ctlr_clks(0),
		sdr_init_req   => sdr_init_req,
		sdr_init_rdy   => sdr_init_rdy,
		sdr_init_rst   => sdr_init_rst,
		sdr_init_cke   => sdr_init_cke,
		sdr_init_cs    => sdr_init_cs,
		sdr_init_ras   => sdr_init_ras,
		sdr_init_cas   => sdr_init_cas,
		sdr_init_we    => sdr_init_we,
		sdr_init_a     => sdr_init_a,
		sdr_init_b     => sdr_init_b,
		sdr_init_odt   => sdr_init_odt,
		sdr_init_wlreq => phy_wlreq,
		sdr_init_wlrdy => phy_wlrdy,
		sdr_refi_req   => sdr_refi_req,
		sdr_refi_rdy   => sdr_refi_rdy);

	init_rdy    <= sdr_init_rdy;
	phy_rst     <= sdr_init_rst;
	phy_cke     <= sdr_init_cke;
	phy_cs      <= '0'          when sdr_mpu_sel='1' else sdr_init_cs;
	phy_ras     <= sdr_mpu_ras  when sdr_mpu_sel='1' else sdr_init_ras;
	phy_cas     <= sdr_mpu_cas  when sdr_mpu_sel='1' else sdr_init_cas;
	phy_we      <= sdr_mpu_we   when sdr_mpu_sel='1' else sdr_init_we;
	phy_a       <= ctlr_a       when sdr_mpu_sel='1' else sdr_init_a;
	phy_b       <= ctlr_b       when sdr_mpu_sel='1' else sdr_init_b;
	phy_odt     <= sdr_init_odt when sdr_mpu_sel='0' else sdr_sch_odt(0) when stdr=ddr3 else '1';
	phy_rlreq   <= init_rdy;
	ctlr_cfgrdy <= init_rdy;
	ctlr_inirdy <= init_rdy when phy_inirdy='1' else '0';

	sdr_pgm_e : entity hdl4fpga.sdr_pgm
	generic map (
		cmmd_gear     => cmmd_gear)
	port map (
		ctlr_clk      => ctlr_clks(0),
		ctlr_rst      => sdr_mpu_rst,
		ctlr_refreq   => ctlr_refreq,
		sdr_pgm_frm   => sdr_pgm_frm ,
		sdr_mpu_trdy  => sdr_mpu_trdy,
		sdr_pgm_cmd   => sdr_pgm_cmd,
		sdr_pgm_rw    => sdr_pgm_rw,
		sdr_ref_req   => sdr_refi_req,
		sdr_ref_rdy   => sdr_refi_rdy);

	sdr_mpu_rst <= not init_rdy;
	sdr_mpu_sel <= init_rdy;
	sdr_mpu_e : entity hdl4fpga.sdr_mpu
	generic map (
		tcp           => tcp,
		fpga          => fpga,
		chip          => chip,

		gear          => data_gear,
		bl_cod        => bl_cod,
		cl_cod        => cl_cod,
		cwl_cod       => cwl_cod)
	port map (
		sdr_mpu_bl    => ctlr_bl,
		sdr_mpu_cl    => ctlr_cl,
		sdr_mpu_cwl   => sdr_cwl,

		sdr_mpu_rst   => sdr_mpu_rst,
		sdr_mpu_clk   => ctlr_clks(0),
		sdr_mpu_cmd   => sdr_pgm_cmd,
		sdr_mpu_trdy  => sdr_mpu_trdy,
		sdr_mpu_fch   => ctlr_fch,
		sdr_mpu_act   => ctlr_act,
		sdr_mpu_cas   => sdr_mpu_cas,
		sdr_mpu_ras   => sdr_mpu_ras,
		sdr_mpu_alat  => ctlr_alat,
		sdr_mpu_blat  => ctlr_blat,
		sdr_mpu_we    => sdr_mpu_we,
		sdr_mpu_rea   => sdr_mpu_rea,
		sdr_mpu_wri   => sdr_mpu_wri,
		sdr_mpu_rwin  => sdr_mpu_rwin,
		sdr_mpu_wwin  => sdr_mpu_wwin,
		sdr_mpu_rwwin => sdr_mpu_rwwin);

	ctlr_cmd     <= sdr_pgm_cmd;
	ctlr_di_req  <= sdr_mpu_wwin;
	ctlr_do_req  <= sdr_mpu_rwin;
	ctlr_dio_req <= sdr_mpu_rwwin;

	sdr_sch_e : entity hdl4fpga.sdr_sch
	generic map (
		tcp         => tcp,
		fpga        => fpga,
		chip        => chip,

		cmmd_gear   => cmmd_gear,
		data_phases => data_phases,
		clk_phases  => sclk_phases,
		clk_edges   => sclk_edges,
		data_gear   => data_gear,
		cl_cod      => cl_cod,
		cwl_cod     => cwl_cod)
	port map (
		sys_cl      => ctlr_cl,
		sys_cwl     => sdr_cwl,
		sys_clks    => ctlr_clks,
		sys_rea     => sdr_mpu_rwin,
		sys_wri     => sdr_mpu_wwin,

		sdr_rwn     => sdr_sch_rwn,
		sdr_st      => sdr_sch_st,

		sdr_dqsz    => sdr_sch_dqsz,
		sdr_dqs     => sdr_sch_dqs,
		sdr_dqz     => sdr_sch_dqz,
		sdr_odt     => sdr_sch_odt,
		sdr_wwn     => sdr_sch_wwn);

	sdr_win_dqs <= phy_sti;
	sdr_win_dq  <= (others => sdr_sch_rwn(0));

	process (
		sdr_wr_dm,
		sdr_sch_st,
		sdr_sch_dqz,
		sdr_sch_dqs,
		sdr_sch_dqsz,
		sdr_sch_rwn,
		sdr_sch_wwn)
	begin
		for i in 0 to word_size/byte_size-1 loop
			for j in 0 to data_gear-1 loop
				phy_dqt(i*data_gear+j)  <= sdr_sch_dqz(j);
				phy_dmt(i*data_gear+j)  <= reverse(sdr_sch_dqz)(j);
				phy_dqso(i*data_gear+j) <= sdr_sch_dqs(j);
				phy_dqst(i*data_gear+j) <= not sdr_sch_dqsz(j);
				phy_sto(i*data_gear+j)  <= reverse(sdr_sch_st)(j);
				phy_dmo(i*data_gear+j)  <= sdr_wr_dm(i*data_gear+j);
			end loop;
			for j in 0 to data_phases-1 loop
				sdr_wenas(i*data_phases+j) <= sdr_sch_wwn(j);
			end loop;
		end loop;
	end process;

	rdfifo_i : entity hdl4fpga.sdr_rdfifo
	generic map (
		data_phases => data_phases,
		data_gear   => data_gear,
		word_size   => word_size,
		byte_size   => byte_size,
		data_delay  => sdr_latency(fpga, rdfifo_lat))
	port map (
		sys_clk     => ctlr_clks(0),
		sys_rdy     => ctlr_do_dv,
		sys_rea     => sdr_mpu_rea,
		sys_do      => ctlr_do,
		sdr_win_dq  => sdr_win_dq,
		sdr_win_dqs => sdr_win_dqs,
		sdr_dqsi    => phy_dqsi,
		sdr_dqi     => phy_dqi);

	sdr_rotval_p : process(ctlr_cwl)
		function sdr_rotval (
			constant LINE_SIZE : natural;
			constant WORD_SIZE : natural;
			constant lat_val : std_logic_vector;
			constant lat_cod : std_logic_vector;
			constant lat_tab : natural_vector)
			return std_logic_vector is
	
			subtype word is std_logic_vector(unsigned_num_bits(LINE_SIZE/WORD_SIZE-1)-1 downto 0);
			type word_vector is array(natural range <>) of word;
	
			subtype latword is std_logic_vector(0 to lat_val'length-1);
			type latword_vector is array (natural range <>) of latword;
	
			constant algn : natural := unsigned_num_bits(WORD_SIZE-1);
	
			function to_latwordvector(
				constant arg : std_logic_vector)
				return latword_vector is
				variable aux : unsigned(0 to arg'length-1);
				variable val : latword_vector(0 to arg'length/latword'length-1);
			begin
				aux := unsigned(arg);
				for i in val'range loop
					val(i) := std_logic_vector(aux(latword'range));
					aux := aux sll latword'length;
				end loop;
				return val;
			end;
	
			function select_lat (
				constant lat_val : std_logic_vector;
				constant lat_cod : latword_vector;
				constant lat_sch : word_vector)
				return std_logic_vector is
				variable val : word;
			begin
				val := (others => '-');
				for i in 0 to lat_tab'length-1 loop
					if lat_val = lat_cod(i) then
						for j in word'range loop
							val(j) := lat_sch(i)(j);
						end loop;
					end if;
				end loop;
				return val;
			end;
	
			constant lc   : latword_vector := to_latwordvector(lat_cod);
	
			variable sel_sch : word_vector(lc'range);
			variable val : unsigned(unsigned_num_bits(LINE_SIZE-1)-1 downto 0) := (others => '0');
			variable disp : natural;
	
		begin
	
			setup_l : for i in 0 to lat_tab'length-1 loop
				sel_sch(i) := std_logic_vector(to_unsigned(lat_tab(i) mod (LINE_SIZE/WORD_SIZE), word'length));
			end loop;
	
			val(word'range) := unsigned(select_lat(lat_val, lc, sel_sch));
			val := val sll algn;
			return std_logic_vector(val);
		end;

	begin
		rot_val <= sdr_rotval (
			line_size => data_gear*word_size,
			word_size => word_size,
			lat_val   => ctlr_cwl,
			lat_cod   => cwl_cod,
			lat_tab   => sdr_schtab(stdr, fpga, wwnl)); --wwnl_tab);
	end process;

	rotate_i : entity hdl4fpga.barrel
	port map (
		shf => rot_val,
		di  => ctlr_di,
		do  => rot_di);

	process (ctlr_clks(ctlr_clks'high))
	begin
		for k in 0 to word_size/byte_size-1 loop
			for i in 0 to data_phases-1 loop
				sdr_wclks(k*data_phases+i) <= ctlr_clks(ctlr_clks'high);
				if data_edges > 1 then
					sdr_wclks(k*data_phases+1) <= not ctlr_clks(ctlr_clks'high);
				end if;
			end loop;
		end loop;
	end process;

	wrfifo_b : block
		signal bypass : std_logic;
		signal dqo    : std_logic_vector(phy_dqo'range);
		signal dmo    : std_logic_vector(sdr_wr_dm'range);
	begin
		bypass <= '1' when stdr=sdr else '0';

		wrfifo_i : entity hdl4fpga.sdr_wrfifo
		generic map (
			data_phases => data_phases,
			data_gear   => data_gear,
			word_size   => word_size,
			byte_size   => byte_size)
		port map (
			ctlr_clk    => ctlr_clks(0),
			ctlr_dqi    => rot_di,
			ctlr_ena    => ctlr_di_dv,
			ctlr_req    => sdr_mpu_wri,
			ctlr_dmi    => ctlr_dm,
			sdr_clks    => sdr_wclks,
			sdr_dmo     => dmo,
			sdr_enas    => sdr_wenas,
			sdr_dqo     => dqo);

		phy_dqo   <= rot_di  when bypass='1' else dqo;
		sdr_wr_dm <= ctlr_dm when bypass='1' else dmo;
	end block;

end;