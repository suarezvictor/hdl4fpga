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

entity hdlcsync_tx is
	generic (
		hdlc_flag : std_logic_vector := x"7e";
		hdlc_esc  : std_logic_vector := x"7d");
	port (
		uart_clk    : in  std_logic;
		uart_irdy   : out std_logic;
		uart_idle   : in  std_logic;
		uart_txd    : out std_logic_vector(8-1 downto 0);

		hdlctx_frm  : in  std_logic;
		hdlctx_irdy : in  std_logic;
		hdlctx_trdy : buffer std_logic;
		hdlctx_data : in  std_logic_vector(8-1 downto 0));


end;

architecture def of hdlcsync_tx is

begin

	process (uart_idle, hdlctx_frm, hdlctx_data, hdlctx_irdy, uart_clk)
		variable frm : std_logic;
		variable esc : std_logic;
	begin
		if rising_edge(uart_clk) then
			if uart_idle='1' then
				if hdlctx_frm='1' then
					if hdlctx_irdy='1' then
						if esc='1' then
							esc := '0';
						elsif hdlctx_data=hdlc_flag then
							esc := frm;
						elsif hdlctx_data=hdlc_esc then
							esc := frm;
						end if;
					else 
						esc := '0';
					end if;
				else
					esc := '0';
				end if;
				frm := hdlctx_frm;
			end if;
		end if;

		if hdlctx_frm='1' then
			if esc='1' then
				uart_txd    <= hdlctx_data xor x"20";
				uart_irdy   <= hdlctx_irdy;
				hdlctx_trdy <= uart_idle;
			elsif hdlctx_data=hdlc_flag then
				uart_txd    <= hdlc_esc;
				uart_irdy   <= hdlctx_irdy;
				hdlctx_trdy <= '0';
			elsif hdlctx_data=hdlc_esc then
				uart_txd    <= hdlc_esc;
				uart_irdy   <= hdlctx_irdy;
				hdlctx_trdy <= '0';
			else
				uart_txd    <= hdlctx_data;
				uart_irdy   <= hdlctx_irdy;
				hdlctx_trdy <= uart_idle;
			end if;
		else 
			hdlctx_trdy <= '0';
			uart_irdy  <= frm;
			uart_txd   <= hdlc_flag;
		end if;
	end process;


end;