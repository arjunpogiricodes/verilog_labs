remove_design -all
set search_path {../lib}
set target_library {lsi_10k.db}
set link_library "* lsi_10k.db"

analyze -format verilog {../rtl/fifo_router_16x9_rtl.v   ../rtl/register_router.v  ../rtl/synchronizer_router.v ../rtl/fsm_router_controller.v  ../rtl/router_top.v}
elaborate router_top

link 

check_design

current_design  router_top
compile_ultra -no_autoungroup

write_file -f verilog -hier -output router_top_netlist.v


 
