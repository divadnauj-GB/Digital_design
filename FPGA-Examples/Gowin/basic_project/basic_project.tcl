# Create a new Gowin project
create_project -name basic_project -dir ".." -pn GW1NR-LV9QN88PC6/I5 -device_version NA -force

set_option -synthesis_tool gowinsynthesis
set_option -verilog_std sysv2017
set_option -print_all_synthesis_warning 1

# Add Verilog or VHDL source files
add_file -type verilog "./src/mux2to1.v"

# Add physical constraint file (.cst)
add_file -type cst "constraint/pins.cst"


set_option -top_module mux2to1
set_option -output_base_name basic_project

run syn
run pnr

puts "FPGA Bitstream Build Completed successfully!"
