create_clock -period 20.000 -name clk_50 -waveform {0.000 10.000} -add [get_ports clk_50]

set_property PACKAGE_PIN Y19 [get_ports clk_50]
set_property IOSTANDARD LVCMOS18 [get_ports clk_50]
set_property PACKAGE_PIN AB20 [get_ports top_out]
set_property IOSTANDARD LVCMOS18 [get_ports top_out]
 
startgroup
create_pblock pblock_a1
resize_pblock pblock_a1 -add{SLICE_X96Y29:SLICE_X113Y50 DSP48_X4Y12:DSP48_X4Y19 RAMB18_X5Y12:RAMB18_X5Y19 RAMB36_X5Y6:RAMB36_X5Y9}
add_cells_to_pblock pblock_a1 [get_cells [list a1]] -clear_locs
endgroup