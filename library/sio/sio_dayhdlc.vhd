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

entity sio_dayhdlc is
	port (
	
		uart_clk  : in  std_logic;
		uart_rxdv : in  std_logic;
		uart_rxd  : in  std_logic_vector(8-1 downto 0);

		uart_idle : in  std_logic;
		uart_txen : buffer std_logic;
		uart_txd  : out std_logic_vector(8-1 downto 0);

		sio_clk   : in std_logic;
		sio_addr  : in  std_logic := '0';

		si_frm    : in  std_logic := '0';
		si_irdy   : in  std_logic := '1';
		si_trdy   : out std_logic;
		si_data   : in  std_logic_vector;

		so_frm    : out std_logic;
		so_irdy   : out std_logic;
		so_trdy   : in  std_logic := '1';
		so_data   : out std_logic_vector;
		tp : out std_logic_vector(1 to 4));
	
end;

architecture beh of sio_dayhdlc is

	signal sihdlc_frm  : std_logic;
	signal sihdlc_trdy : std_logic;
	signal sihdlc_irdy : std_logic;
	signal sihdlc_data : std_logic_vector(so_data'range);

	signal sohdlc_frm  : std_logic;
	signal sohdlc_trdy : std_logic;
	signal sohdlc_irdy : std_logic;
	signal sohdlc_data : std_logic_vector(so_data'range);

begin

	sihdlc_frm  <= si_frm  when sio_addr='0' else '0'; 
	sihdlc_irdy <= si_irdy when sio_addr='0' else '0';
	si_trdy <= (sihdlc_trdy and uart_idle and uart_txen) when sio_addr='0' else so_trdy;
	sihdlc_data <= si_data;

	siohdlc_e : entity hdl4fpga.sio_hdlc
	port map (
		uart_clk  => uart_clk,

		uart_rxdv => uart_rxdv,
		uart_rxd  => uart_rxd,

		uart_idle => uart_idle,
		uart_txd  => uart_txd,
		uart_txen => uart_txen,

		sio_clk   => sio_clk,
		si_frm    => sihdlc_frm,
		si_irdy   => sihdlc_irdy,
		si_trdy   => sihdlc_trdy,
		si_data   => sihdlc_data,

		so_frm    => sohdlc_frm,
		so_irdy   => sohdlc_irdy,
		so_trdy   => sohdlc_trdy,
		so_data   => sohdlc_data);

	so_frm  <= si_frm  when sio_addr/='0' else sohdlc_frm; 
	so_irdy <= si_irdy when sio_addr/='0' else sohdlc_irdy;
	sohdlc_trdy <= si_irdy when sio_addr/='0' else so_trdy;
	so_data <= si_data when sio_addr/='0' else sohdlc_data;

end;