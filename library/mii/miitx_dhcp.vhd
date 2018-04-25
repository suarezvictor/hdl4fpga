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

entity miitx_dhcp is
	generic (
		mac_src   : std_logic_vector(0 to 48-1) := x"000000010203");
	port (
		mii_treq  : in  std_logic;
		mii_trdy  : out std_logic;
		mii_txc   : in  std_logic;
		mii_txdv  : out std_logic;
		mii_txd   : out std_logic_vector);
end;

architecture mix of miitx_dhcp is
	constant payload_size : natural := 44;

	constant mii_pre  : std_logic_vector := reverse(x"5555_5555_5555_55d5", 8);
	constant mii_data : std_logic_vector := reverse(
		x"ffffffffffff"	       &    
		mac_src                &    -- MAC Source Address
		x"0800"                &    -- MAC Protocol ID
		ipheader_checksumed(
			x"4500"            &    -- IP  Version, header length, TOS
			std_logic_vector(to_unsigned(payload_size+28,16)) &	-- IP  Length
			x"0000"            &    -- IP  Identification
			x"0000"            &    -- IP  Fragmentation
			x"0511"            &    -- IP  TTL, protocol
			x"0000"            &    -- IP  Checksum
			x"00000000"        &    -- IP  Source address
			x"ffffffff")       &    -- IP  Destination address
		x"00440043"            &    -- UDP Source port, Destination port
		std_logic_vector(to_unsigned(payload_size+8,16)) & -- UDP Length,
		x"0000"                &
		x"01010600"            &    -- OP, HTYPE, HLEN,  HOPS
		x"3903f326"            &    -- XID
		x"00000100"            &    -- SECS, FLAGS
		x"00000000"            &    -- CIADDR
		x"00000000"            &    -- YIADDR
		x"00000000"            &    -- SIADDR
		x"00000000"            &    -- GIADDR
		x"00000001"            &    -- CHADDR
		x"02030000"            &    -- CHADDR
		x"00000000"            &    -- CHADDR
		x"00000000", 8);            -- CHADDR

	constant mii_fcs : std_logic_vector := not galois_crc (mii_data, (1 to 32 => '1'), x"04c11db7");
	constant mii_pkt : std_logic_vector := mii_pre & mii_data & mii_fcs;

begin
	miitx_mem_e  : entity hdl4fpga.mii_mem
	generic map (
		mem_data => mii_pkt)
	port map (
		mii_txc  => mii_txc,
		mii_treq => mii_treq,
		mii_trdy => mii_trdy,
		mii_txen => mii_txdv,
		mii_txd  => mii_txd);

end;
