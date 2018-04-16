# This file is a general .xdc for the Basys3 rev B board
# To use it in a project:
# - uncomment the lines corresponding to used pins
# - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

# Switches
set_property PACKAGE_PIN V17 [get_ports {sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property PACKAGE_PIN V16 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property PACKAGE_PIN W16 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property PACKAGE_PIN W17 [get_ports {sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
set_property PACKAGE_PIN W15 [get_ports {sw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
set_property PACKAGE_PIN V15 [get_ports {sw[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
set_property PACKAGE_PIN W14 [get_ports {sw[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
set_property PACKAGE_PIN W13 [get_ports {sw[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]
set_property PACKAGE_PIN V2 [get_ports {sw[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
set_property PACKAGE_PIN T3 [get_ports {sw[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]
set_property PACKAGE_PIN T2 [get_ports {sw[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
set_property PACKAGE_PIN R3 [get_ports {sw[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]
set_property PACKAGE_PIN W2 [get_ports {sw[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
set_property PACKAGE_PIN U1 [get_ports {sw[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
set_property PACKAGE_PIN T1 [get_ports {sw[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}]
set_property PACKAGE_PIN R2 [get_ports {sw[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[15]}]


# LEDs
set_property PACKAGE_PIN U16 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property PACKAGE_PIN E19 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property PACKAGE_PIN U19 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property PACKAGE_PIN V19 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property PACKAGE_PIN W18 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
set_property PACKAGE_PIN U15 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
set_property PACKAGE_PIN U14 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
set_property PACKAGE_PIN V14 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
set_property PACKAGE_PIN V13 [get_ports {led[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]
set_property PACKAGE_PIN V3 [get_ports {led[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]
set_property PACKAGE_PIN W3 [get_ports {led[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[10]}]
set_property PACKAGE_PIN U3 [get_ports {led[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[11]}]
set_property PACKAGE_PIN P3 [get_ports {led[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[12]}]
set_property PACKAGE_PIN N3 [get_ports {led[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[13]}]
set_property PACKAGE_PIN P1 [get_ports {led[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[14]}]
set_property PACKAGE_PIN L1 [get_ports {led[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[15]}]


#7 catment display
set_property PACKAGE_PIN W7 [get_ports {cat[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cat[0]}]
set_property PACKAGE_PIN W6 [get_ports {cat[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cat[1]}]
set_property PACKAGE_PIN U8 [get_ports {cat[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cat[2]}]
set_property PACKAGE_PIN V8 [get_ports {cat[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cat[3]}]
set_property PACKAGE_PIN U5 [get_ports {cat[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cat[4]}]
set_property PACKAGE_PIN V5 [get_ports {cat[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cat[5]}]
set_property PACKAGE_PIN U7 [get_ports {cat[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cat[6]}]



set_property PACKAGE_PIN U2 [get_ports {an[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]


#Buttons
set_property PACKAGE_PIN U18 [get_ports {btn[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[0]}]
set_property PACKAGE_PIN T18 [get_ports {btn[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[1]}]
set_property PACKAGE_PIN W19 [get_ports {btn[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[2]}]
set_property PACKAGE_PIN T17 [get_ports {btn[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[3]}]
set_property PACKAGE_PIN U17 [get_ports {btn[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[4]}]



create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 216 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {insfet/pc[0]} {insfet/pc[1]} {insfet/pc[2]} {insfet/pc[3]} {insfet/pc[4]} {insfet/pc[5]} {insfet/pc[6]} {insfet/pc[7]} {insfet/pc[8]} {insfet/pc[9]} {insfet/pc[10]} {insfet/pc[11]} {insfet/pc[12]} {insfet/pc[13]} {insfet/pc[14]} {insfet/pc[15]} {display[0]} {display[1]} {display[2]} {display[3]} {display[4]} {display[5]} {display[6]} {display[7]} {display[8]} {display[9]} {display[10]} {display[11]} {display[12]} {display[13]} {display[14]} {display[15]} mpgDebouncedButton insfet/jumpControl insfet/pCSrcControl {ic/reg/reg_file[0]_0[0]} {ic/reg/reg_file[0]_0[1]} {ic/reg/reg_file[0]_0[2]} {ic/reg/reg_file[0]_0[3]} {ic/reg/reg_file[0]_0[4]} {ic/reg/reg_file[0]_0[5]} {ic/reg/reg_file[0]_0[6]} {ic/reg/reg_file[0]_0[7]} {ic/reg/reg_file[0]_0[8]} {ic/reg/reg_file[0]_0[9]} {ic/reg/reg_file[0]_0[10]} {ic/reg/reg_file[0]_0[11]} {ic/reg/reg_file[0]_0[12]} {ic/reg/reg_file[0]_0[13]} {ic/reg/reg_file[0]_0[14]} {ic/reg/reg_file[0]_0[15]} {ic/reg/reg_file[1]_1[0]} {ic/reg/reg_file[1]_1[1]} {ic/reg/reg_file[1]_1[2]} {ic/reg/reg_file[1]_1[3]} {ic/reg/reg_file[1]_1[4]} {ic/reg/reg_file[1]_1[5]} {ic/reg/reg_file[1]_1[6]} {ic/reg/reg_file[1]_1[7]} {ic/reg/reg_file[1]_1[8]} {ic/reg/reg_file[1]_1[9]} {ic/reg/reg_file[1]_1[10]} {ic/reg/reg_file[1]_1[11]} {ic/reg/reg_file[1]_1[12]} {ic/reg/reg_file[1]_1[13]} {ic/reg/reg_file[1]_1[14]} {ic/reg/reg_file[1]_1[15]} {ic/reg/reg_file[2]_2[0]} {ic/reg/reg_file[2]_2[1]} {ic/reg/reg_file[2]_2[2]} {ic/reg/reg_file[2]_2[3]} {ic/reg/reg_file[2]_2[4]} {ic/reg/reg_file[2]_2[5]} {ic/reg/reg_file[2]_2[6]} {ic/reg/reg_file[2]_2[7]} {ic/reg/reg_file[2]_2[8]} {ic/reg/reg_file[2]_2[9]} {ic/reg/reg_file[2]_2[10]} {ic/reg/reg_file[2]_2[11]} {ic/reg/reg_file[2]_2[12]} {ic/reg/reg_file[2]_2[13]} {ic/reg/reg_file[2]_2[14]} {ic/reg/reg_file[2]_2[15]} {ic/reg/reg_file[3]_3[0]} {ic/reg/reg_file[3]_3[1]} {ic/reg/reg_file[3]_3[2]} {ic/reg/reg_file[3]_3[3]} {ic/reg/reg_file[3]_3[4]} {ic/reg/reg_file[3]_3[5]} {ic/reg/reg_file[3]_3[6]} {ic/reg/reg_file[3]_3[7]} {ic/reg/reg_file[3]_3[8]} {ic/reg/reg_file[3]_3[9]} {ic/reg/reg_file[3]_3[10]} {ic/reg/reg_file[3]_3[11]} {ic/reg/reg_file[3]_3[12]} {ic/reg/reg_file[3]_3[13]} {ic/reg/reg_file[3]_3[14]} {ic/reg/reg_file[3]_3[15]} {ic/reg/reg_file[4]_4[0]} {ic/reg/reg_file[4]_4[1]} {ic/reg/reg_file[4]_4[2]} {ic/reg/reg_file[4]_4[3]} {ic/reg/reg_file[4]_4[4]} {ic/reg/reg_file[4]_4[5]} {ic/reg/reg_file[4]_4[6]} {ic/reg/reg_file[4]_4[7]} {ic/reg/reg_file[4]_4[8]} {ic/reg/reg_file[4]_4[9]} {ic/reg/reg_file[4]_4[10]} {ic/reg/reg_file[4]_4[11]} {ic/reg/reg_file[4]_4[12]} {ic/reg/reg_file[4]_4[13]} {ic/reg/reg_file[4]_4[14]} {ic/reg/reg_file[4]_4[15]} {ic/reg/reg_file[5]_5[0]} {ic/reg/reg_file[5]_5[1]} {ic/reg/reg_file[5]_5[2]} {ic/reg/reg_file[5]_5[3]} {ic/reg/reg_file[5]_5[4]} {ic/reg/reg_file[5]_5[5]} {ic/reg/reg_file[5]_5[6]} {ic/reg/reg_file[5]_5[7]} {ic/reg/reg_file[5]_5[8]} {ic/reg/reg_file[5]_5[9]} {ic/reg/reg_file[5]_5[10]} {ic/reg/reg_file[5]_5[11]} {ic/reg/reg_file[5]_5[12]} {ic/reg/reg_file[5]_5[13]} {ic/reg/reg_file[5]_5[14]} {ic/reg/reg_file[5]_5[15]} {ic/reg/reg_file[6]_6[0]} {ic/reg/reg_file[6]_6[1]} {ic/reg/reg_file[6]_6[2]} {ic/reg/reg_file[6]_6[3]} {ic/reg/reg_file[6]_6[4]} {ic/reg/reg_file[6]_6[5]} {ic/reg/reg_file[6]_6[6]} {ic/reg/reg_file[6]_6[7]} {ic/reg/reg_file[6]_6[8]} {ic/reg/reg_file[6]_6[9]} {ic/reg/reg_file[6]_6[10]} {ic/reg/reg_file[6]_6[11]} {ic/reg/reg_file[6]_6[12]} {ic/reg/reg_file[6]_6[13]} {ic/reg/reg_file[6]_6[14]} {ic/reg/reg_file[6]_6[15]} {ic/reg/reg_file[7]_7[0]} {ic/reg/reg_file[7]_7[1]} {ic/reg/reg_file[7]_7[2]} {ic/reg/reg_file[7]_7[3]} {ic/reg/reg_file[7]_7[4]} {ic/reg/reg_file[7]_7[5]} {ic/reg/reg_file[7]_7[6]} {ic/reg/reg_file[7]_7[7]} {ic/reg/reg_file[7]_7[8]} {ic/reg/reg_file[7]_7[9]} {ic/reg/reg_file[7]_7[10]} {ic/reg/reg_file[7]_7[11]} {ic/reg/reg_file[7]_7[12]} {ic/reg/reg_file[7]_7[13]} {ic/reg/reg_file[7]_7[14]} {ic/reg/reg_file[7]_7[15]} {aluOp[0]} {aluOp[1]} {funct[0]} {funct[1]} {funct[2]} {rd1[0]} {rd1[1]} {rd1[2]} {rd1[3]} {rd1[4]} {rd1[5]} {rd1[6]} {rd1[7]} {rd1[8]} {rd1[9]} {rd1[10]} {rd1[11]} {rd1[12]} {rd1[13]} {rd1[14]} {rd1[15]} {rd2[0]} {rd2[1]} {rd2[2]} {rd2[3]} {rd2[4]} {rd2[5]} {rd2[6]} {rd2[7]} {rd2[8]} {rd2[9]} {rd2[10]} {rd2[11]} {rd2[12]} {rd2[13]} {rd2[14]} {rd2[15]} {alu/aluIn2[0]} {alu/aluIn2[1]} {alu/aluIn2[2]} {alu/aluIn2[3]} {alu/aluIn2[4]} {alu/aluIn2[5]} {alu/aluIn2[6]} {alu/aluIn2[7]} {alu/aluIn2[8]} {alu/aluIn2[9]} {alu/aluIn2[10]} {alu/aluIn2[11]} {alu/aluIn2[12]} {alu/aluIn2[13]} {alu/aluIn2[14]} {alu/aluIn2[15]}]]



set_property MARK_DEBUG true [get_nets insfet/jumpControl]



set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_IBUF_BUFG]
