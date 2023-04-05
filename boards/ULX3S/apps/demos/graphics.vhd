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
use hdl4fpga.base.all;
use hdl4fpga.sdram_param.all;
use hdl4fpga.sdram_db.all;
use hdl4fpga.ipoepkg.all;
use hdl4fpga.videopkg.all;
use hdl4fpga.app_profiles.all;

library ecp5u;
use ecp5u.components.all;

architecture graphics of ulx3s is

	---------------------------------------
	-- Set of profiles                   --
	type app_profiles is (
	--	Interface_SdramSpeed_PixelFormat --

		hdlc_sdr133MHz_480p16bpp,        --
		hdlc_sdr133MHz_480p24bpp,        --
		hdlc_sdr133MHz_600p16bpp,        --
		hdlc_sdr133MHz_600p24bpp,        --
		hdlc_sdr133MHz_768p24bpp,        --
		hdlc_sdr133MHz_720p16bpp,        --
		hdlc_sdr133MHz_720p24bpp,        --

		hdlc_sdr150MHz_720p24bpp,        --

		hdlc_sdr166MHz_480p16bpp,        --
		hdlc_sdr166MHz_480p24bpp,        --
		hdlc_sdr166MHz_600p16bpp,        --
		hdlc_sdr166MHz_600p24bpp,        --
		hdlc_sdr166MHz_720p24bpp,        --
		hdlc_sdr166MHz_1080p16bpp30,     --
		hdlc_sdr166MHz_1080p24bpp30,     --

		hdlc_sdr200MHz_480p16bpp,        --
		hdlc_sdr200MHz_480p24bpp,        --
		hdlc_sdr200MHz_600p24bpp,        --
		hdlc_sdr200MHz_600p16bpp,        --
		hdlc_sdr200MHz_720p24bpp,        --
		hdlc_sdr200MHz_1080p16bpp30,     --
		hdlc_sdr200MHz_1080p24bpp30,     --

		hdlc_sdr225MHz_480p16bpp,        --
		hdlc_sdr225MHz_480p24bpp,        --
		hdlc_sdr225MHz_600p16bpp,        --
		hdlc_sdr225MHz_600p24bpp,        --
		hdlc_sdr225MHz_720p24bpp,        --
		hdlc_sdr225MHz_1080p16bpp30,     --
		hdlc_sdr225MHz_1080p24bpp30,     --

		hdlc_sdr250MHz_480p16bpp,        --
		hdlc_sdr250MHz_600p16bpp,        --
		hdlc_sdr250MHz_600p24bpp,        --
		hdlc_sdr250MHz_720p24bpp,        --
		hdlc_sdr250MHz_1080p16bpp30,     --
		hdlc_sdr250MHz_1080p24bpp30,     --

		ipoe_sdr166MHz_480p24bpp,        --
		ipoe_sdr200MHz_600p24bpp,        --
		ipoe_sdr250MHz_600p24bpp);       --
	---------------------------------------

	--------------------------------------
	--     Set your profile here        --
	constant app_profile : app_profiles := hdlc_sdr250MHz_600p24bpp;
	-- constant app_profile : app_profiles := hdlc_sdr133MHz_480p16bpp;
    --                                  --
	--------------------------------------

	type profileparams_vector is array (app_profiles) of profile_params;
	constant profile_tab : profileparams_vector := (
		hdlc_sdr133MHz_480p16bpp => (io_hdlc, sdram133MHz, mode480p16bpp),
		hdlc_sdr133MHz_480p24bpp => (io_hdlc, sdram133MHz, mode480p24bpp),
		hdlc_sdr133MHz_600p16bpp => (io_hdlc, sdram133MHz, mode600p16bpp),
		hdlc_sdr133MHz_600p24bpp => (io_hdlc, sdram133MHz, mode600p24bpp),
		hdlc_sdr133MHz_768p24bpp => (io_hdlc, sdram133MHz, mode768p24bpp),
		hdlc_sdr133MHz_720p16bpp => (io_hdlc, sdram133MHz, mode720p16bpp),
		hdlc_sdr133MHz_720p24bpp => (io_hdlc, sdram133MHz, mode720p24bpp),

		hdlc_sdr150MHz_720p24bpp => (io_hdlc, sdram150MHz, mode720p24bpp),

		hdlc_sdr166MHz_480p16bpp => (io_hdlc, sdram166MHz, mode480p16bpp),
		hdlc_sdr166MHz_480p24bpp => (io_hdlc, sdram166MHz, mode480p24bpp),
		hdlc_sdr166MHz_600p16bpp => (io_hdlc, sdram166MHz, mode600p16bpp),
		hdlc_sdr166MHz_600p24bpp => (io_hdlc, sdram166MHz, mode600p24bpp),
		hdlc_sdr166MHz_720p24bpp => (io_hdlc, sdram166MHz, mode720p24bpp),
		hdlc_sdr166MHz_1080p16bpp30 => (io_hdlc, sdram166MHz, mode1080p16bpp30),
		hdlc_sdr166MHz_1080p24bpp30 => (io_hdlc, sdram166MHz, mode1080p24bpp30),

		hdlc_sdr200MHz_480p16bpp => (io_hdlc, sdram200MHz, mode480p16bpp),
		hdlc_sdr200MHz_480p24bpp => (io_hdlc, sdram200MHz, mode480p24bpp),
		hdlc_sdr200MHz_600p16bpp => (io_hdlc, sdram200MHz, mode600p16bpp),
		hdlc_sdr200MHz_600p24bpp => (io_hdlc, sdram200MHz, mode600p24bpp),
		hdlc_sdr200MHz_720p24bpp => (io_hdlc, sdram200MHz, mode720p24bpp),
		hdlc_sdr200MHz_1080p16bpp30 => (io_hdlc, sdram200MHz, mode1080p16bpp30),
		hdlc_sdr200MHz_1080p24bpp30 => (io_hdlc, sdram200MHz, mode1080p24bpp30),

		hdlc_sdr225MHz_480p16bpp => (io_hdlc, sdram225MHz, mode480p16bpp),
		hdlc_sdr225MHz_480p24bpp => (io_hdlc, sdram225MHz, mode480p24bpp),
		hdlc_sdr225MHz_600p16bpp => (io_hdlc, sdram225MHz, mode600p16bpp),
		hdlc_sdr225MHz_600p24bpp => (io_hdlc, sdram225MHz, mode600p24bpp),
		hdlc_sdr225MHz_720p24bpp => (io_hdlc, sdram225MHz, mode720p24bpp),
		hdlc_sdr225MHz_1080p16bpp30 => (io_hdlc, sdram225MHz, mode1080p16bpp30),
		hdlc_sdr225MHz_1080p24bpp30 => (io_hdlc, sdram225MHz, mode1080p24bpp30),

		hdlc_sdr250MHz_480p16bpp => (io_hdlc, sdram250MHz, mode480p16bpp),
		hdlc_sdr250MHz_600p16bpp => (io_hdlc, sdram250MHz, mode600p16bpp),
		hdlc_sdr250MHz_600p24bpp => (io_hdlc, sdram250MHz, mode600p24bpp),
		hdlc_sdr250MHz_720p24bpp => (io_hdlc, sdram250MHz, mode720p24bpp),
		hdlc_sdr250MHz_1080p16bpp30 => (io_hdlc, sdram250MHz, mode1080p16bpp30),
		hdlc_sdr250MHz_1080p24bpp30 => (io_hdlc, sdram250MHz, mode1080p24bpp30),

		ipoe_sdr166MHz_480p24bpp => (io_ipoe, sdram166MHz, mode480p24bpp),
		ipoe_sdr200MHz_600p24bpp => (io_ipoe, sdram200MHz, mode600p24bpp),
		ipoe_sdr250MHz_600p24bpp => (io_ipoe, sdram250MHz, mode600p24bpp));

	type pll_params is record
		clkos_div  : natural;
		clkop_div  : natural;
		clkfb_div  : natural;
		clki_div   : natural;
		clkos2_div : natural;
		clkos3_div : natural;
	end record;

	type video_params is record
		id     : video_modes;
		pll    : pll_params;
		timing : videotiming_ids;
		pixel  : pixel_types;
	end record;

	type videoparams_vector is array (natural range <>) of video_params;
	constant v_r : natural := 5; -- video ratio
	constant video_tab : videoparams_vector := (
		(id => modedebug,        pll => (clkos_div => 2, clkop_div => 30,  clkfb_div => 1, clki_div => 1, clkos2_div => v_r*2, clkos3_div => 19), pixel => rgb888, timing => pclk_debug),
		(id => mode480p16bpp,    pll => (clkos_div => 5, clkop_div => 25,  clkfb_div => 1, clki_div => 1, clkos2_div => v_r*5, clkos3_div => 16), pixel => rgb565, timing => pclk25_00m640x480at60),
		(id => mode480p24bpp,    pll => (clkos_div => 5, clkop_div => 25,  clkfb_div => 1, clki_div => 1, clkos2_div => v_r*5, clkos3_div => 16), pixel => rgb888, timing => pclk25_00m640x480at60),
		(id => mode600p16bpp,    pll => (clkos_div => 2, clkop_div => 16,  clkfb_div => 1, clki_div => 1, clkos2_div => v_r*2, clkos3_div => 10), pixel => rgb565, timing => pclk40_00m800x600at60),
		(id => mode600p24bpp,    pll => (clkos_div => 2, clkop_div => 16,  clkfb_div => 1, clki_div => 1, clkos2_div => v_r*2, clkos3_div => 10), pixel => rgb888, timing => pclk40_00m800x600at60),
		(id => mode768p24bpp,    pll => (clkos_div => 2, clkop_div => 26,  clkfb_div => 1, clki_div => 1, clkos2_div => v_r*2, clkos3_div => 16), pixel => rgb888, timing => pclk40_00m800x600at60),
		(id => mode720p16bpp,    pll => (clkos_div => 2, clkop_div => 30,  clkfb_div => 1, clki_div => 1, clkos2_div => v_r*2, clkos3_div => 19), pixel => rgb565, timing => pclk75_00m1280x720at60),
		(id => mode720p24bpp,    pll => (clkos_div => 2, clkop_div => 30,  clkfb_div => 1, clki_div => 1, clkos2_div => v_r*2, clkos3_div => 19), pixel => rgb888, timing => pclk75_00m1280x720at60),
		(id => mode1080p16bpp30, pll => (clkos_div => 2, clkop_div => 30,  clkfb_div => 1, clki_div => 1, clkos2_div => v_r*2, clkos3_div => 19), pixel => rgb565, timing => pclk150_00m1920x1080at60),
		(id => mode1080p24bpp30, pll => (clkos_div => 2, clkop_div => 30,  clkfb_div => 1, clki_div => 1, clkos2_div => v_r*2, clkos3_div => 19), pixel => rgb888, timing => pclk150_00m1920x1080at60));

	impure function videoparam (
		constant id  : video_modes)
		return video_params is
		constant tab : videoparams_vector := video_tab;
	begin
		for i in tab'range loop
			if id=tab(i).id then
				return tab(i);
			end if;
		end loop;

		assert false 
		report ">>>videoparam<<< : video id not available"
		severity failure;

		return tab(tab'left);
	end;

	constant video_mode   : video_modes := setdebug(debug, profile_tab(app_profile).video_mode);
	constant video_record : video_params := videoparam(video_mode);

	type sdramparams_record is record
		id  : sdram_speeds;
		pll : pll_params;
		cl  : std_logic_vector(0 to 3-1);
	end record;

	type sdramparams_vector is array (natural range <>) of sdramparams_record;
	constant sdram_tab : sdramparams_vector := (
		(id => sdram133MHz, pll => (clkos_div => 2, clkop_div => 16, clkfb_div => 1, clki_div => 1, clkos2_div => 3, clkos3_div => 0), cl => "010"),
		(id => sdram150MHz, pll => (clkos_div => 2, clkop_div => 18, clkfb_div => 1, clki_div => 1, clkos2_div => 3, clkos3_div => 0), cl => "011"),
		(id => sdram166MHz, pll => (clkos_div => 2, clkop_div => 20, clkfb_div => 1, clki_div => 1, clkos2_div => 3, clkos3_div => 0), cl => "011"),
		(id => sdram200MHz, pll => (clkos_div => 2, clkop_div => 16, clkfb_div => 1, clki_div => 1, clkos2_div => 2, clkos3_div => 0), cl => "011"),
		(id => sdram225MHz, pll => (clkos_div => 2, clkop_div => 27, clkfb_div => 1, clki_div => 1, clkos2_div => 3, clkos3_div => 0), cl => "011"),
		(id => sdram233MHz, pll => (clkos_div => 2, clkop_div => 28, clkfb_div => 1, clki_div => 1, clkos2_div => 3, clkos3_div => 0), cl => "011"),
		(id => sdram250MHz, pll => (clkos_div => 2, clkop_div => 20, clkfb_div => 1, clki_div => 1, clkos2_div => 2, clkos3_div => 0), cl => "011"),
		(id => sdram262MHz, pll => (clkos_div => 2, clkop_div => 21, clkfb_div => 1, clki_div => 1, clkos2_div => 2, clkos3_div => 0), cl => "011"), -- Doesn't pass the LFSR test
		(id => sdram275MHz, pll => (clkos_div => 2, clkop_div => 22, clkfb_div => 1, clki_div => 1, clkos2_div => 2, clkos3_div => 0), cl => "011")); -- Doesn't pass the LFSR test

	function sdramparams (
		constant id  : sdram_speeds)
		return sdramparams_record is
		constant tab : sdramparams_vector := sdram_tab;
	begin
		for i in tab'range loop
			if id=tab(i).id then
				return tab(i);
			end if;
		end loop;

		assert false 
		report ">>>sdramparams<<< : sdram speed not enabled"
		severity failure;

		return tab(tab'left);
	end;

    signal video_pixel : std_logic_vector(0 to setif(
		video_record.pixel=rgb565, 16, setif(
		video_record.pixel=rgb888, 32, 0))-1);

	constant sdram_mode : sdram_speeds := sdram_speeds'VAL(setif(not debug,
		sdram_speeds'POS(profile_tab(app_profile).sdram_speed),
		sdram_speeds'POS(sdram133Mhz)));
	constant sdram_params : sdramparams_record := sdramparams(sdram_mode);

	constant sdram_tcp : real := 
		real(sdram_params.pll.clki_div*sdram_params.pll.clkos2_div)/
		(real(sdram_params.pll.clkfb_div*sdram_params.pll.clkop_div)*clk25mhz_freq);

	constant io_link     : io_comms := profile_tab(app_profile).comms;

	constant gear        : natural := 1;
	constant bank_size   : natural := sdram_ba'length;
	constant addr_size   : natural := sdram_a'length;
	constant coln_size   : natural := 9;
	constant word_size   : natural := sdram_d'length;
	constant byte_size   : natural := 8;

	signal sdrsys_rst    : std_logic;

	signal ctlrphy_rst   : std_logic;
	signal ctlrphy_cke   : std_logic;
	signal ctlrphy_cs    : std_logic;
	signal ctlrphy_ras   : std_logic;
	signal ctlrphy_cas   : std_logic;
	signal ctlrphy_we    : std_logic;
	signal ctlrphy_b     : std_logic_vector(sdram_ba'length-1 downto 0);
	signal ctlrphy_a     : std_logic_vector(sdram_a'length-1 downto 0);
	signal ctlrphy_dmt   : std_logic_vector(gear-1 downto 0);
	signal ctlrphy_dmo   : std_logic_vector(gear*word_size/byte_size-1 downto 0);
	signal ctlrphy_dqi   : std_logic_vector(gear*word_size-1 downto 0);
	signal ctlrphy_dqt   : std_logic_vector(gear-1 downto 0);
	signal ctlrphy_dqo   : std_logic_vector(gear*word_size-1 downto 0);
	signal ctlrphy_sto   : std_logic_vector(gear-1 downto 0);
	signal ctlrphy_sti   : std_logic_vector(gear*word_size/byte_size-1 downto 0);
	signal sdram_dqs     : std_logic_vector(word_size/byte_size-1 downto 0);

	signal video_clk     : std_logic;
	signal videoio_clk   : std_logic;
	signal video_lck     : std_logic;
	signal video_shift_clk : std_logic;
	signal video_hzsync  : std_logic;
    signal video_vtsyn   : std_logic;
    signal video_blank   : std_logic;
    signal video_on      : std_logic;
    signal video_dot     : std_logic;
	signal dvid_crgb     : std_logic_vector(8-1 downto 0);

	signal ctlr_clk      : std_logic;

	constant mem_size    : natural := 8*(1024*8);
	signal so_frm        : std_logic;
	signal so_irdy       : std_logic;
	signal so_trdy       : std_logic;
	signal so_data       : std_logic_vector(0 to 8-1);
	signal si_frm        : std_logic;
	signal si_irdy       : std_logic;
	signal si_trdy       : std_logic;
	signal si_end        : std_logic;
	signal si_data       : std_logic_vector(0 to 8-1);

	signal sio_clk       : std_logic;
	alias uart_clk       : std_logic is sio_clk;

	constant hdplx       : std_logic := setif(debug, '0', '1');

begin

	videopll_b : block

		attribute FREQUENCY_PIN_CLKOS  : string;
		attribute FREQUENCY_PIN_CLKOS2 : string;
		attribute FREQUENCY_PIN_CLKOS3 : string;
		attribute FREQUENCY_PIN_CLKI   : string;
		attribute FREQUENCY_PIN_CLKOP  : string;

		constant video_freq  : real :=
			(real(video_record.pll.clkfb_div*video_record.pll.clkop_div)*clk25mhz_freq)/
			(real(video_record.pll.clki_div*video_record.pll.clkos2_div*1e6));

		constant video_shift_freq  : real :=
			(real(video_record.pll.clkfb_div*video_record.pll.clkop_div)*clk25mhz_freq)/
			(real(video_record.pll.clki_div*video_record.pll.clkos_div*1e6));

		constant videoio_freq  : real :=
			(real(video_record.pll.clkfb_div*video_record.pll.clkop_div)*clk25mhz_freq)/
			(real(video_record.pll.clki_div*video_record.pll.clkos3_div*1e6));

		attribute FREQUENCY_PIN_CLKOS  of pll_i : label is ftoa(video_shift_freq,    10);
		attribute FREQUENCY_PIN_CLKOS2 of pll_i : label is ftoa(video_freq,          10);
		attribute FREQUENCY_PIN_CLKOS3 of pll_i : label is ftoa(videoio_freq,        10);
		attribute FREQUENCY_PIN_CLKI   of pll_i : label is ftoa(clk25mhz_freq/1.0e6, 10);
		attribute FREQUENCY_PIN_CLKOP  of pll_i : label is ftoa(clk25mhz_freq/1.0e6, 10);

		signal clkfb : std_logic;

	begin
		pll_i : EHXPLLL
        generic map (
			PLLRST_ENA       => "DISABLED",
			INTFB_WAKE       => "DISABLED",
			STDBY_ENABLE     => "DISABLED",
			DPHASE_SOURCE    => "DISABLED",
			PLL_LOCK_MODE    =>  0,
			FEEDBK_PATH      => "CLKOP",
			CLKOS_ENABLE     => "ENABLED",  CLKOS_FPHASE   => 0, CLKOS_CPHASE  => 0,
			CLKOS2_ENABLE    => "ENABLED",  CLKOS2_FPHASE  => 0, CLKOS2_CPHASE => 0,
			CLKOS3_ENABLE    => "ENABLED",  CLKOS3_FPHASE  => 0, CLKOS3_CPHASE => 0,
			CLKOP_ENABLE     => "ENABLED",  CLKOP_FPHASE   => 0, CLKOP_CPHASE  => video_record.pll.clkop_div-1,
			CLKOS_TRIM_DELAY =>  0,         CLKOS_TRIM_POL => "FALLING",
			CLKOP_TRIM_DELAY =>  0,         CLKOP_TRIM_POL => "FALLING",
			OUTDIVIDER_MUXD  => "DIVD",
			OUTDIVIDER_MUXC  => "DIVC",
			OUTDIVIDER_MUXB  => "DIVB",
			OUTDIVIDER_MUXA  => "DIVA",

			CLKOS_DIV        => video_record.pll.clkos_div,
			CLKOS2_DIV       => video_record.pll.clkos2_div,
			CLKOS3_DIV       => video_record.pll.clkos3_div,
			CLKOP_DIV        => video_record.pll.clkop_div,
			CLKFB_DIV        => video_record.pll.clkfb_div,
			CLKI_DIV         => video_record.pll.clki_div)
        port map (
			rst       => '0',
			clki      => clk_25mhz,
			CLKFB     => clkfb,
            PHASESEL0 => '0', PHASESEL1 => '0',
			PHASEDIR  => '0',
            PHASESTEP => '0', PHASELOADREG => '0',
            STDBY     => '0', PLLWAKESYNC  => '0',
            ENCLKOP   => '0',
			ENCLKOS   => '0',
			ENCLKOS2  => '0',
            ENCLKOS3  => '0',
			CLKOP     => clkfb,
			CLKOS     => video_shift_clk,
			CLKOS2    => video_clk,
			CLKOS3    => videoio_clk,
			LOCK      => video_lck,
            INTLOCK   => open,
			REFCLK    => open,
			CLKINTFB  => open);

	end block;

	ctlrpll_b : block

		attribute FREQUENCY_PIN_CLKOS  : string;
		attribute FREQUENCY_PIN_CLKOS2 : string;
		attribute FREQUENCY_PIN_CLKOS3 : string;
		attribute FREQUENCY_PIN_CLKI   : string;
		attribute FREQUENCY_PIN_CLKOP  : string;


		constant sdram_freq  : real :=
			(real(sdram_params.pll.clkfb_div*sdram_params.pll.clkop_div)*clk25mhz_freq)/
			(real(sdram_params.pll.clki_div*sdram_params.pll.clkos2_div*1e6));

		attribute FREQUENCY_PIN_CLKOS2 of pll_i : label is ftoa(sdram_freq, 10);
		attribute FREQUENCY_PIN_CLKI   of pll_i : label is ftoa(clk25mhz_freq/1.0e6, 10);
		attribute FREQUENCY_PIN_CLKOP  of pll_i : label is ftoa(clk25mhz_freq/1.0e6, 10);

		signal clkfb : std_logic;
		signal lock  : std_logic;

	begin

		assert false
		report real'image(sdram_freq)
		severity NOTE;

		pll_i : EHXPLLL
        generic map (
			PLLRST_ENA       => "DISABLED",
			INTFB_WAKE       => "DISABLED",
			STDBY_ENABLE     => "DISABLED",
			DPHASE_SOURCE    => "DISABLED",
			PLL_LOCK_MODE    =>  0,
			FEEDBK_PATH      => "CLKOP",
			CLKOS_ENABLE     => "DISABLED", CLKOS_FPHASE   => 0, CLKOS_CPHASE  => 0,
			CLKOS2_ENABLE    => "ENABLED",  CLKOS2_FPHASE  => 0, CLKOS2_CPHASE => 0,
			CLKOS3_ENABLE    => "DISABLED", CLKOS3_FPHASE  => 0, CLKOS3_CPHASE => 0,
			CLKOP_ENABLE     => "ENABLED",  CLKOP_FPHASE   => 0, CLKOP_CPHASE  => sdram_params.pll.clkop_div-1,
			CLKOS_TRIM_DELAY =>  0,         CLKOS_TRIM_POL => "FALLING",
			CLKOP_TRIM_DELAY =>  0,         CLKOP_TRIM_POL => "FALLING",
			OUTDIVIDER_MUXD  => "DIVD",
			OUTDIVIDER_MUXC  => "DIVC",
			OUTDIVIDER_MUXB  => "DIVB",
			OUTDIVIDER_MUXA  => "DIVA",

--			CLKOS_DIV        => sdram_params.pll.clkos_div,
			CLKOS2_DIV       => sdram_params.pll.clkos2_div,
--			CLKOS3_DIV       => sdram_params.pll.clkos3_div,
			CLKOP_DIV        => sdram_params.pll.clkop_div,
			CLKFB_DIV        => sdram_params.pll.clkfb_div,
			CLKI_DIV         => sdram_params.pll.clki_div)
        port map (
			rst       => '0',
			clki      => clk_25mhz,
			CLKFB     => clkfb,
            PHASESEL0 => '0', PHASESEL1 => '0',
			PHASEDIR  => '0',
            PHASESTEP => '0', PHASELOADREG => '0',
            STDBY     => '0', PLLWAKESYNC  => '0',
            ENCLKOP   => '0',
			ENCLKOS   => '0',
			ENCLKOS2  => '0',
            ENCLKOS3  => '0',
			CLKOP     => clkfb,
			CLKOS     => open,
			CLKOS2    => ctlr_clk,
			CLKOS3    => open,
			LOCK      => lock,
            INTLOCK   => open,
			REFCLK    => open,
			CLKINTFB  => open);

		sdrsys_rst <= not lock;

		sdram_dqs <= (others => not ctlr_clk) when sdram_mode/=sdram133MHz or debug=true else (others => ctlr_clk);
		-- sdram_dqs <= (others => not ctlr_clk);

	end block;

	hdlc_g : if io_link=io_hdlc generate

		constant uart_xtal : real := 
			real(video_record.pll.clkfb_div*video_record.pll.clkop_div)*clk25mhz_freq/
			real(video_record.pll.clki_div*video_record.pll.clkos3_div);

		constant baudrate : natural := setif(
			uart_xtal >= 32.0e6, 3e6, setif(
			uart_xtal >= 25.0e6, 2e6, 115200));

		signal uart_rxdv  : std_logic;
		signal uart_rxd   : std_logic_vector(0 to 8-1);
		signal uarttx_frm : std_logic;
		signal uart_idle  : std_logic;
		signal uart_txen  : std_logic;
		signal uart_txd   : std_logic_vector(uart_rxd'range);

		signal tp         : std_logic_vector(1 to 32);

	begin

		nodebug_g : if not debug generate
			uart_clk <= videoio_clk;
		end generate;

		debug_g : if debug generate
			uart_clk <= not to_stdulogic(to_bit(uart_clk)) after 0.1 ns /2;
		end generate;

		assert FALSE
			report "BAUDRATE : " & " " & integer'image(baudrate)
			severity NOTE;

		uartrx_e : entity hdl4fpga.uart_rx
		generic map (
			baudrate => baudrate,
			clk_rate => uart_xtal)
		port map (
			uart_rxc  => uart_clk,
			uart_sin  => ftdi_txd,
			uart_irdy => uart_rxdv,
			uart_data => uart_rxd);

		uarttx_e : entity hdl4fpga.uart_tx
		generic map (
			baudrate => baudrate,
			clk_rate => uart_xtal)
		port map (
			uart_txc  => uart_clk,
			uart_frm  => video_lck,
			uart_irdy => uart_txen,
			uart_trdy => uart_idle,
			uart_data => uart_txd,
			uart_sout => ftdi_rxd);

		siodaahdlc_e : entity hdl4fpga.sio_dayhdlc
		generic map (
			mem_size  => mem_size)
		port map (
			uart_clk    => uart_clk,
			uartrx_irdy => uart_rxdv,
			uartrx_data => uart_rxd,
			uarttx_frm  => uarttx_frm,
			uarttx_trdy => uart_idle,
			uarttx_data => uart_txd,
			uarttx_irdy => uart_txen,
			sio_clk     => sio_clk,
			so_frm      => so_frm,
			so_irdy     => so_irdy,
			so_trdy     => so_trdy,
			so_data     => so_data,

			si_frm      => si_frm,
			si_irdy     => si_irdy,
			si_trdy     => si_trdy,
			si_end      => si_end,
			si_data     => si_data,
			tp          => tp);

	end generate;

	ipoe_e : if io_link=io_ipoe generate
	begin

		rmii_b : block
			generic (
				n : natural);
			generic map (
				n => 2);
			port (
				dhcp_btn : in  std_logic;

				mii_rxc  : in  std_logic;
				mii_rxdv : in  std_logic;
				mii_rxd  : in  std_logic_vector(0 to n-1);

				mii_txc  : in  std_logic;
				mii_txen : out std_logic;
				mii_txd  : out std_logic_vector(0 to n-1));
			port map (
				dhcp_btn   => fire1,
				mii_txc    => rmii_nint,
				mii_txen   => rmii_tx_en,
				mii_txd(0) => rmii_tx0,
				mii_txd(1) => rmii_tx1,

				mii_rxc    => rmii_nint,
				mii_rxdv   => rmii_crs,
				mii_rxd(0) => rmii_rx0,
				mii_rxd(1) => rmii_rx1);

    		signal dhcpcd_req : std_logic;
    		signal dhcpcd_rdy : std_logic;

    		signal miitx_frm  : std_logic;
    		signal miitx_irdy : std_logic;
    		signal miitx_trdy : std_logic;
    		signal miitx_end  : std_logic;
    		signal miitx_data : std_logic_vector(si_data'range);

		begin
		
    		dhcp_p : process(mii_txc)
    			type states is (s_request, s_wait);
    			variable state : states;
    		begin
    			if rising_edge(mii_txc) then
    				case state is
    				when s_request =>
    					if dhcp_btn='1' then
    						dhcpcd_req <= not dhcpcd_rdy;
    						state := s_wait;
    					end if;
    				when s_wait =>
    					if to_bit(dhcpcd_req xor dhcpcd_rdy)='0' then
    						if dhcp_btn='0' then
    							state := s_request;
    						end if;
    					end if;
    				end case;
    			end if;
    		end process;

			udpdaisy_e : entity hdl4fpga.sio_dayudp
			generic map (
				my_mac        => x"00_40_00_01_02_03",
				default_ipv4a => aton("192.168.1.1"))
			port map (
				hdplx      => hdplx,
				mii_clk    => mii_txc,
				dhcpcd_req => dhcpcd_req,
				dhcpcd_rdy => dhcpcd_rdy,
				miirx_frm  => mii_rxdv,
				miirx_data => mii_rxd,
			
				miitx_frm  => miitx_frm,
				miitx_irdy => miitx_irdy,
				miitx_trdy => miitx_trdy,
				miitx_end  => miitx_end,
				miitx_data => miitx_data,
			
				si_frm     => si_frm,
				si_irdy    => si_irdy,
				si_trdy    => si_trdy,
				si_end     => si_end,
				si_data    => si_data,
			
				so_clk     => mii_txc,
				so_frm     => so_frm,
				so_irdy    => so_irdy,
				so_trdy    => so_trdy,
				so_data    => so_data);
			
			desser_e: entity hdl4fpga.desser
			port map (
				desser_clk => mii_txc,
			
				des_frm  => miitx_frm,
				des_irdy => miitx_irdy,
				des_trdy => miitx_trdy,
				des_data => miitx_data,
			
				ser_irdy => open,
				ser_data => mii_txd);
			
			mii_txen <= miitx_frm and not miitx_end;
		end block;
		
		miirefclk_b : block
			type ref_freqs is (f25MHz, f50MHz);
			constant ref_freq : ref_freqs := f25MHz;

			signal shtclk : std_logic;
			signal d0     : std_logic;
			signal d1     : std_logic;
			signal refclk : std_logic;
			
		begin

			ref50_g : if ref_freq=f50MHz generate
			begin
				process (video_shift_clk)
					variable reg : unsigned(0 to 10-1) := b"11_10_01_11_00";
				begin
					if rising_edge(video_shift_clk) then
						reg := reg rol 2;
					end if;
					d0 <= reg(0);
					d1 <= reg(1);
				end process;
				shtclk <= video_shift_clk;
			end generate;

			ref25_g : if ref_freq=f25MHz generate
				shtclk <= clk_25mhz;
				d0     <= '1';
				d1     <= '0';
			end generate;
	
			oddr_i : oddrx1f
			port map(
				sclk => video_shift_clk,
				rst  => '0',
				d0   => d0,
				d1   => d1,
				q    => refclk);

			debug_g : block
				signal debug_clk : std_logic;
			begin
				debug_clk <= not to_stdulogic(to_bit(debug_clk)) after 0.1 ns /2;
				rmii_refclk <= refclk when video_mode/=modedebug else debug_clk;
			end block;

	
		end block;

		wifi_en   <= '0';
		sio_clk   <= rmii_nint;
		rmii_mdio <= '0';
		rmii_mdc  <= '0';

	end generate;

	graphics_e : entity hdl4fpga.demo_graphics
	generic map (
		debug        => debug,
		profile      => 0,

		sdram_tcp    => sdram_tcp,
		phy_latencies => ecp5g1_latencies,
		mark         => MT48LC256MA27E ,
		gear         => gear,
		bank_size    => bank_size,
		addr_size    => addr_size,
		coln_size    => coln_size,
		word_size    => word_size,
		byte_size    => byte_size,

		timing_id    => video_record.timing,
		red_length   => setif(video_record.pixel=rgb565, 5, setif(video_record.pixel=rgb888, 8, 0)),
		green_length => setif(video_record.pixel=rgb565, 6, setif(video_record.pixel=rgb888, 8, 0)),
		blue_length  => setif(video_record.pixel=rgb565, 5, setif(video_record.pixel=rgb888, 8, 0)),
		fifo_size    => mem_size)

	port map (
		sin_clk      => sio_clk,
		sin_frm      => so_frm,
		sin_irdy     => so_irdy,
		sin_trdy     => so_trdy,
		sin_data     => so_data,
		sout_clk     => sio_clk,
		sout_frm     => si_frm,
		sout_irdy    => si_irdy,
		sout_trdy    => si_trdy,
		sout_end     => si_end,
		sout_data    => si_data,

		video_clk    => '0', --video_clk,
		video_shift_clk => '0', --video_shift_clk,
		video_pixel  => video_pixel,
		dvid_crgb    => dvid_crgb,

		ctlr_clk     => ctlr_clk,
		ctlr_rst     => sdrsys_rst,
		ctlr_bl      => "000",
		ctlr_cl      => sdram_params.cl,

		ctlrphy_rst  => ctlrphy_rst,
		ctlrphy_cke  => ctlrphy_cke,
		ctlrphy_cs   => ctlrphy_cs,
		ctlrphy_ras  => ctlrphy_ras,
		ctlrphy_cas  => ctlrphy_cas,
		ctlrphy_we   => ctlrphy_we,
		ctlrphy_b    => ctlrphy_b,
		ctlrphy_a    => ctlrphy_a,
		ctlrphy_dmt  => ctlrphy_dmt,
		ctlrphy_dmo  => ctlrphy_dmo,
		ctlrphy_dqi  => ctlrphy_dqi,
		ctlrphy_dqt  => ctlrphy_dqt,
		ctlrphy_dqo  => ctlrphy_dqo,
		ctlrphy_sto  => ctlrphy_sto,
		ctlrphy_sti  => ctlrphy_sti);

	sdrphy_e : entity hdl4fpga.ecp5_sdrphy
	generic map (
		gear       => gear,
		bank_size  => sdram_ba'length,
		addr_size  => sdram_a'length,
		word_size  => word_size,
		byte_size  => byte_size,
		wr_fifo    => false,
		rd_fifo    => false,
		bypass     => true)
	port map (
		sclk       => ctlr_clk,
		rst        => sdrsys_rst,

		sys_cs(0)  => ctlrphy_cs,
		sys_cke(0) => ctlrphy_cke,
		sys_ras(0) => ctlrphy_ras,
		sys_cas(0) => ctlrphy_cas,
		sys_we(0)  => ctlrphy_we,
		sys_b      => ctlrphy_b,
		sys_a      => ctlrphy_a,
		sys_dmt    => ctlrphy_dmt,
		sys_dmi    => ctlrphy_dmo,
		sys_dqi    => ctlrphy_dqo,
		sys_dqt    => ctlrphy_dqt,
		sys_dqo    => ctlrphy_dqi,
		sys_sti    => ctlrphy_sto,
		sys_sto    => ctlrphy_sti,

		sdram_clk  => sdram_clk,
		sdram_cke  => sdram_cke,
		sdram_cs   => sdram_csn,
		sdram_ras  => sdram_rasn,
		sdram_cas  => sdram_casn,
		sdram_we   => sdram_wen,
		sdram_b    => sdram_ba,
		sdram_a    => sdram_a,
		sdram_dqs  => sdram_dqs,

		sdram_dm   => sdram_dqm,
		sdram_dqi  => x"aa55",
		sdram_dq   => sdram_d);

	-- VGA --
	---------

	sdr_g : for i in gpdi_d'range generate
		signal q : std_logic;
	begin
		oddr_i : oddrx1f
		port map(
			sclk => video_shift_clk,
			rst  => '0',
			d0   => dvid_crgb(2*i),
			d1   => dvid_crgb(2*i+1),
			q    => q);
		olvds_i : olvds
		port map(
			a  => q,
			z  => gpdi_d(i),
			zn => gpdi_dn(i));
	end generate;

end;
