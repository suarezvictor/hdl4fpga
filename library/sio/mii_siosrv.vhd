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

entity mii_siosrv is
	generic (
		mysrv_port    : std_logic_vector(0 to 16-1));
	port (
		mii_txc       : in  std_logic;

		dll_rxdv      : in  std_logic;
		dll_rxd       : in  std_logic_vector;

		dllhwsa_rx    : in  std_logic_vector(0 to 48-1);
		dllfcs_vld    : in  std_logic;

		ipv4sa_rx     : in  std_logic_vector(0 to 32-1);

		udpdp_rxdv    : in  std_logic;
		udppl_rxdv    : in  std_logic;

		udpsp_rx      : in  std_logic_vector(0 to 16-1);

		tx_req        : out std_logic := '0';
		tx_rdy        : in  std_logic;
		tx_gnt        : in  std_logic;

		dll_hwda      : out std_logic_vector(0 to 48-1) := (others => '-');
		ipv4_da       : out std_logic_vector(0 to 32-1) := (others => '-');
		udppl_len     : out std_logic_vector(0 to 16-1) := (others => '-');
		udp_dp        : out std_logic_vector(0 to 16-1) := (others => '-');
		udp_sp        : out std_logic_vector(0 to 16-1);
		myport_rcvd   : buffer std_logic;

		udppl_txen    : buffer std_logic;
		udppl_txd     : out std_logic_vector;

		usr_req       : in  std_logic;
		usr_gnt       : out std_logic;
		usr_rdy       : out std_logic;
		usr_ack       : in  std_logic_vector(8-1 downto 0);
		usr_hwda      : in  std_logic_vector(48-1 downto 0);
		usr_ipv4da    : in  std_logic_vector(32-1 downto 0);
		usr_udpdp     : in  std_logic_vector(16-1 downto 0);
		usr_udplen    : in  std_logic_vector(16-1 downto 0);
		usr_txen      : in  std_logic := '0';
		usr_txd       : in  std_logic_vector;

		tp            : buffer std_logic_vector(1 to 4));

end;

architecture def of mii_siosrv is
	signal mysrv_rcvd   : std_logic;
	signal dllcrc32_eor : std_logic;

	signal rgtr_id      : std_logic_vector(8-1 downto 0);
	signal siosin_frm   : std_logic;
	signal octect_frm   : std_logic;
	signal octect_irdy  : std_logic;
	signal octect_data  : std_logic_vector(8-1 downto 0);
	signal sigsin_frm   : std_logic;
	signal sigrgtr_data : std_logic_vector(8-1 downto 0);
	signal sig_frm      : std_logic;
	signal sig_irdy     : std_logic;
	signal sigrgtr_id   : std_logic_vector(8-1 downto 0);
	signal sigrgtr_dv   : std_logic;
	signal ack_rgtr     : std_logic_vector(8-1 downto 0);
	signal ack_equ      : std_logic_vector(8-1 downto 0);
	signal ack_ena      : std_logic;
	signal ack_data     : std_logic_vector(0 to 40-1);

	signal mii_req      : std_logic_vector(0 to 2-1) := (others => '0');
	signal mii_rdy      : std_logic_vector(mii_req'range);
	signal mii_gnt      : std_logic_vector(mii_req'range);

	alias  srv_req      : std_logic is mii_req(0);
	alias  srv_rdy      : std_logic is mii_rdy(0);
	alias  srv_gnt      : std_logic is mii_gnt(0);
	signal ulat_txen    : std_logic;
	signal ulat_txd     : std_logic_vector(dll_rxd'range);
	signal ack_txen     : std_logic;
	signal ack_txd      : std_logic_vector(dll_rxd'range);
	
begin

	myport_e : entity hdl4fpga.mii_romcmp
	generic map (
		mem_data => reverse(mysrv_port,8))
	port map (
		mii_rxc  => mii_txc,
		mii_rxdv => dll_rxdv,
		mii_rxd  => dll_rxd,
		mii_ena  => udpdp_rxdv,
		mii_equ  => myport_rcvd);
	udp_sp <= mysrv_port;

	txgnt_e : entity hdl4fpga.arbiter
	port map (
		clk => mii_txc,
		csc => tx_gnt,
		req => mii_req,
		gnt => mii_gnt);

	tx_req <= setif(mii_req /= (mii_req'range => '0'));

	process (mii_txc)
	begin
		if rising_edge(mii_txc) then
			if usr_req='1' then
				if tx_gnt='0' then
					mii_req(1) <= '1';
				elsif mii_gnt(1)='0' then
					mii_req(1) <= '0';
				end if;
			else
				mii_req(1) <= '0';
			end if;
		end if;
	end process;

	mii_rdy <= mii_gnt and (mii_gnt'range => tx_rdy);
	usr_rdy <= mii_rdy(1);
	usr_gnt <= mii_gnt(1);

	udppl_len <= std_logic_vector(
		to_unsigned((ack_data'length+octect_size-1)/octect_size, udppl_len'length)+
		unsigned(wirebus(x"0000" & usr_udplen, mii_gnt)));
	ack_data <= x"00" & x"02" & x"00" & x"00" & wirebus((ack_rgtr or ack_equ) & usr_ack, mii_gnt);

	ulat_e : entity hdl4fpga.mii_latency
	generic map (
		latency => ack_data'length)
	port map (
		mii_txc  => mii_txc,
		lat_txen => usr_txen,
		lat_txd  => usr_txd,
		mii_txen => ulat_txen,
		mii_txd  => ulat_txd);

	ack_e : entity hdl4fpga.mii_mux
	port map (
		mux_data => ack_data,
		mii_txc  => mii_txc,
		mii_txdv => tx_gnt,
		mii_txen => ack_txen,
		mii_txd  => ack_txd);

	udppl_txen <= ack_txen or ulat_txen;
	udppl_txd  <= wirebus(ack_txd & ulat_txd, ack_txen & ulat_txen);
end;
