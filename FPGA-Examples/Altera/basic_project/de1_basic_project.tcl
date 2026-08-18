project_new de1_basic_project -overwrite
set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name TOP_LEVEL_ENTITY de1_basic_project
set_global_assignment -name VERILOG_FILE de1_basic_project.v
source scripts/de1-pinmap.tcl
source scripts/options.tcl
set_global_assignment -name SDC_FILE scripts/de1.sdc