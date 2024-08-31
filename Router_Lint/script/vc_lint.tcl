#Liberty files are needed for logical and physical netlist designs
set search_path "../"
set link_library " "

set_app_var enable_lint true

configure_lint_setup -goal lint_rtl

analyze -verbose -format verilog "../../Router1X3/rtl/fifo_router_16x9_rtl.v"
analyze -verbose -format verilog "../../Router1X3/rtl/register_router.v "
analyze -verbose -format verilog "../../Router1X3/rtl/synchronizer_router.v"
analyze -verbose -format verilog "../../Router1X3/rtl/sm_router_controller.v"
analyze -verbose -format verilog "../../Router1X3/rtl/router_top.v"

waive_lint -tag  STARC05-2.5.1.2  -add clock_waive 
 
elaborate router_top
check_lint

report_lint -verbose -file report_lint_router.txt

