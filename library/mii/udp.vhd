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
use hdl4fpga.ethpkg.all;
use hdl4fpga.ipoepkg.all;

entity udp is
	port (
		mii_clk       : in  std_logic;
		dhcpcd_req    : in  std_logic := '0';
		dhcpcd_rdy    : out std_logic := '0';

		udprx_frm     : in  std_logic;
		udprx_irdy    : in  std_logic;
		udprx_data    : in  std_logic_vector;

		plrx_frm      : buffer std_logic;
		plrx_irdy     : out std_logic;
		plrx_trdy     : in  std_logic;
		plrx_cmmt     : out std_logic;
		plrx_rllbk    : out std_logic;
		plrx_data     : out std_logic_vector;

		pltx_frm      : in  std_logic;
		pltx_irdy     : in  std_logic;
		pltx_trdy     : out std_logic;
		pltx_data     : in  std_logic_vector;
		pltx_end      : in  std_logic;

		ipv4sawr_frm  : out std_logic := '0';
		ipv4sawr_irdy : out std_logic := '0';
		ipv4sawr_data : out std_logic_vector;

		mactx_full    : in  std_logic := '1';
		ipsatx_full   : in  std_logic;
		ipdatx_full   : in  std_logic;
		iplentx_irdy  : out std_logic;
		iplentx_full  : in  std_logic;

		udptx_frm     : out std_logic;
		udptx_irdy    : out std_logic;
		udptx_trdy    : in  std_logic;
		udptx_end     : out std_logic;
		udptx_data    : out std_logic_vector;

		tp : out std_logic_vector(1 to 32)
	);
end;

