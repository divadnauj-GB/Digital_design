# Basic Project


This is a basic project for using the GOWIN FPGA devices. The project uses tcl scripts that allow to automatize the project generation and compilation flows. The tcl script also includes programming the FPGA after the place and routing steps.

# How to use the project ?


1. Open a terminal and change the directory to the current project. 
3. run the command `gw_sh basic_project_sh.tcl`
4. if yor FPGA is connected, it will be automatically prgrammed with the project bitstream; otherwise you can just open the project using the GUI. 