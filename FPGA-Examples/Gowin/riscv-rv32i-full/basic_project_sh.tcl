# Build Verilog tutorial from bash shell (gw_sh)
# use like: gw_sh scripted_build_sv_sh.tcl

# Build project from shell (different from GUI due to strange GUI behavior)
set RunFromShell 1
source basic_project.tcl

set PWD [pwd]
set output [exec programmer_cli --device GW2AR-18C --operation 2 --fsFile "${PWD}/impl/pnr/riscv.fs"]