architecture def of udp is

	signal udpsprx_last   : std_logic;
	signal udpsprx_equ    : std_logic;
	signal udpsprx_vld    : std_logic;

	signal udpsprx_irdy   : std_logic;
	signal udpdprx_irdy   : std_logic;
	signal udplenrx_irdy  : std_logic;
	signal udpcksmrx_irdy : std_logic;
	signal udpplrx_frm    : std_logic;
	signal udpplrx_irdy   : std_logic;

	signal dhcpcrx_frm    : std_logic;
	signal dhcpctx_frm    : std_logic;
	signal dhcpctx_irdy   : std_logic;
	signal dhcpctx_trdy   : std_logic;
	signal dhcpctx_end    : std_logic;
	signal dhcpctx_data   : std_logic_vector(udptx_data'range);

	signal udphdr_irdy    : std_logic;
	signal udphdr_trdy    : std_logic;
	signal udphdr_end     : std_logic;
	signal udphdr_data    : std_logic_vector(pltx_data'range);
	signal udppltx_frm    : std_logic;
	signal udppltx_irdy   : std_logic;
	signal udppltx_trdy   : std_logic;
	signal udppltx_end    : std_logic;
	signal udppltx_data   : std_logic_vector(udptx_data'range);
	signal ppltx_data     : std_logic_vector(udptx_data'range);

	signal udplentx_trdy  : std_logic;
	signal udplentx_end   : std_logic;
	signal udplentx_data  : std_logic_vector(udptx_data'range);

	signal dhcplentx_end  : std_logic;

	signal udplentx_full     : std_logic;
	signal dhcpcdipdatx_irdy : std_logic;
	signal dhcpcdmactx_irdy  : std_logic;
	signal udpmactx_irdy     : std_logic;
	signal udpipdatx_irdy    : std_logic;
	signal udpiplentx_irdy   : std_logic;
	signal dhcpciplentx_irdy : std_logic;

begin

	udp_rx_e : entity hdl4fpga.udp_rx
	port map (
		mii_clk      => mii_clk,
		udp_frm      => udprx_frm,
		udp_irdy     => udprx_irdy,
		udp_data     => udprx_data,

		udpsp_irdy   => udpsprx_irdy,
		udpdp_irdy   => udpdprx_irdy,
		udplen_irdy  => udplenrx_irdy,
		udpcksm_irdy => udpcksmrx_irdy,
		udppl_frm    => udpplrx_frm,
		udppl_irdy   => udpplrx_irdy);

	arbiter_b : block
		signal dev_req : std_logic_vector(0 to 2-1);
		signal dev_gnt : std_logic_vector(0 to 2-1);
	begin

		dev_req <= dhcpctx_frm & pltx_frm;
		arbiter_e : entity hdl4fpga.arbiter
		port map (
			clk => mii_clk,
			req => dev_req,
			gnt => dev_gnt);

		udptx_frm    <= wirebus(dhcpctx_frm       & pltx_frm,     dev_gnt)(0);
		udptx_irdy   <= wirebus(dhcpctx_irdy      & pltx_irdy,    dev_gnt)(0);
		udptx_end    <= wirebus(dhcpctx_end       & udppltx_end,  dev_gnt)(0);
		udptx_data   <= wirebus(dhcpctx_data      & udppltx_data, dev_gnt);
		iplentx_irdy <= wirebus(dhcpciplentx_irdy & udpiplentx_irdy, dev_gnt)(0);
		(0 => dhcpctx_trdy, 1 => udppltx_trdy) <= dev_gnt and (dev_gnt'range => udptx_trdy); 
	end block;

	meta_b : block

		signal cksm_irdy  : std_logic;
		signal cksm_end   : std_logic;
		signal cksm_data  : std_logic_vector(pltx_data'range);

		signal lenrx_irdy : std_logic;
		signal lentx_irdy : std_logic;
		signal len_end    : std_logic;
		signal len_datai  : std_logic_vector(pltx_data'range);
		signal len_data   : std_logic_vector(pltx_data'range);

		signal sprx_irdy  : std_logic;
		signal sptx_irdy  : std_logic;
		signal sp_end     : std_logic;
		signal sp_full    : std_logic;
		signal sp_data    : std_logic_vector(pltx_data'range);

		signal dprx_irdy  : std_logic;
		signal dptx_irdy  : std_logic;
		signal dp_end     : std_logic;
		signal dp_full    : std_logic;
		signal dp_data    : std_logic_vector(pltx_data'range);

	begin

		dprx_irdy <= '0' when ipdatx_full='0' else pltx_irdy;
		udpiplentx_irdy <= '0' when sp_full='0' else pltx_irdy;
		udpdp_e : entity hdl4fpga.sio_ram
		generic map (
			mem_length => 16)
		port map (
			si_clk  => mii_clk,
			si_frm  => pltx_frm,
			si_irdy => dprx_irdy,
			si_trdy => open,
			si_full => dp_full,
			si_data => pltx_data,

			so_clk  => mii_clk,
			so_frm  => pltx_frm,
			so_irdy => dptx_irdy,
			so_trdy => open,
			so_end  => dp_end,
			so_data => dp_data);

		sprx_irdy <= '0' when dp_full='0' else pltx_irdy;
		udpsp_e : entity hdl4fpga.sio_ram
		generic map (
			mem_length => 16)
		port map (
			si_clk   => mii_clk,
			si_frm   => pltx_frm,
			si_irdy  => sprx_irdy,
			si_trdy  => open,
			si_full  => sp_full,
			si_data  => pltx_data,

			so_clk   => mii_clk,
			so_frm   => pltx_frm,
			so_irdy  => sptx_irdy,
			so_trdy  => open,
			so_end   => sp_end,
			so_data  => sp_data);

		len_b : block
			signal tx_ci      : std_logic;
			signal tx_co      : std_logic;
			signal crtn_data  : std_logic_vector(pltx_data'range);
			signal datao      : std_logic_vector(0 to 16-1);
			signal datai      : std_logic_vector(0 to 16-1);
		begin

			lenrx_irdy <= '0' when sp_full='0' else pltx_irdy;
			crtnmux_e : entity hdl4fpga.sio_mux
			port map (
				mux_data => reverse(reverse(std_logic_vector(to_unsigned((summation(udp4hdr_frame)/octect_size),16))), crtn_data'length),
				sio_clk  => mii_clk,
				sio_frm  => pltx_frm,
				sio_irdy => lenrx_irdy,
				sio_trdy => open,
				so_data  => crtn_data);

			adder_e : entity hdl4fpga.adder
			port map (
				ci  => tx_ci,
				a   => pltx_data,
				b   => crtn_data,
				s   => len_datai,
				co  => tx_co);

			cy_p : process (mii_clk)
			begin
				if rising_edge(mii_clk) then
					if pltx_frm='0' then
						tx_ci <= '0';
					elsif pltx_irdy='1' then
						tx_ci <= tx_co;
					end if;
				end if;
			end process;

			rgtr_e : entity hdl4fpga.sio_ff
			port map (
				si_clk  => mii_clk,
				si_frm  => pltx_frm,
				si_irdy => lenrx_irdy,
				si_trdy => open,
				si_full => udplentx_full,
				si_data => len_datai,
				so_data => datai);

			datao <= reverse(datai,8);
			mux_e : entity hdl4fpga.sio_mux
			port map (
				mux_data => datao,
				sio_clk  => mii_clk,
				sio_frm  => pltx_frm,
				sio_irdy => lentx_irdy,
				sio_trdy => open,
				so_end   => len_end,
				so_data  => len_data);

			ppltx_data <= 
				pltx_data when sp_full='0'  else 
				len_datai when udplentx_full='0' else
				pltx_data;

		end block;

		dptx_irdy  <= udphdr_trdy;
		sptx_irdy  <= '0' when dp_end='0'  else udphdr_trdy;
		lentx_irdy <= '0' when sp_end='0'  else udphdr_trdy;
		cksm_irdy  <= '0' when len_end='0' else udphdr_trdy;

		udpcksm_e : entity hdl4fpga.sio_mux
		port map (
			mux_data => x"0000",
			sio_clk  => mii_clk,
			sio_frm  => pltx_frm,
			sio_irdy => cksm_irdy,
			sio_trdy => open,
			so_end   => cksm_end,
			so_data  => cksm_data);

		udphdr_data <= 
		  dp_data   when dp_end='0'   else
		  sp_data   when sp_end='0'   else
		  len_data  when len_end='0'  else
		  cksm_data when cksm_end='0' else
		  (others => '-');

		udphdr_irdy <= pltx_irdy;
		udphdr_end  <= cksm_end;
	end block;

	udptx_e : entity hdl4fpga.udp_tx
	port map (
		mii_clk    => mii_clk,

		pl_frm     => udppltx_frm,
		pl_irdy    => pltx_irdy,
		pl_trdy    => pltx_trdy,
		pl_end     => pltx_end,
		pl_data    => ppltx_data,

		hdr_irdy   => udphdr_irdy,
		hdr_trdy   => udphdr_trdy,
		hdr_end    => udphdr_end,
		hdr_data   => udphdr_data,

		udp_irdy   => udppltx_irdy,
		metatx_end => udplentx_full,
		udp_trdy   => udppltx_trdy,
		udp_end    => udppltx_end,
		udp_data   => udppltx_data);

	udpc_e : entity hdl4fpga.sio_muxcmp
    port map (
		mux_data  => reverse(x"0043",8),
        sio_clk   => mii_clk,
        sio_frm   => udprx_frm,
        sio_irdy  => udpdprx_irdy,
        sio_trdy  => open,
        si_data   => udprx_data,
		so_last   => udpsprx_last,
		so_equ(0) => udpsprx_equ);

	process (mii_clk)
	begin
		if rising_edge(mii_clk) then
			if udprx_frm='0' then
				udpsprx_vld <= '0';
			elsif udpsprx_last='1' and udprx_irdy='1' then
				udpsprx_vld <= udpsprx_equ;
			end if;
		end if;
	end process;
	dhcpcrx_frm <= udpplrx_frm and udpsprx_vld;
	plrx_frm    <= udpplrx_frm and not udpsprx_vld;
	plrx_rllbk  <= dhcpcrx_frm;
	plrx_cmmt   <= plrx_frm;
	plrx_irdy   <= (udprx_frm and (udpsprx_irdy or udpdprx_irdy)) or (udpplrx_frm and udprx_irdy);
	plrx_data   <= udprx_data;

	dhcpcd_e: entity hdl4fpga.dhcpcd
	port map (
		mii_clk       => mii_clk,
		dhcpcdrx_frm  => dhcpcrx_frm,
		dhcpcdrx_irdy => udprx_irdy,
		dhcpcdrx_data => udprx_data,
		dhcpcd_req    => dhcpcd_req,
		dhcpcd_rdy    => dhcpcd_rdy,

		dhcpcdtx_frm  => dhcpctx_frm,
		mactx_full    => mactx_full,
		ipdatx_full   => ipdatx_full,
		ipsatx_full   => ipsatx_full,
		udplentx_full => iplentx_full,
		ipv4sawr_frm  => ipv4sawr_frm,
		ipv4sawr_irdy => ipv4sawr_irdy,
		ipv4sawr_data => ipv4sawr_data,

		dhcpcdtx_irdy => dhcpctx_irdy,
		dhcpcdtx_trdy => dhcpctx_trdy,
		dhcpcdtx_end  => dhcpctx_end,
		dhcpcdtx_data => dhcpctx_data,
	tp => tp);

	dhcpciplentx_irdy <= '0' when ipdatx_full='0' else dhcpctx_irdy;
end;
