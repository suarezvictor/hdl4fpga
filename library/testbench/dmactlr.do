onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/s3estarter_e/xtal
add wave -noupdate -expand /testbench/s3estarter_e/ddrsys_clks
add wave -noupdate -expand -group Micron /testbench/ddr_model_g/Clk
add wave -noupdate -expand -group Micron /testbench/ddr_model_g/Clk_n
add wave -noupdate -expand -group Micron /testbench/ddr_model_g/Cke
add wave -noupdate -expand -group Micron /testbench/ddr_model_g/Cs_n
add wave -noupdate -expand -group Micron /testbench/ddr_model_g/Ras_n
add wave -noupdate -expand -group Micron /testbench/ddr_model_g/Cas_n
add wave -noupdate -expand -group Micron /testbench/ddr_model_g/We_n
add wave -noupdate -expand -group Micron /testbench/ddr_model_g/Ba
add wave -noupdate -expand -group Micron -radix hexadecimal -childformat {{{/testbench/ddr_model_g/Addr[12]} -radix hexadecimal} {{/testbench/ddr_model_g/Addr[11]} -radix hexadecimal} {{/testbench/ddr_model_g/Addr[10]} -radix hexadecimal} {{/testbench/ddr_model_g/Addr[9]} -radix hexadecimal} {{/testbench/ddr_model_g/Addr[8]} -radix hexadecimal} {{/testbench/ddr_model_g/Addr[7]} -radix hexadecimal} {{/testbench/ddr_model_g/Addr[6]} -radix hexadecimal} {{/testbench/ddr_model_g/Addr[5]} -radix hexadecimal} {{/testbench/ddr_model_g/Addr[4]} -radix hexadecimal} {{/testbench/ddr_model_g/Addr[3]} -radix hexadecimal} {{/testbench/ddr_model_g/Addr[2]} -radix hexadecimal} {{/testbench/ddr_model_g/Addr[1]} -radix hexadecimal} {{/testbench/ddr_model_g/Addr[0]} -radix hexadecimal}} -subitemconfig {{/testbench/ddr_model_g/Addr[12]} {-height 29 -radix hexadecimal} {/testbench/ddr_model_g/Addr[11]} {-height 29 -radix hexadecimal} {/testbench/ddr_model_g/Addr[10]} {-height 29 -radix hexadecimal} {/testbench/ddr_model_g/Addr[9]} {-height 29 -radix hexadecimal} {/testbench/ddr_model_g/Addr[8]} {-height 29 -radix hexadecimal} {/testbench/ddr_model_g/Addr[7]} {-height 29 -radix hexadecimal} {/testbench/ddr_model_g/Addr[6]} {-height 29 -radix hexadecimal} {/testbench/ddr_model_g/Addr[5]} {-height 29 -radix hexadecimal} {/testbench/ddr_model_g/Addr[4]} {-height 29 -radix hexadecimal} {/testbench/ddr_model_g/Addr[3]} {-height 29 -radix hexadecimal} {/testbench/ddr_model_g/Addr[2]} {-height 29 -radix hexadecimal} {/testbench/ddr_model_g/Addr[1]} {-height 29 -radix hexadecimal} {/testbench/ddr_model_g/Addr[0]} {-height 29 -radix hexadecimal}} /testbench/ddr_model_g/Addr
add wave -noupdate -expand -group Micron /testbench/ddr_model_g/Dm
add wave -noupdate -expand -group Micron -radix hexadecimal /testbench/ddr_model_g/Dq
add wave -noupdate -expand -group Micron /testbench/ddr_model_g/Dqs
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/g_data
add wave -noupdate /testbench/s3estarter_e/ddrphy_rst
add wave -noupdate /testbench/s3estarter_e/ddrphy_cke
add wave -noupdate /testbench/s3estarter_e/ddrphy_cs
add wave -noupdate /testbench/s3estarter_e/ddrphy_ras
add wave -noupdate /testbench/s3estarter_e/ddrphy_cas
add wave -noupdate /testbench/s3estarter_e/ddrphy_we
add wave -noupdate /testbench/s3estarter_e/ddrphy_odt
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/ddrphy_b
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/ddrphy_a
add wave -noupdate /testbench/s3estarter_e/ddrphy_dqsi
add wave -noupdate /testbench/s3estarter_e/ddrphy_dqst
add wave -noupdate /testbench/s3estarter_e/ddrphy_dqso
add wave -noupdate /testbench/s3estarter_e/ddrphy_dmi
add wave -noupdate /testbench/s3estarter_e/ddrphy_dmt
add wave -noupdate /testbench/s3estarter_e/ddrphy_dmo
add wave -noupdate -radix hexadecimal -childformat {{/testbench/s3estarter_e/ddrphy_dqi(31) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(30) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(29) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(28) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(27) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(26) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(25) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(24) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(23) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(22) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(21) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(20) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(19) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(18) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(17) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(16) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(15) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(14) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(13) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(12) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(11) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(10) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(9) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(8) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(7) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(6) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(5) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(4) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(3) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(2) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(1) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqi(0) -radix hexadecimal}} -subitemconfig {/testbench/s3estarter_e/ddrphy_dqi(31) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(30) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(29) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(28) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(27) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(26) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(25) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(24) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(23) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(22) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(21) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(20) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(19) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(18) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(17) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(16) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(15) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(14) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(13) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(12) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(11) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(10) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(9) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(8) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(7) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(6) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(5) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(4) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(3) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(2) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(1) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqi(0) {-height 29 -radix hexadecimal}} /testbench/s3estarter_e/ddrphy_dqi
add wave -noupdate /testbench/s3estarter_e/ddrphy_dqt
add wave -noupdate -radix hexadecimal -childformat {{/testbench/s3estarter_e/ddrphy_dqo(31) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(30) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(29) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(28) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(27) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(26) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(25) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(24) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(23) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(22) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(21) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(20) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(19) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(18) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(17) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(16) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(15) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(14) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(13) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(12) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(11) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(10) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(9) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(8) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(7) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(6) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(5) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(4) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(3) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(2) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(1) -radix hexadecimal} {/testbench/s3estarter_e/ddrphy_dqo(0) -radix hexadecimal}} -subitemconfig {/testbench/s3estarter_e/ddrphy_dqo(31) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(30) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(29) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(28) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(27) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(26) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(25) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(24) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(23) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(22) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(21) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(20) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(19) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(18) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(17) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(16) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(15) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(14) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(13) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(12) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(11) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(10) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(9) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(8) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(7) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(6) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(5) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(4) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(3) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(2) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(1) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrphy_dqo(0) {-height 29 -radix hexadecimal}} /testbench/s3estarter_e/ddrphy_dqo
add wave -noupdate /testbench/s3estarter_e/ddrphy_sto
add wave -noupdate /testbench/s3estarter_e/ddrphy_sti
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/ddr_dqo
add wave -noupdate -divider DDRCTLR
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/ddrctlr_e/rot_di
add wave -noupdate /testbench/s3estarter_e/ddrctlr_e/phy_dqo
add wave -noupdate /testbench/s3estarter_e/ddrctlr_e/ddr_mpu_wri
add wave -noupdate -expand -group wrfifo /testbench/s3estarter_e/ddrctlr_e/wrfifo_i/ctlr_clk
add wave -noupdate -expand -group wrfifo /testbench/s3estarter_e/ddrctlr_e/wrfifo_i/ctlr_req
add wave -noupdate -expand -group wrfifo /testbench/s3estarter_e/ddrctlr_e/wrfifo_i/ctlr_ena
add wave -noupdate -expand -group wrfifo /testbench/s3estarter_e/ddrctlr_e/wrfifo_i/ctlr_dmi
add wave -noupdate -expand -group wrfifo -radix hexadecimal /testbench/s3estarter_e/ddrctlr_e/wrfifo_i/ctlr_dqi
add wave -noupdate -expand -group wrfifo /testbench/s3estarter_e/ddrctlr_e/wrfifo_i/ddr_clks
add wave -noupdate -expand -group wrfifo /testbench/s3estarter_e/ddrctlr_e/wrfifo_i/ddr_enas
add wave -noupdate -expand -group wrfifo /testbench/s3estarter_e/ddrctlr_e/wrfifo_i/ddr_dmo
add wave -noupdate -expand -group wrfifo -radix hexadecimal /testbench/s3estarter_e/ddrctlr_e/wrfifo_i/ddr_dqo
add wave -noupdate -divider DDRDRMA
add wave -noupdate /testbench/s3estarter_e/dmactlr_e/dma_e/ddrdma_frm
add wave -noupdate /testbench/s3estarter_e/dmactlr_e/dma_e/ctlr_irdy
add wave -noupdate /testbench/s3estarter_e/dmactlr_e/dma_e/ctlr_trdy
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/dmactlr_e/dma_e/line__56/bnk_addr
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/dmactlr_e/dma_e/line__56/row_addr
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/dmactlr_e/dma_e/line__56/col_addr
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/dmactlr_e/dma_e/line__56/bnk_cntr
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/dmactlr_e/dma_e/line__56/row_cntr
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/dmactlr_e/dma_e/line__56/col_cntr
add wave -noupdate -divider DMACTLR
add wave -noupdate /testbench/s3estarter_e/dmactlr_e/dmactlr_rst
add wave -noupdate /testbench/s3estarter_e/dmactlr_e/dmactlr_clk
add wave -noupdate /testbench/s3estarter_e/dmactlr_e/dmactlr_frm
add wave -noupdate /testbench/s3estarter_e/dmactlr_e/dmactlr_irdy
add wave -noupdate /testbench/s3estarter_e/dmactlr_e/dmactlr_trdy
add wave -noupdate /testbench/s3estarter_e/dmactlr_e/dmactlr_we
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/dmactlr_e/dmactlr_iaddr
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/dmactlr_e/dmactlr_ilen
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/dmactlr_e/dmactlr_taddr
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/dmactlr_e/dmactlr_tlen
add wave -noupdate /testbench/s3estarter_e/dmactlr_e/ctlr_inirdy
add wave -noupdate /testbench/s3estarter_e/dmactlr_e/ctlr_refreq
add wave -noupdate /testbench/s3estarter_e/dmactlr_e/ctlr_irdy
add wave -noupdate /testbench/s3estarter_e/dmactlr_e/ctlr_trdy
add wave -noupdate /testbench/s3estarter_e/dmactlr_e/ctlr_rw
add wave -noupdate /testbench/s3estarter_e/dmactlr_e/ctlr_act
add wave -noupdate /testbench/s3estarter_e/dmactlr_e/ctlr_cas
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/dmactlr_e/ctlr_b
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/dmactlr_e/ctlr_a
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/g_data
add wave -noupdate /testbench/s3estarter_e/dmactlr_e/ctlr_di_irdy
add wave -noupdate /testbench/s3estarter_e/dmactlr_e/ctlr_di_trdy
add wave -noupdate -divider DDRCTLR
add wave -noupdate /testbench/s3estarter_e/ddrctlr_e/ctlr_di_irdy
add wave -noupdate /testbench/s3estarter_e/ddrctlr_e/ctlr_di_trdy
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/ddrctlr_e/ctlr_di
add wave -noupdate /testbench/s3estarter_e/ddrctlr_e/ctlr_dm
add wave -noupdate /testbench/s3estarter_e/ddrctlr_e/phy_dmi
add wave -noupdate /testbench/s3estarter_e/ddrctlr_e/phy_dmt
add wave -noupdate /testbench/s3estarter_e/ddrctlr_e/phy_dmo
add wave -noupdate -radix hexadecimal /testbench/s3estarter_e/ddrctlr_e/phy_dqi
add wave -noupdate -radix binary -childformat {{/testbench/s3estarter_e/ddrctlr_e/phy_dqt(3) -radix binary} {/testbench/s3estarter_e/ddrctlr_e/phy_dqt(2) -radix binary} {/testbench/s3estarter_e/ddrctlr_e/phy_dqt(1) -radix binary} {/testbench/s3estarter_e/ddrctlr_e/phy_dqt(0) -radix binary}} -subitemconfig {/testbench/s3estarter_e/ddrctlr_e/phy_dqt(3) {-height 29 -radix binary} /testbench/s3estarter_e/ddrctlr_e/phy_dqt(2) {-height 29 -radix binary} /testbench/s3estarter_e/ddrctlr_e/phy_dqt(1) {-height 29 -radix binary} /testbench/s3estarter_e/ddrctlr_e/phy_dqt(0) {-height 29 -radix binary}} /testbench/s3estarter_e/ddrctlr_e/phy_dqt
add wave -noupdate -radix hexadecimal -childformat {{/testbench/s3estarter_e/ddrctlr_e/phy_dqo(31) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(30) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(29) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(28) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(27) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(26) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(25) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(24) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(23) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(22) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(21) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(20) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(19) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(18) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(17) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(16) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(15) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(14) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(13) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(12) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(11) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(10) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(9) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(8) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(7) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(6) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(5) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(4) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(3) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(2) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(1) -radix hexadecimal} {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(0) -radix hexadecimal}} -subitemconfig {/testbench/s3estarter_e/ddrctlr_e/phy_dqo(31) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(30) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(29) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(28) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(27) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(26) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(25) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(24) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(23) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(22) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(21) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(20) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(19) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(18) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(17) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(16) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(15) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(14) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(13) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(12) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(11) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(10) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(9) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(8) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(7) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(6) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(5) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(4) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(3) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(2) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(1) {-height 29 -radix hexadecimal} /testbench/s3estarter_e/ddrctlr_e/phy_dqo(0) {-height 29 -radix hexadecimal}} /testbench/s3estarter_e/ddrctlr_e/phy_dqo
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {203984597 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 304
configure wave -valuecolwidth 163
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
configure wave -timelineunits ps
update
WaveRestoreZoom {203951034 ps} {204160472 ps}
