remove_design -all
set search_path {../lib}
set target_library {lsi_10k.db}
set link_library "* lsi_10k.db"

analyze -format verilog {../rtl/full_adder.v ../rtl/half_adder.v} 

elaborate full_adder

link 

check_design

current_design  full_adder

compile_ultra

write_file -f verilog -hier -output full_adder_netlist.v


 

