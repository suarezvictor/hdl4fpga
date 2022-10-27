CONSTRAINTS = ./constraints/ulx3s_demos.lpf

TOP_MODULE = ulx3s
TOP_MODULE_FILE = ../basic/ulx3s.vhd

VHDL_FILES = \
  $(TOP_MODULE_FILE) \
  ../demos/graphic.vhd \

VHDL_LIB_NAME = hdl4fpga
VHDL_LIB_FILES = \
../../library/basic/align.vhd \
../../library/basic/base.vhd\
../../library/basic/bram.vhd \
../../library/basic/dpram.vhd \
../../library/basic/rom.vhd \
../../library/basic/arbiter.vhd \
../../library/basic/serdes.vhd \
../../library/scope/scopeiopkg.vhd \
../../library/scope/scopeio_istream.vhd \
../../library/scope/scopeio_istreamdaisy.vhd \
../../library/scope/scopeio_sin.vhd \
../../library/scope/textboxpkg.vhd \
../../library/uart/uart_rx.vhd \
../../library/video/video.vhd \
../../library/video/videopkg.vhd \
../../library/video/modeline_calculator.vhd \
../../library/video/vga2dvid.vhd \
../../library/video/tmds_encoder.vhd \
../../library/video/graphic.vhd \
../../library/ddr/ddr_db.vhd \
../../library/ddr/ddr_init.vhd \
../../library/ddr/ddr_iofifo.vhd \
../../library/ddr/ddr_mpu.vhd \
../../library/ddr/ddr_param.vhd \
../../library/ddr/ddr_pgm.vhd \
../../library/ddr/ddr_ph.vhd \
../../library/ddr/ddr_rdfifo.vhd \
../../library/ddr/ddr_sch.vhd \
../../library/ddr/ddr_timer.vhd \
../../library/ddr/ddr_wrfifo.vhd \
../../library/ddr/ddrdma.vhd \
../../library/ddr/dmactlr.vhd \
../../library/ddr/dmatrans.vhd \
../../library/basic/timer.vhd \
../../library/basic/barrel.vhd \
../../library/latticesemi/dbuf.vhd \
../../library/latticesemi/ecp3/dbram.vhd \
../../library/latticesemi/ecp3/ff.vhd \
../../library/basic/cntrcs.vhd \
../../library/scope/scopeio_rgtr.vhd \
../../library/basic/fifo.vhd \
../../library/basic/grant.vhd \
../../library/latticesemi/sdrbaphy.vhd \
../../library/latticesemi/sdrdqphy.vhd \
../../library/latticesemi/sdrphy.vhd \
../../library/ddr/ddr_ctlr.vhd \
../../library/basic/align.vhd \
../../library/basic/base.vhd \
../../library/basic/bram.vhd \
../../library/basic/dpram.vhd \
../../library/basic/bram_true2p_2clk.vhd \
../../library/basic/rom.vhd \
../../library/basic/bcddiv2e.vhd \
../../library/basic/vector.vhd \
../../library/basic/dbdbbl.vhd \
../../library/basic/stof.vhd \
../../library/basic/dtos.vhd \
../../library/basic/btod.vhd \
../../library/basic/btof.vhd \
../../library/basic/arbiter.vhd \
../../library/scope/scopeio.vhd \
../../library/scope/scopeiopkg.vhd \
../../library/scope/scopeio_capture.vhd \
../../library/scope/scopeio_capture1shot.vhd \
../../library/scope/scopeio_storage.vhd \
../../library/scope/scopeio_resize.vhd \
../../library/scope/scopeio_video.vhd \
../../library/scope/scopeio_textbox.vhd \
../../library/scope/scopeio_pointer.vhd \
../../library/scope/scopeio_ps2mouse2daisy.vhd \
../../library/scope/scopeio_usbmouse2daisy.vhd \
../../library/scope/scopeio_hostmouse2daisy.vhd \
../../library/ps2mouse/mousem.vhd \
../../library/scope/scopeio_mouse2rgtr.vhd \
../../library/scope/scopeio_rgtr2daisy.vhd \
../../library/scope/scopeio_miiudp.vhd \
../../library/scope/scopeio_istream.vhd \
../../library/scope/scopeio_istreamdaisy.vhd \
../../library/scope/scopeio_sin.vhd \
../../library/scope/scopeio_udpipdaisy.vhd \
../../library/scope/scopeio_tds_1shot.vhd \
../../library/scope/scopeio_rgtrtrigger.vhd \
../../library/scope/scopeio_rgtrgain.vhd \
../../library/scope/scopeio_rgtrpointer.vhd \
../../library/scope/scopeio_rgtrvtaxis.vhd \
../../library/scope/scopeio_rgtrpalette.vhd \
../../library/scope/scopeio_rgtrhzaxis.vhd \
../../library/scope/scopeio_rgtrmyip.vhd \
../../library/scope/scopeio_amp.vhd \
../../library/scope/scopeio_downsampler.vhd \
../../library/scope/scopeio_grid.vhd \
../../library/scope/scopeio_palette.vhd \
../../library/scope/scopeio_segment.vhd \
../../library/scope/scopeio_tracer.vhd \
../../library/scope/scopeio_trigger.vhd \
../../library/scope/scopeio_axis.vhd \
../../library/scope/scopeio_btof.vhd \
../../library/scope/scopeio_float2btof.vhd \
../../library/scope/scopeio_layout.vhd \
../../library/scope/textboxpkg.vhd \
../../library/uart/uart_rx.vhd \
../../library/uart/uart_rx_f32c.vhd \
../../library/mii/miirx_pre.vhd \
../../library/mii/mii_1chksum.vhd \
../../library/mii/mii_cat.vhd \
../../library/mii/mii_cmp.vhd \
../../library/mii/mii_crc32.vhd \
../../library/mii/mii_ipcfg.vhd \
../../library/mii/mii_pll2ser.vhd \
../../library/mii/mii_pllcmp.vhd \
../../library/mii/mii_ram.vhd \
../../library/mii/mii_rom.vhd \
../../library/mii/mii_romcmp.vhd \
../../library/mii/miitx_dll.vhd \
../../library/usb/usbcdc/usb_serial.vhd \
../../library/usb/usbcdc/usb_mii.vhd \
../../library/usb/usbcdc/usb_cdc_descriptor_pack.vhd \
../../library/usb/usbcdc/usb_transact.vhd \
../../library/usb/usbcdc/usb_packet.vhd \
../../library/usb/usbcdc/usb_init.vhd \
../../library/usb/usbcdc/usb_control.vhd \
../../library/usb/usbhost/usbh_host_hid.vhd \
../../library/usb/usbhost/usbh_setup_pack.vhd \
../../library/usb/usbhost/usbh_report_decoder_logitech_mouse.vhd \
../../library/usb/usbhost/usbh_sie_vhdl.vhd \
../../library/usb/usb11_phy_vhdl/usb_phy_transciver.vhd \
../../library/usb/usb11_phy_vhdl/usb_phy.vhd \
../../library/usb/usb11_phy_vhdl/usb_rx_phy_48MHz.vhd \
../../library/usb/usb11_phy_vhdl/usb_rx_phy_emard.vhd \
../../library/usb/usb11_phy_vhdl/usb_tx_phy.vhd \
../../library/usb/ulpi_wrapper/ulpi_wrapper_vhdl.vhd \
../../library/video/video.vhd \
../../library/video/videopkg.vhd \
../../library/video/cgafonts.vhd \
../../library/video/fonts/cp850x8x16x0to127.vhd \
../../library/video/fonts/cp850x8x16x128to255.vhd \
../../library/video/fonts/cp850x8x8x0to127.vhd \
../../library/video/fonts/cp850x8x8x128to255.vhd \
../../library/video/fonts/bcdfonts.vhd \
../../library/video/cga_rom.vhd \
../../library/video/vga2dvid.vhd \
../../library/video/tmds_encoder.vhd \
../../library/video/cga_adapter.vhd \
