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

use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library hdl4fpga;
use hdl4fpga.std.all;
use hdl4fpga.ethpkg.all;
use hdl4fpga.ipoepkg.all;

entity ip4_tx is
	port (
		mii_txc  : in  std_logic;

		pl_len   : in  std_logic_vector(16-1 downto 0);
		pl_txen  : in  std_logic;
		pl_txd   : in  std_logic_vector;

		ip4sa    : in  std_logic_vector;
		ip4da    : in  std_logic_vector;

		ip4_ptr  : in  std_logic_vector;
		ip4_txen : buffer std_logic;
		ip4_txd  : out std_logic_vector);
end;

architecture def of ip4_tx is

	signal cksm_txd     : std_logic_vector(ip4_txd'range);
	signal cksm_txen    : std_logic;
	signal cksmd_txd    : std_logic_vector(ip4_txd'range);
	signal cksmd_txen   : std_logic;

	signal pllat_txd     : std_logic_vector(ip4_txd'range);
	signal pllat_txen    : std_logic;
	signal lenlat_txd    : std_logic_vector(ip4_txd'range);
	signal lenlat_txen   : std_logic;
	signal protolat_txd  : std_logic_vector(ip4_txd'range);
	signal protolat_txen : std_logic;
	signal alat_txd      : std_logic_vector(ip4_txd'range);
	signal alat_txen     : std_logic;
	signal lat_txd       : std_logic_vector(ip4_txd'range);
	signal lat_txen      : std_logic;

	signal ip4shdr_txen  : std_logic;
	signal ip4shdr_txd   : std_logic_vector(ip4_txd'range);
	signal ip4sa_txen  : std_logic;
	signal ip4sa_txd   : std_logic_vector(ip4_txd'range);
	signal ip4da_txen  : std_logic;
	signal ip4da_txd   : std_logic_vector(ip4_txd'range);
	signal ip4len_txen : std_logic;
	signal ip4len_txd  : std_logic_vector(ip4_txd'range);

	signal pkt_len     : std_logic_vector(0 to 16-1);

	constant myip4_len : natural :=  0;
	constant myip4_sa  : natural :=  1;
	constant myip4_da  : natural :=  2;

	constant myip4hdr_frame : natural_vector := (
		myip4_len => ip4hdr_frame(ip4_len),
		myip4_sa  => ip4hdr_frame(ip4_sa),
		myip4_da  => ip4hdr_frame(ip4_da));

begin

	process (pl_txen, pllat_txen, mii_txc)
		variable txen : std_logic := '0';
	begin
		if rising_edge(mii_txc) then
			if pl_txen='1' then
				txen := '1';
			elsif txen='1' then
				if pllat_txen='1' then
					txen := '0';
				end if;
			end if;
		end if;
		ip4_txen <= pl_txen or txen or pllat_txen;
	end process;

	ip4shdr_txen <= frame_decode(
		ip4_ptr,
	   	ip4hdr_frame, 
		ip4_txd'length,
	   	(ip4_verihl, ip4_tos, ip4_ident, ip4_flgsfrg, ip4_ttl, ip4_proto)) and pl_txen;

	ip4shdr_e : entity hdl4fpga.mii_rom
	generic map (
		mem_data => reverse(ip4_shdr,8))
	port map (
		mii_txc  => mii_txc,
		mii_txen => ip4shdr_txen,
		mii_txd  => ip4shdr_txd);

	pkt_len <= reverse(std_logic_vector(unsigned(pl_len) + (summation(ip4hdr_frame))/octect_size),8);
	ip4len_txen <= frame_decode(ip4_ptr, myip4hdr_frame, ip4_txd'length, myip4_len) and pl_txen;
	ip4len_e : entity hdl4fpga.mii_mux
	port map (
		mux_data => pkt_len,
        mii_txc  => mii_txc,
        mii_txdv => ip4len_txen,
        mii_txd  => ip4len_txd);

	ip4sa_txen <= frame_decode(ip4_ptr, myip4hdr_frame, ip4_txd'length, myip4_sa) and pl_txen;
	ip4sa_e : entity hdl4fpga.mii_mux
	port map (
		mux_data => ip4sa,
		mii_txc  => mii_txc,
		mii_txdv => ip4sa_txen,
		mii_txd  => ip4sa_txd);

	ip4da_txen <= frame_decode(ip4_ptr, myip4hdr_frame, ip4_txd'length, myip4_da) and pl_txen;
	ip4da_e : entity hdl4fpga.mii_mux
	port map (
		mux_data => ip4da,
		mii_txc  => mii_txc,
		mii_txdv => ip4da_txen,
		mii_txd  => ip4da_txd);

	lat_b : block
		signal pllat1_txen : std_logic;
		signal pllat2_txen : std_logic;
	begin
		
		pllat_e : entity hdl4fpga.mii_latency
		generic map (
			latency => 
				summation(ip4hdr_frame)-
				ip4hdr_frame(ip4_len)-
				ip4hdr_frame(ip4_sa)-
				ip4hdr_frame(ip4_da))
		port map (
			mii_txc  => mii_txc,
			lat_txen => pl_txen,
			lat_txd  => pl_txd,
			mii_txen => pllat1_txen,
			mii_txd  => pllat_txd);
		
		lat_txd  <= wirebus(cksm_txd & pllat_txd, cksm_txen & pllat1_txen);
		iplenlat_e : entity hdl4fpga.mii_latency
		generic map (
			latency => 
				ip4hdr_frame(ip4_verihl)+
				ip4hdr_frame(ip4_tos))
		port map (
			mii_txc  => mii_txc,
			lat_txen => pllat1_txen,
			lat_txd  => lat_txd,
			mii_txen => pllat2_txen,
			mii_txd  => lenlat_txd);

		ipalat_e : entity hdl4fpga.mii_latency
		generic map (
			latency => 
				ip4hdr_frame(ip4_ident)+
				ip4hdr_frame(ip4_flgsfrg)+
				ip4hdr_frame(ip4_ttl)+
				ip4hdr_frame(ip4_proto)+
				ip4hdr_frame(ip4_chksum))
		port map (
			mii_txc  => mii_txc,
			lat_txen => pllat2_txen,
			lat_txd  => lenlat_txd,
			mii_txen => pllat_txen,
			mii_txd  => alat_txd);
		
	end block;
	
	cksm_txd   <= wirebus(ip4len_txd & ip4sa_txd & ip4da_txd, ip4len_txen & ip4sa_txen & ip4da_txen);
	cksm_txen <= frame_decode(ip4_ptr, myip4hdr_frame, ip4_txd'length, (myip4_len, myip4_sa, myip4_da)) and pl_txen;
	cksmd_txen  <=frame_decode(ip4_ptr, ip4hdr_frame, ip4_txd'length, ip4_chksum) and pl_txen; 
	mii1checksum_e : entity hdl4fpga.mii_1chksum
	generic map (
		chksum_size => 16)
	port map (
		mii_txc   => mii_txc,
		mii_txen  => cksm_txen,
		mii_txd   => cksm_txd,

		cksm_init => oneschecksum(ip4_shdr, 16),
		cksm_txd  => cksmd_txd);

	lenlat_txen   <= frame_decode(ip4_ptr, ip4hdr_frame, ip4_txd'length, ip4_len) and pl_txen;
	protolat_txen <= frame_decode(ip4_ptr, ip4hdr_frame, ip4_txd'length, ip4_proto) and pl_txen;
	alat_txen     <= frame_decode(ip4_ptr, ip4hdr_frame, ip4_txd'length, (ip4_sa, ip4_da)) and pl_txen;

	ip4_txd <= wirebus(ip4shdr_txd & lenlat_txd & cksmd_txd & alat_txd, ip4shdr_txen & lenlat_txen & cksmd_txen & (alat_txen or pllat_txen));

end;
