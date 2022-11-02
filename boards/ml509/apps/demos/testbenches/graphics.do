onerror {resume}
quietly virtual signal -install /testbench/du_e { /testbench/du_e/ddr2_d(15 downto 0)} chip_dq0
quietly virtual signal -install /testbench/du_e { /testbench/du_e/ddr2_d(15 downto 0)} dq16
quietly virtual signal -install /testbench/du_e { /testbench/du_e/ddr2_d(7 downto 0)} dq8
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group phy_rx /testbench/du_e/phy_rxclk
add wave -noupdate -expand -group phy_rx /testbench/du_e/phy_rxctl_rxdv
add wave -noupdate -expand -group phy_rx -radix hexadecimal -childformat {{/testbench/du_e/phy_rxd(0) -radix hexadecimal} {/testbench/du_e/phy_rxd(1) -radix hexadecimal} {/testbench/du_e/phy_rxd(2) -radix hexadecimal} {/testbench/du_e/phy_rxd(3) -radix hexadecimal} {/testbench/du_e/phy_rxd(4) -radix hexadecimal} {/testbench/du_e/phy_rxd(5) -radix hexadecimal} {/testbench/du_e/phy_rxd(6) -radix hexadecimal} {/testbench/du_e/phy_rxd(7) -radix hexadecimal}} -subitemconfig {/testbench/du_e/phy_rxd(0) {-height 29 -radix hexadecimal} /testbench/du_e/phy_rxd(1) {-height 29 -radix hexadecimal} /testbench/du_e/phy_rxd(2) {-height 29 -radix hexadecimal} /testbench/du_e/phy_rxd(3) {-height 29 -radix hexadecimal} /testbench/du_e/phy_rxd(4) {-height 29 -radix hexadecimal} /testbench/du_e/phy_rxd(5) {-height 29 -radix hexadecimal} /testbench/du_e/phy_rxd(6) {-height 29 -radix hexadecimal} /testbench/du_e/phy_rxd(7) {-height 29 -radix hexadecimal}} /testbench/du_e/phy_rxd
add wave -noupdate -expand -group phy_tx /testbench/du_e/phy_txclk
add wave -noupdate -expand -group phy_tx /testbench/du_e/phy_txctl_txen
add wave -noupdate -expand -group phy_tx -radix hexadecimal /testbench/du_e/phy_txd
add wave -noupdate -expand -group ddr2 /testbench/du_e/ddr2_clk_p(0)
add wave -noupdate -expand -group ddr2 /testbench/du_e/ddr2_cs(0)
add wave -noupdate -expand -group ddr2 /testbench/du_e/ddr2_cke(0)
add wave -noupdate -expand -group ddr2 /testbench/du_e/ddr2_ras
add wave -noupdate -expand -group ddr2 /testbench/du_e/ddr2_cas
add wave -noupdate -expand -group ddr2 /testbench/du_e/ddr2_we
add wave -noupdate -expand -group ddr2 /testbench/du_e/ddr2_odt(0)
add wave -noupdate -expand -group ddr2 -radix hexadecimal -childformat {{/testbench/du_e/ddr2_a(13) -radix hexadecimal} {/testbench/du_e/ddr2_a(12) -radix hexadecimal} {/testbench/du_e/ddr2_a(11) -radix hexadecimal} {/testbench/du_e/ddr2_a(10) -radix hexadecimal} {/testbench/du_e/ddr2_a(9) -radix hexadecimal} {/testbench/du_e/ddr2_a(8) -radix hexadecimal} {/testbench/du_e/ddr2_a(7) -radix hexadecimal} {/testbench/du_e/ddr2_a(6) -radix hexadecimal} {/testbench/du_e/ddr2_a(5) -radix hexadecimal} {/testbench/du_e/ddr2_a(4) -radix hexadecimal} {/testbench/du_e/ddr2_a(3) -radix hexadecimal} {/testbench/du_e/ddr2_a(2) -radix hexadecimal} {/testbench/du_e/ddr2_a(1) -radix hexadecimal} {/testbench/du_e/ddr2_a(0) -radix hexadecimal}} -subitemconfig {/testbench/du_e/ddr2_a(13) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_a(12) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_a(11) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_a(10) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_a(9) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_a(8) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_a(7) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_a(6) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_a(5) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_a(4) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_a(3) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_a(2) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_a(1) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_a(0) {-height 29 -radix hexadecimal}} /testbench/du_e/ddr2_a
add wave -noupdate -expand -group ddr2 -radix hexadecimal -childformat {{/testbench/du_e/ddr2_ba(2) -radix hexadecimal} {/testbench/du_e/ddr2_ba(1) -radix hexadecimal} {/testbench/du_e/ddr2_ba(0) -radix hexadecimal}} -subitemconfig {/testbench/du_e/ddr2_ba(2) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_ba(1) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_ba(0) {-height 29 -radix hexadecimal}} /testbench/du_e/ddr2_ba
add wave -noupdate -expand -group ddr2 /testbench/du_e/ddr2_dqs_p(0)
add wave -noupdate -expand -group ddr2 /testbench/du_e/ddr2_dqs_p(1)
add wave -noupdate -expand -group ddr2 -radix hexadecimal /testbench/du_e/dq8
add wave -noupdate -expand -group ddr2 -radix hexadecimal -childformat {{/testbench/du_e/dq16(15) -radix hexadecimal} {/testbench/du_e/dq16(14) -radix hexadecimal} {/testbench/du_e/dq16(13) -radix hexadecimal} {/testbench/du_e/dq16(12) -radix hexadecimal} {/testbench/du_e/dq16(11) -radix hexadecimal} {/testbench/du_e/dq16(10) -radix hexadecimal} {/testbench/du_e/dq16(9) -radix hexadecimal} {/testbench/du_e/dq16(8) -radix hexadecimal} {/testbench/du_e/dq16(7) -radix hexadecimal} {/testbench/du_e/dq16(6) -radix hexadecimal} {/testbench/du_e/dq16(5) -radix hexadecimal} {/testbench/du_e/dq16(4) -radix hexadecimal} {/testbench/du_e/dq16(3) -radix hexadecimal} {/testbench/du_e/dq16(2) -radix hexadecimal} {/testbench/du_e/dq16(1) -radix hexadecimal} {/testbench/du_e/dq16(0) -radix hexadecimal}} -subitemconfig {/testbench/du_e/ddr2_d(15) {-radix hexadecimal} /testbench/du_e/ddr2_d(14) {-radix hexadecimal} /testbench/du_e/ddr2_d(13) {-radix hexadecimal} /testbench/du_e/ddr2_d(12) {-radix hexadecimal} /testbench/du_e/ddr2_d(11) {-radix hexadecimal} /testbench/du_e/ddr2_d(10) {-radix hexadecimal} /testbench/du_e/ddr2_d(9) {-radix hexadecimal} /testbench/du_e/ddr2_d(8) {-radix hexadecimal} /testbench/du_e/ddr2_d(7) {-radix hexadecimal} /testbench/du_e/ddr2_d(6) {-radix hexadecimal} /testbench/du_e/ddr2_d(5) {-radix hexadecimal} /testbench/du_e/ddr2_d(4) {-radix hexadecimal} /testbench/du_e/ddr2_d(3) {-radix hexadecimal} /testbench/du_e/ddr2_d(2) {-radix hexadecimal} /testbench/du_e/ddr2_d(1) {-radix hexadecimal} /testbench/du_e/ddr2_d(0) {-radix hexadecimal}} /testbench/du_e/dq16
add wave -noupdate -expand -group ddr2 -radix hexadecimal -childformat {{/testbench/du_e/ddr2_d(63) -radix hexadecimal} {/testbench/du_e/ddr2_d(62) -radix hexadecimal} {/testbench/du_e/ddr2_d(61) -radix hexadecimal} {/testbench/du_e/ddr2_d(60) -radix hexadecimal} {/testbench/du_e/ddr2_d(59) -radix hexadecimal} {/testbench/du_e/ddr2_d(58) -radix hexadecimal} {/testbench/du_e/ddr2_d(57) -radix hexadecimal} {/testbench/du_e/ddr2_d(56) -radix hexadecimal} {/testbench/du_e/ddr2_d(55) -radix hexadecimal} {/testbench/du_e/ddr2_d(54) -radix hexadecimal} {/testbench/du_e/ddr2_d(53) -radix hexadecimal} {/testbench/du_e/ddr2_d(52) -radix hexadecimal} {/testbench/du_e/ddr2_d(51) -radix hexadecimal} {/testbench/du_e/ddr2_d(50) -radix hexadecimal} {/testbench/du_e/ddr2_d(49) -radix hexadecimal} {/testbench/du_e/ddr2_d(48) -radix hexadecimal} {/testbench/du_e/ddr2_d(47) -radix hexadecimal} {/testbench/du_e/ddr2_d(46) -radix hexadecimal} {/testbench/du_e/ddr2_d(45) -radix hexadecimal} {/testbench/du_e/ddr2_d(44) -radix hexadecimal} {/testbench/du_e/ddr2_d(43) -radix hexadecimal} {/testbench/du_e/ddr2_d(42) -radix hexadecimal} {/testbench/du_e/ddr2_d(41) -radix hexadecimal} {/testbench/du_e/ddr2_d(40) -radix hexadecimal} {/testbench/du_e/ddr2_d(39) -radix hexadecimal} {/testbench/du_e/ddr2_d(38) -radix hexadecimal} {/testbench/du_e/ddr2_d(37) -radix hexadecimal} {/testbench/du_e/ddr2_d(36) -radix hexadecimal} {/testbench/du_e/ddr2_d(35) -radix hexadecimal} {/testbench/du_e/ddr2_d(34) -radix hexadecimal} {/testbench/du_e/ddr2_d(33) -radix hexadecimal} {/testbench/du_e/ddr2_d(32) -radix hexadecimal} {/testbench/du_e/ddr2_d(31) -radix hexadecimal} {/testbench/du_e/ddr2_d(30) -radix hexadecimal} {/testbench/du_e/ddr2_d(29) -radix hexadecimal} {/testbench/du_e/ddr2_d(28) -radix hexadecimal} {/testbench/du_e/ddr2_d(27) -radix hexadecimal} {/testbench/du_e/ddr2_d(26) -radix hexadecimal} {/testbench/du_e/ddr2_d(25) -radix hexadecimal} {/testbench/du_e/ddr2_d(24) -radix hexadecimal} {/testbench/du_e/ddr2_d(23) -radix hexadecimal} {/testbench/du_e/ddr2_d(22) -radix hexadecimal} {/testbench/du_e/ddr2_d(21) -radix hexadecimal} {/testbench/du_e/ddr2_d(20) -radix hexadecimal} {/testbench/du_e/ddr2_d(19) -radix hexadecimal} {/testbench/du_e/ddr2_d(18) -radix hexadecimal} {/testbench/du_e/ddr2_d(17) -radix hexadecimal} {/testbench/du_e/ddr2_d(16) -radix hexadecimal} {/testbench/du_e/ddr2_d(15) -radix hexadecimal} {/testbench/du_e/ddr2_d(14) -radix hexadecimal} {/testbench/du_e/ddr2_d(13) -radix hexadecimal} {/testbench/du_e/ddr2_d(12) -radix hexadecimal} {/testbench/du_e/ddr2_d(11) -radix hexadecimal} {/testbench/du_e/ddr2_d(10) -radix hexadecimal} {/testbench/du_e/ddr2_d(9) -radix hexadecimal} {/testbench/du_e/ddr2_d(8) -radix hexadecimal} {/testbench/du_e/ddr2_d(7) -radix hexadecimal} {/testbench/du_e/ddr2_d(6) -radix hexadecimal} {/testbench/du_e/ddr2_d(5) -radix hexadecimal} {/testbench/du_e/ddr2_d(4) -radix hexadecimal} {/testbench/du_e/ddr2_d(3) -radix hexadecimal} {/testbench/du_e/ddr2_d(2) -radix hexadecimal} {/testbench/du_e/ddr2_d(1) -radix hexadecimal} {/testbench/du_e/ddr2_d(0) -radix hexadecimal}} -subitemconfig {/testbench/du_e/ddr2_d(63) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(62) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(61) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(60) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(59) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(58) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(57) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(56) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(55) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(54) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(53) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(52) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(51) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(50) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(49) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(48) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(47) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(46) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(45) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(44) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(43) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(42) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(41) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(40) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(39) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(38) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(37) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(36) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(35) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(34) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(33) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(32) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(31) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(30) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(29) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(28) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(27) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(26) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(25) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(24) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(23) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(22) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(21) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(20) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(19) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(18) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(17) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(16) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(15) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(14) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(13) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(12) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(11) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(10) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(9) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(8) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(7) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(6) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(5) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(4) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(3) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(2) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(1) {-height 29 -radix hexadecimal} /testbench/du_e/ddr2_d(0) {-height 29 -radix hexadecimal}} /testbench/du_e/ddr2_d
add wave -noupdate -divider {New Divider}
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/datao_b/oddr_g(0)/dqo
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/adjdqs_req
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/adjdqs_rdy
add wave -noupdate /testbench/du_e/grahics_e/sdrctlr_b/sdrctlr_e/ctlr_rst
add wave -noupdate /testbench/du_e/grahics_e/ctlr_clks(0)
add wave -noupdate /testbench/du_e/grahics_e/sdrctlr_b/sdrctlr_e/ctlr_do_dv(0)
add wave -noupdate -radix hexadecimal /testbench/du_e/grahics_e/sdrctlr_b/sdrctlr_e/ctlr_do
add wave -noupdate -divider {New Divider}
add wave -noupdate -radix hexadecimal /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqipau_req
add wave -noupdate -radix hexadecimal /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqipau_rdy
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqspau_req
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqspau_rdy
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqipause_req
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqipause_rdy
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/pause_req
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/pause_rdy
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/read_rdy
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/read_req
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/write_rdy
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/write_req
add wave -noupdate -divider {New Divider}
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqsi_b/adjsto_e/sdram_clk
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqsi_b/adjsto_e/step_req
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqsi_b/adjsto_e/step_rdy
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqsi_b/adjsto_e/sys_req
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqsi_b/adjsto_e/sys_rdy
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqsi_b/adjsto_e/dqs_smp
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqsi_b/adjsto_e/dqs_pre
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqsi_b/adjsto_e/synced
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqsi_b/adjsto_e/sdram_sti
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqsi_b/adjsto_e/sdram_sto
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqsi_b/adjsto_e/sync
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqsi_b/adjsto_e/sel
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqsi_b/adjsto_e/seq
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqsi_b/adjsto_e/pre
add wave -noupdate -divider {New Divider}
add wave -noupdate -radix unsigned /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqsi_b/dqsidelay_i/delay
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqspre
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqsi_b/adjsto_e/sel
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqs180
add wave -noupdate -radix hexadecimal -childformat {{/testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/sys_sto(3) -radix hexadecimal} {/testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/sys_sto(2) -radix hexadecimal} {/testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/sys_sto(1) -radix hexadecimal} {/testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/sys_sto(0) -radix hexadecimal}} -subitemconfig {/testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/sys_sto(3) {-height 29 -radix hexadecimal} /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/sys_sto(2) {-height 29 -radix hexadecimal} /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/sys_sto(1) {-height 29 -radix hexadecimal} /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/sys_sto(0) {-height 29 -radix hexadecimal}} /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/sys_sto
add wave -noupdate -radix hexadecimal /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/sys_dqo
add wave -noupdate -radix hexadecimal /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dq
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/clk0
add wave -noupdate /testbench/du_e/sdrphy_e/clk90
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/clk0x2
add wave -noupdate /testbench/du_e/sdrphy_e/clk90x2
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqsi_b/dqsi_buf
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqi(1)
add wave -noupdate -divider {New Divider}
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/clk90x2
add wave -noupdate -divider {New Divider}
add wave -noupdate -radix hexadecimal /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqh
add wave -noupdate -radix hexadecimal /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqf
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/datai_b/i_igbx(1)/igbx_g/data_gear4_g/igbx_i/q
add wave -noupdate -divider {New Divider}
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqsi_b/igbx_i/d(0)
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqsi_b/igbx_i/q
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqs180
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/dqspre
add wave -noupdate -divider {New Divider}
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/adjdqs_req
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/adjdqs_rdy
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/adjdqi_req
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/adjdqi_rdy
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/adjsto_req
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/adjsto_rdy
add wave -noupdate /testbench/du_e/sdrphy_e/byte_g(0)/sdrdqphy_i/rl_b/line__143/state
add wave -noupdate -divider {New Divider}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {33682000 ps} 0} {{Cursor 2} {48740658 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 237
configure wave -valuecolwidth 290
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
WaveRestoreZoom {15087500 ps} {51837500 ps}
