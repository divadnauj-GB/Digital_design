# Basic Project 

This example shows how to create and compile asimple project using quartus II using TCL scripts and CLI, this is very usefule when using servers or linux based frameworks.

The main TCl script that creates the project is called `de1_basic_project.tcl`and contains the basic commands for creating the project. By default Quartus uses a set of default configurations allocated in the  `assignment_defaults.qdf` file, you can check it in you quartus installation directory (e.g., `/home/ubuntu/altera/13.0sp1/quartus/linux/assignment_defaults.qdf`). For additional configuration entries using TCL scripting you can check the quartus documentation either consulting online the [quartus settings file reference](https://cdrdv2.intel.com/v1/dl/getContent/666591?fileName=) or the built in help menu in the quartus software.

### Project, Build, and Compile

```bash
export PATH:$PATH:/path/to/quartus/bin #export the quartus bin directory to the path
quartus_sh -t de1_basic_project.tcl #create the project using tcl scripts
quartus_map de1_basic_project # synthesize and map to LUTS
quartus_fit de1_basic_project # Place and routing
quartus_asm de1_basic_project # assemble bitstring generation
quartus_sta de1_basic_project # static timing analysis

```

Alaternatively you can use the makefile to automate the process
```bash
export PATH:$PATH:/path/to/quartus/bin #export the quartus bin directory to the path
make all
```

### FPGA device programming using USB blaster on Linux devices

- check that the device is connected properly
```bash
./jtagconfig
1) USB-Blaster [1-2]
031050DD 10M50DA(.|ES)/10M50DC
```

- Program the device using the `*.sof` file
```bash
quartus_pgm  -m jtag -o "p;output_files/de1_basic_project.sof" 
```
