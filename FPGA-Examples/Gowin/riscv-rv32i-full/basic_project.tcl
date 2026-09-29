# Create a new Gowin project
create_project -name riscv -dir ".." -pn GW2AR-LV18QN88C8/I7 -device_version C -force

set_option -synthesis_tool gowinsynthesis
set_option -verilog_std sysv2017
set_option -print_all_synthesis_warning 1

# Add Verilog or VHDL source files
add_file -type verilog "./src/RiscvSoC/cpu/Alu.v"
add_file -type verilog "./src/RiscvSoC/cpu/AluControl.v"
add_file -type verilog "./src/RiscvSoC/cpu/ByteSelect.v"
add_file -type verilog "./src/RiscvSoC/cpu/ControlUnit.v"
add_file -type verilog "./src/RiscvSoC/cpu/ImmSrc.v"
add_file -type verilog "./src/RiscvSoC/cpu/LoadSignExt.v"
add_file -type verilog "./src/RiscvSoC/cpu/MainInstructionDecoder.v"
add_file -type verilog "./src/RiscvSoC/cpu/PCControl.v"
add_file -type verilog "./src/RiscvSoC/cpu/RegFile.v"
add_file -type verilog "./src/RiscvSoC/cpu/RiscvCore.v"

add_file -type verilog "./src/RiscvSoC/soc/ELDI_SoC.v"
add_file -type verilog "./src/RiscvSoC/soc/gpio.v"
add_file -type verilog "./src/RiscvSoC/soc/ram.v"
add_file -type verilog "./src/RiscvSoC/soc/rom.v"


# Add physical constraint file (.cst)
add_file -type cst "constraint/pins.cst"

set_option -top_module ELDI_SoC
set_option -output_base_name riscv

run syn
run pnr

puts "FPGA Bitstream Build Completed successfully!"
