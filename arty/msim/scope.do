onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/rst
add wave -noupdate /testbench/arty_e/gclk100
add wave -noupdate /testbench/ddr_clk_p
add wave -noupdate /testbench/cke
add wave -noupdate /testbench/rst_n
add wave -noupdate /testbench/cs_n
add wave -noupdate /testbench/ras_n
add wave -noupdate /testbench/cas_n
add wave -noupdate /testbench/we_n
add wave -noupdate /testbench/odt
add wave -noupdate -radix hexadecimal -childformat {{/testbench/ba(2) -radix hexadecimal} {/testbench/ba(1) -radix hexadecimal} {/testbench/ba(0) -radix hexadecimal}} -subitemconfig {/testbench/ba(2) {-height 16 -radix hexadecimal} /testbench/ba(1) {-height 16 -radix hexadecimal} /testbench/ba(0) {-height 16 -radix hexadecimal}} /testbench/ba
add wave -noupdate -radix hexadecimal /testbench/addr
add wave -noupdate -radix hexadecimal /testbench/dq
add wave -noupdate /testbench/dqs_p
add wave -noupdate /testbench/arty_e/ddrphy_e/byte_g(1)/ddrdqphy_i/iddr_g(7)/dqs_clk
add wave -noupdate /testbench/arty_e/ddrphy_e/byte_g(1)/ddrdqphy_i/sys_rdclk
add wave -noupdate -radix hexadecimal /testbench/arty_e/ddrphy_e/sys_dqi
add wave -noupdate -radix hexadecimal /testbench/arty_e/scope_e/ddr_dqi
add wave -noupdate /testbench/arty_e/scope_e/ddr_sti(0)
add wave -noupdate -expand /testbench/arty_e/ddrphy_e/byte_g(1)/ddrdqphy_i/smp
add wave -noupdate /testbench/arty_e/ddrphy_e/byte_g(1)/ddrdqphy_i/dqso_b/adjsto_e/line__28/cnt
add wave -noupdate /testbench/arty_e/ddrphy_e/byte_g(1)/ddrdqphy_i/dqso_b/adjsto_e/smp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {15471136 ps} 0} {{Cursor 2} {21214448 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
configure wave -timelineunits ns
update
WaveRestoreZoom {15450041 ps} {15495159 ps}
