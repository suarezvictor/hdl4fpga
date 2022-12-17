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

entity dk_dev_5cea7n is
	generic (
		debug                : boolean := false);
	port (
		clkin_50_fpga_top    : in std_logic;
		clkin_50_fpga_right  : in std_logic;
		diff_clkin_top_125_p : in std_logic;
		diff_clkin_top_125_n : in std_logic;
		diff_clkin_bot_125_p : in std_logic;
		diff_clkin_bot_125_n : in std_logic;

		user_pbs             : in  std_logic_vector(4-1 downto 0) := (others => 'Z');
		user_dipsws          : in  std_logic_vector(4-1 downto 0) := (others => 'Z');
		leds                 : out std_logic_vector(6-1 downto 0);

		uart_txd             : out std_logic;
		uart_rts             : out std_logic;
		uart_rxd             : in  std_logic := '0';
		uart_cts             : in  std_logic := '0';

		eneta_resetn         : out std_logic;
		eneta_gtx_clk        : out std_logic;
		eneta_tx_en          : out std_logic;
		eneta_tx_data        : out std_logic_vector(0 to 4-1);
		eneta_rx_dv          : in  std_logic;
		eneta_rx_data        : in  std_logic_vector(0 to 4-1);
		eneta_rx_clk         : in  std_logic;
		eneta_mdio           : inout std_logic := '0';
		eneta_mdc            : out std_logic   := '0';
		eneta_intn           : in  std_logic   := '0';

		ddr3_resetn          : out   std_logic := '0';
		ddr3_clk_p           : out   std_logic := '0';
		ddr3_clk_n           : out   std_logic := '0';
		ddr3_cke             : out   std_logic := '0';
		ddr3_csn             : out   std_logic := '1';
		ddr3_rasn            : out   std_logic := '1';
		ddr3_casn            : out   std_logic := '1';
		ddr3_wen             : out   std_logic := '1';
		ddr3_ba              : out   std_logic_vector( 3-1 downto 0) := (others => '1');
		ddr3_a               : out   std_logic_vector(14-1 downto 0) := (others => '1');
		ddr3_dm              : inout std_logic_vector( 4-1 downto 0) := (others => 'Z');
		ddr3_dqs_p           : inout std_logic_vector( 4-1 downto 0) := (others => 'Z');
		ddr3_dqs_n           : inout std_logic_vector( 4-1 downto 0) := (others => 'Z');
		ddr3_dq              : inout std_logic_vector(32-1 downto 0) := (others => 'Z');
		ddr3_odt             : out   std_logic := '1');
	
	alias user_pb0    : std_logic is user_pbs(0);
	alias user_pb1    : std_logic is user_pbs(1);
	alias user_pb2    : std_logic is user_pbs(2);
	alias user_pb3    : std_logic is user_pbs(3);

	alias s5          : std_logic is user_pbs(0);
	alias s6          : std_logic is user_pbs(1);
	alias s7          : std_logic is user_pbs(2);
	alias s8          : std_logic is user_pbs(3);

	alias user_dipsw0 : std_logic is user_dipsws(0);
	alias user_dipsw1 : std_logic is user_dipsws(1);
	alias user_dipsw2 : std_logic is user_dipsws(2);
	alias user_dipsw3 : std_logic is user_dipsws(3);

	alias d28         : std_logic is leds(0);
	alias d29         : std_logic is leds(1);
	alias d30         : std_logic is leds(2);
	alias d31         : std_logic is leds(3);
	alias user_led0   : std_logic is leds(0);
	alias user_led1   : std_logic is leds(1);
	alias user_led2   : std_logic is leds(2);
	alias user_led3   : std_logic is leds(3);
	alias user_leds   : std_logic_vector(4-1 downto 0) is leds(4-1 downto 0);
	alias hsmc_rx_led : std_logic is leds(4);
	alias hsmc_tx_led : std_logic is leds(5);

	constant sys_freq    : real    := 50.0e6;

	attribute chip_pin : string;

	attribute chip_pin of clkin_50_fpga_top    : signal is "L14";
	attribute chip_pin of clkin_50_fpga_right  : signal is "P22";
	attribute chip_pin of diff_clkin_top_125_p : signal is "L15";
	attribute chip_pin of diff_clkin_top_125_n : signal is "K15";
	attribute chip_pin of diff_clkin_bot_125_p : signal is "AB17";
	attribute chip_pin of diff_clkin_bot_125_n : signal is "AB18";
	
	attribute chip_pin of user_pbs             : signal is "AG12 AF13 AB13 AB12";
	attribute chip_pin of user_dipsws          : signal is "AG11 AF11 Aa13 Y12";
	attribute chip_pin of leds                 : signal is "AH11 AH12 AK6 AJ5 AJ4 AK3";

	attribute chip_pin of uart_txd             : signal is "AB9";
	attribute chip_pin of uart_rts             : signal is "AH6";
	attribute chip_pin of uart_rxd             : signal is "AG6";
	attribute chip_pin of uart_cts             : signal is "AF8";

	attribute chip_pin of eneta_resetn         : signal is "N22";
	attribute chip_pin of eneta_gtx_clk        : signal is "H27";
	attribute chip_pin of eneta_tx_en          : signal is "F30";
	attribute chip_pin of eneta_tx_data        : signal is "J28 J29 H29 H30";
	attribute chip_pin of eneta_rx_dv          : signal is "L26";
	attribute chip_pin of eneta_rx_data        : signal is "N26 N27 N24 N25";
	attribute chip_pin of eneta_rx_clk         : signal is "T23";
	attribute chip_pin of eneta_mdio           : signal is "L25";
	attribute chip_pin of eneta_mdc            : signal is "G29";
	attribute chip_pin of eneta_intn           : signal is "J27";

	attribute chip_pin of ddr3_resetn          : signal is "L19";
	attribute chip_pin of ddr3_clk_p           : signal is "J20";
	attribute chip_pin of ddr3_clk_n           : signal is "H20";
	attribute chip_pin of ddr3_cke             : signal is "C11";
	attribute chip_pin of ddr3_csn             : signal is "G17";
	attribute chip_pin of ddr3_rasn            : signal is "A24";
	attribute chip_pin of ddr3_casn            : signal is "L20";
	attribute chip_pin of ddr3_wen             : signal is "B22";
	
	attribute chip_pin of ddr3_ba              : signal is "D19 F20 J18";
	attribute chip_pin of ddr3_a               : signal is "B13 C25 E20 E23 D14 H17 B26 A15 A26 A20 E22 E21 G23 A16";

	attribute chip_pin of ddr3_dm              : signal is "B14 A19 D18 D23";
	attribute chip_pin of ddr3_dqs_p           : signal is "K17 K16 L18 K20";
	attribute chip_pin of ddr3_dqs_n           : signal is "J17 L16 K18 J19";
	attribute chip_pin of ddr3_dq              : signal is "A13 D12 A14 C16 E17 C12 D17 C15 B19 B17 C17 C14 F18 A18 B18 G18 A23 E18 B23 C24 F19 B21 A21 B24 D20 D25 C22 C20 C19 C21 D22 A25";
	attribute chip_pin of ddr3_odt             : signal is "H19";

end;
