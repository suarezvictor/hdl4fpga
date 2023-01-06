onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/du_e/clk_25mhz
add wave -noupdate -group rgmii /testbench/du_e/rgmii_rx_clk
add wave -noupdate -group rgmii /testbench/du_e/rgmii_rx_dv
add wave -noupdate -group rgmii -radix hexadecimal -childformat {{/testbench/du_e/rgmii_rxd(0) -radix hexadecimal} {/testbench/du_e/rgmii_rxd(1) -radix hexadecimal} {/testbench/du_e/rgmii_rxd(2) -radix hexadecimal} {/testbench/du_e/rgmii_rxd(3) -radix hexadecimal}} -expand -subitemconfig {/testbench/du_e/rgmii_rxd(0) {-height 29 -radix hexadecimal} /testbench/du_e/rgmii_rxd(1) {-height 29 -radix hexadecimal} /testbench/du_e/rgmii_rxd(2) {-height 29 -radix hexadecimal} /testbench/du_e/rgmii_rxd(3) {-height 29 -radix hexadecimal}} /testbench/du_e/rgmii_rxd
add wave -noupdate -group rgmii /testbench/du_e/rgmii_tx_clk
add wave -noupdate -group rgmii /testbench/du_e/rgmii_tx_en
add wave -noupdate -group rgmii -radix hexadecimal /testbench/du_e/rgmii_txd
add wave -noupdate -expand -group ddram /testbench/du_e/ddram_clk
add wave -noupdate -expand -group ddram /testbench/du_e/ddram_reset_n
add wave -noupdate -expand -group ddram /testbench/du_e/ddram_cke
add wave -noupdate -expand -group ddram /testbench/du_e/ddram_cs_n
add wave -noupdate -expand -group ddram /testbench/du_e/ddram_ras_n
add wave -noupdate -expand -group ddram /testbench/du_e/ddram_cas_n
add wave -noupdate -expand -group ddram /testbench/du_e/ddram_we_n
add wave -noupdate -expand -group ddram /testbench/du_e/ddram_odt
add wave -noupdate -expand -group ddram -radix hexadecimal /testbench/du_e/ddram_a
add wave -noupdate -expand -group ddram -radix hexadecimal /testbench/du_e/ddram_ba
add wave -noupdate -expand -group ddram -radix hexadecimal -childformat {{/testbench/du_e/ddram_dq(15) -radix hexadecimal} {/testbench/du_e/ddram_dq(14) -radix hexadecimal} {/testbench/du_e/ddram_dq(13) -radix hexadecimal} {/testbench/du_e/ddram_dq(12) -radix hexadecimal} {/testbench/du_e/ddram_dq(11) -radix hexadecimal} {/testbench/du_e/ddram_dq(10) -radix hexadecimal} {/testbench/du_e/ddram_dq(9) -radix hexadecimal} {/testbench/du_e/ddram_dq(8) -radix hexadecimal} {/testbench/du_e/ddram_dq(7) -radix hexadecimal} {/testbench/du_e/ddram_dq(6) -radix hexadecimal} {/testbench/du_e/ddram_dq(5) -radix hexadecimal} {/testbench/du_e/ddram_dq(4) -radix hexadecimal} {/testbench/du_e/ddram_dq(3) -radix hexadecimal} {/testbench/du_e/ddram_dq(2) -radix hexadecimal} {/testbench/du_e/ddram_dq(1) -radix hexadecimal} {/testbench/du_e/ddram_dq(0) -radix hexadecimal}} -subitemconfig {/testbench/du_e/ddram_dq(15) {-height 29 -radix hexadecimal} /testbench/du_e/ddram_dq(14) {-height 29 -radix hexadecimal} /testbench/du_e/ddram_dq(13) {-height 29 -radix hexadecimal} /testbench/du_e/ddram_dq(12) {-height 29 -radix hexadecimal} /testbench/du_e/ddram_dq(11) {-height 29 -radix hexadecimal} /testbench/du_e/ddram_dq(10) {-height 29 -radix hexadecimal} /testbench/du_e/ddram_dq(9) {-height 29 -radix hexadecimal} /testbench/du_e/ddram_dq(8) {-height 29 -radix hexadecimal} /testbench/du_e/ddram_dq(7) {-height 29 -radix hexadecimal} /testbench/du_e/ddram_dq(6) {-height 29 -radix hexadecimal} /testbench/du_e/ddram_dq(5) {-height 29 -radix hexadecimal} /testbench/du_e/ddram_dq(4) {-height 29 -radix hexadecimal} /testbench/du_e/ddram_dq(3) {-height 29 -radix hexadecimal} /testbench/du_e/ddram_dq(2) {-height 29 -radix hexadecimal} /testbench/du_e/ddram_dq(1) {-height 29 -radix hexadecimal} /testbench/du_e/ddram_dq(0) {-height 29 -radix hexadecimal}} /testbench/du_e/ddram_dq
add wave -noupdate -expand -group ddram -radix hexadecimal /testbench/du_e/ddram_dm
add wave -noupdate -expand -group ddram -expand /testbench/du_e/ddram_dqs
add wave -noupdate -divider {New Divider}
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/delta
add wave -noupdate -expand /testbench/du_e/sdrphy_e/dqs_locked
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/RSTB2
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/RST_FIFO
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/pause_q0
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/pause_q1
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/pause_q2
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/cnten
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/phy_sti
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/READ0
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/DQSI
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/BURSTDET
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/dqs_rise_cnt_ok
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/dqs_rise_cnt1
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/dqs_rise_cnt0
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/dqs_fall_cnt_ok
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/dqs_fall_cnt1
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/dqs_fall_cnt0
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/dqs_1st_fall_cnt2
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/dqs_1st_fall_cnt01
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/dqs_1st_fall_cnt1
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/dqs_1st_fall_cnt0
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/PAUSE
add wave -noupdate -radix hexadecimal /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/lat
add wave -noupdate -radix hexadecimal -childformat {{/testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/readclksel(2) -radix hexadecimal} {/testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/readclksel(1) -radix hexadecimal} {/testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/readclksel(0) -radix hexadecimal}} -subitemconfig {/testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/readclksel(2) {-height 29 -radix hexadecimal} /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/readclksel(1) {-height 29 -radix hexadecimal} /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/readclksel(0) {-height 29 -radix hexadecimal}} /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/readclksel
add wave -noupdate -divider {New Divider}
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/read_shift_clk
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/read_posti_del
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/read_post
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/read_pre
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/read_ena
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/set_dqs_ena
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/dqs_ena
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/DQSIB
add wave -noupdate -divider {New Divider}
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/dqs_clean
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/set_dqs_ena
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/dqs_ena
add wave -noupdate -divider {New Divider}
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/DQSR90_int
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/cnt_rstn
add wave -noupdate -divider {New Divider}
add wave -noupdate /testbench/du_e/ddram_clk
add wave -noupdate /testbench/du_e/ddram_dqs(1)
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/phy_rlreq
add wave -noupdate -radix decimal /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dyndelay
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/phy_rlrdy
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/rl_b/step_req
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/rl_b/step_rdy
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/rl_b/adj_req
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/rl_b/adj_rdy
add wave -noupdate -radix hexadecimal /testbench/du_e/graphics_e/ctlrphy_sti
add wave -noupdate -radix hexadecimal /testbench/du_e/graphics_e/ctlr_do
add wave -noupdate -radix hexadecimal /testbench/du_e/graphics_e/ctlr_do_dv
add wave -noupdate /testbench/du_e/graphics_e/sio_b/tx_b/sodata_b/dmaso_irdy
add wave -noupdate -radix hexadecimal /testbench/du_e/graphics_e/sio_b/tx_b/sodata_b/dmaso_data
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/DQSW
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/DQSW270
add wave -noupdate -divider {New Divider}
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/DDRDELB
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/delta
add wave -noupdate -radix unsigned /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/rd_cntl_reg
add wave -noupdate -radix unsigned /testbench/du_e/sdrphy_e/byte_g(1)/sdr3phy_i/dqsbuf_b/dqsbufm_i/wr_delay_reg
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/wr_del
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/rd_del
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/ECLK
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/SCLK
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/rd
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/DQSI
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/DATAVALID
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/dqsbuf_b/dqsbufm_i/BURSTDET
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/rl_b/adjbrst_e/adj_req
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/rl_b/adjbrst_e/adj_rdy
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/rl_b/adjbrst_e/step_req
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/rl_b/adjbrst_e/step_rdy
add wave -noupdate -divider {New Divider}
add wave -noupdate /testbench/du_e/sdrphy_e/eclk
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/rl_b/adjbrst_e/input
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/rl_b/adjbrst_e/pause_req
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/rl_b/adjbrst_e/pause_rdy
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/rl_b/adjbrst_e/step_req
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdr3phy_i/rl_b/adjbrst_e/step_rdy
add wave -noupdate -divider {New Divider}
add wave -noupdate -radix hexadecimal -childformat {{/testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(1)/cntr(0) -radix hexadecimal} {/testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(1)/cntr(1) -radix hexadecimal} {/testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(1)/cntr(2) -radix hexadecimal} {/testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(1)/cntr(3) -radix hexadecimal} {/testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(1)/cntr(4) -radix hexadecimal} {/testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(1)/cntr(5) -radix hexadecimal} {/testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(1)/cntr(6) -radix hexadecimal}} -subitemconfig {/testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(1)/cntr(0) {-height 29 -radix hexadecimal} /testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(1)/cntr(1) {-height 29 -radix hexadecimal} /testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(1)/cntr(2) {-height 29 -radix hexadecimal} /testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(1)/cntr(3) {-height 29 -radix hexadecimal} /testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(1)/cntr(4) {-height 29 -radix hexadecimal} /testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(1)/cntr(5) {-height 29 -radix hexadecimal} /testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(1)/cntr(6) {-height 29 -radix hexadecimal}} /testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(1)/cntr
add wave -noupdate -radix hexadecimal -childformat {{/testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(0)/cntr(0) -radix hexadecimal} {/testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(0)/cntr(1) -radix hexadecimal} {/testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(0)/cntr(2) -radix hexadecimal} {/testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(0)/cntr(3) -radix hexadecimal} {/testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(0)/cntr(4) -radix hexadecimal} {/testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(0)/cntr(5) -radix hexadecimal}} -subitemconfig {/testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(0)/cntr(0) {-height 29 -radix hexadecimal} /testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(0)/cntr(1) {-height 29 -radix hexadecimal} /testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(0)/cntr(2) {-height 29 -radix hexadecimal} /testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(0)/cntr(3) {-height 29 -radix hexadecimal} /testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(0)/cntr(4) {-height 29 -radix hexadecimal} /testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(0)/cntr(5) {-height 29 -radix hexadecimal}} /testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/sdram_init_e/sdram_timer_b/timer_b/timer_e/cntr_g(0)/cntr
add wave -noupdate /testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/ctlr_di_dv
add wave -noupdate -radix hexadecimal /testbench/du_e/graphics_e/sdrctlr_b/sdrctlr_e/ctlr_di
add wave -noupdate -divider {New Divider}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {18572303920 fs} 0} {{Cursor 2} {38452818630 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 400
configure wave -valuecolwidth 112
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 fs} {52500 ns}
