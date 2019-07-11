onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/scopeio_e/input_clk
add wave -noupdate /testbench/scopeio_e/input_ena
add wave -noupdate -radix hexadecimal -childformat {{/testbench/input_addr(9) -radix hexadecimal} {/testbench/input_addr(8) -radix hexadecimal} {/testbench/input_addr(7) -radix hexadecimal} {/testbench/input_addr(6) -radix hexadecimal} {/testbench/input_addr(5) -radix hexadecimal} {/testbench/input_addr(4) -radix hexadecimal} {/testbench/input_addr(3) -radix hexadecimal} {/testbench/input_addr(2) -radix hexadecimal} {/testbench/input_addr(1) -radix hexadecimal} {/testbench/input_addr(0) -radix hexadecimal}} -subitemconfig {/testbench/input_addr(9) {-height 29 -radix hexadecimal} /testbench/input_addr(8) {-height 29 -radix hexadecimal} /testbench/input_addr(7) {-height 29 -radix hexadecimal} /testbench/input_addr(6) {-height 29 -radix hexadecimal} /testbench/input_addr(5) {-height 29 -radix hexadecimal} /testbench/input_addr(4) {-height 29 -radix hexadecimal} /testbench/input_addr(3) {-height 29 -radix hexadecimal} /testbench/input_addr(2) {-height 29 -radix hexadecimal} /testbench/input_addr(1) {-height 29 -radix hexadecimal} /testbench/input_addr(0) {-height 29 -radix hexadecimal}} /testbench/input_addr
add wave -noupdate -radix decimal /testbench/sample
add wave -noupdate -divider {New Divider}
add wave -noupdate -clampanalog 1 -format Analog-Step -height 124 -max 127.00000000000001 -min -63.0 -radix decimal /testbench/scopeio_e/input_data
add wave -noupdate -divider amp
add wave -noupdate /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_clk
add wave -noupdate -radix decimal -childformat {{/testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(0) -radix decimal} {/testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(1) -radix decimal} {/testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(2) -radix decimal} {/testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(3) -radix decimal} {/testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(4) -radix decimal} {/testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(5) -radix decimal} {/testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(6) -radix decimal} {/testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(7) -radix decimal} {/testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(8) -radix decimal} {/testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(9) -radix decimal} {/testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(10) -radix decimal} {/testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(11) -radix decimal} {/testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(12) -radix decimal} {/testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(13) -radix decimal}} -subitemconfig {/testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(0) {-height 29 -radix decimal} /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(1) {-height 29 -radix decimal} /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(2) {-height 29 -radix decimal} /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(3) {-height 29 -radix decimal} /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(4) {-height 29 -radix decimal} /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(5) {-height 29 -radix decimal} /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(6) {-height 29 -radix decimal} /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(7) {-height 29 -radix decimal} /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(8) {-height 29 -radix decimal} /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(9) {-height 29 -radix decimal} /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(10) {-height 29 -radix decimal} /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(11) {-height 29 -radix decimal} /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(12) {-height 29 -radix decimal} /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample(13) {-height 29 -radix decimal}} /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_sample
add wave -noupdate /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/input_dv
add wave -noupdate /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/output_dv
add wave -noupdate -radix decimal /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/output_sample
add wave -noupdate -radix decimal /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/b
add wave -noupdate -radix decimal /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/g
add wave -noupdate -radix hexadecimal /testbench/scopeio_e/amp_b/amp_g(0)/amp_e/p
add wave -noupdate -divider trigger
add wave -noupdate -radix decimal /testbench/scopeio_e/scopeio_trigger_e/input_clk
add wave -noupdate /testbench/scopeio_e/scopeio_trigger_e/input_dv
add wave -noupdate -radix decimal /testbench/scopeio_e/scopeio_trigger_e/input_data
add wave -noupdate /testbench/scopeio_e/scopeio_trigger_e/trigger_level
add wave -noupdate /testbench/scopeio_e/scopeio_trigger_e/shot_p/ge
add wave -noupdate /testbench/scopeio_e/scopeio_trigger_e/shot_p/lt
add wave -noupdate /testbench/scopeio_e/scopeio_trigger_e/shot_p/edge
add wave -noupdate /testbench/scopeio_e/scopeio_trigger_e/output_dv
add wave -noupdate -radix decimal /testbench/scopeio_e/scopeio_trigger_e/output_data
add wave -noupdate /testbench/scopeio_e/scopeio_trigger_e/trigger_shot
add wave -noupdate -divider downsampler
add wave -noupdate /testbench/scopeio_e/downsampler_e/input_dv
add wave -noupdate -radix decimal /testbench/scopeio_e/downsampler_e/input_data
add wave -noupdate /testbench/scopeio_e/downsampler_e/output_shot
add wave -noupdate /testbench/scopeio_e/downsampler_e/output_dv
add wave -noupdate -radix decimal /testbench/scopeio_e/downsampler_e/output_data
add wave -noupdate -divider {New Divider}
add wave -noupdate -radix decimal -childformat {{/testbench/scopeio_e/xxx/scopeio_capture_e/cntr(0) -radix decimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/cntr(1) -radix decimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/cntr(2) -radix decimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/cntr(3) -radix decimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/cntr(4) -radix decimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/cntr(5) -radix decimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/cntr(6) -radix decimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/cntr(7) -radix decimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/cntr(8) -radix decimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/cntr(9) -radix decimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/cntr(10) -radix decimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/cntr(11) -radix decimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/cntr(12) -radix decimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/cntr(13) -radix decimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/cntr(14) -radix decimal}} -subitemconfig {/testbench/scopeio_e/xxx/scopeio_capture_e/cntr(0) {-height 29 -radix decimal} /testbench/scopeio_e/xxx/scopeio_capture_e/cntr(1) {-height 29 -radix decimal} /testbench/scopeio_e/xxx/scopeio_capture_e/cntr(2) {-height 29 -radix decimal} /testbench/scopeio_e/xxx/scopeio_capture_e/cntr(3) {-height 29 -radix decimal} /testbench/scopeio_e/xxx/scopeio_capture_e/cntr(4) {-height 29 -radix decimal} /testbench/scopeio_e/xxx/scopeio_capture_e/cntr(5) {-height 29 -radix decimal} /testbench/scopeio_e/xxx/scopeio_capture_e/cntr(6) {-height 29 -radix decimal} /testbench/scopeio_e/xxx/scopeio_capture_e/cntr(7) {-height 29 -radix decimal} /testbench/scopeio_e/xxx/scopeio_capture_e/cntr(8) {-height 29 -radix decimal} /testbench/scopeio_e/xxx/scopeio_capture_e/cntr(9) {-height 29 -radix decimal} /testbench/scopeio_e/xxx/scopeio_capture_e/cntr(10) {-height 29 -radix decimal} /testbench/scopeio_e/xxx/scopeio_capture_e/cntr(11) {-height 29 -radix decimal} /testbench/scopeio_e/xxx/scopeio_capture_e/cntr(12) {-height 29 -radix decimal} /testbench/scopeio_e/xxx/scopeio_capture_e/cntr(13) {-height 29 -radix decimal} /testbench/scopeio_e/xxx/scopeio_capture_e/cntr(14) {-height 29 -radix decimal}} /testbench/scopeio_e/xxx/scopeio_capture_e/cntr
add wave -noupdate -radix decimal /testbench/scopeio_e/xxx/scopeio_capture_e/input_data
add wave -noupdate -radix hexadecimal -childformat {{/testbench/scopeio_e/xxx/scopeio_capture_e/wr_addr(0) -radix hexadecimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/wr_addr(1) -radix hexadecimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/wr_addr(2) -radix hexadecimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/wr_addr(3) -radix hexadecimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/wr_addr(4) -radix hexadecimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/wr_addr(5) -radix hexadecimal} {/testbench/scopeio_e/xxx/scopeio_capture_e/wr_addr(6) -radix hexadecimal}} -subitemconfig {/testbench/scopeio_e/xxx/scopeio_capture_e/wr_addr(0) {-height 29 -radix hexadecimal} /testbench/scopeio_e/xxx/scopeio_capture_e/wr_addr(1) {-height 29 -radix hexadecimal} /testbench/scopeio_e/xxx/scopeio_capture_e/wr_addr(2) {-height 29 -radix hexadecimal} /testbench/scopeio_e/xxx/scopeio_capture_e/wr_addr(3) {-height 29 -radix hexadecimal} /testbench/scopeio_e/xxx/scopeio_capture_e/wr_addr(4) {-height 29 -radix hexadecimal} /testbench/scopeio_e/xxx/scopeio_capture_e/wr_addr(5) {-height 29 -radix hexadecimal} /testbench/scopeio_e/xxx/scopeio_capture_e/wr_addr(6) {-height 29 -radix hexadecimal}} /testbench/scopeio_e/xxx/scopeio_capture_e/wr_addr
add wave -noupdate /testbench/scopeio_e/xxx/scopeio_capture_e/wr_ena
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1208639 ns} 0} {{Cursor 3} {1346077 ns} 0} {{Cursor 3} {1191715 ns} 0}
quietly wave cursor active 3
configure wave -namecolwidth 255
configure wave -valuecolwidth 218
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
WaveRestoreZoom {1190553 ns} {1192809 ns}
