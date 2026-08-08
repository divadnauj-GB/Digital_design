# GHDL simulation using CLI 

This example ilustartes a basic example of using CLI (Command Line Interface) for runnning VHDL simulation in GHDL. 

The following project tree contains the basic files required during the simualtion

```bash
./
  trafic_lights.vhd # this is the main design file
  trafic_lights_tb.vhd # this is the testbench file 
```

The following commands are used to analyze, build and execute a GHDL simulation. 

```bash
mkdir -p build # this creates a directory where to build the simulation executables
ghdl -i --std=08 --workdir=build --ieee=standard --work=work trafic_lights.vhd # add design file to the project
ghdl -i --std=08 --workdir=build --ieee=standard --work=work trafic_lights_tb.vhd # add design file to project
ghdl -m --work=work --workdir=build --std=08 trafic_lights_tb # elaborate the project
ghdl -r --work=work --workdir=build --std=08 trafic_lights_tb --max-stack-alloc=0 --vcd=simulation.vcd --ieee-asserts=disable --assert-level=error --stop-time=10ms # run the simulation generating a simulation.vcd file

gtkwave simulation.vcd # opend the waveform analizer to check the simulation behaviour (optional)
```

## Basic intro to GHDL simulation
The main GHDL simulation commands are: `ghdl -a` to analyze VHDL files, `ghdl -e` to elaborate a specific design unit into an executable, and `ghdl -r` to run the simulation. Other useful commands include `ghdl --clean` to remove generated files, `ghdl --help` for usage information, and `--stop-time=TIME` or `--vcd=FILENAME` for simulation control and output. 

### Key Commands 

1. Analyze (-a):
Compiles your VHDL source files into object files, creating or updating the work library's contents.
Example: `ghdl -a my_design.vhdl`

2. Elaborate (-e):
Builds the design hierarchy from the analyzed units and creates an executable file.
Example: `ghdl -e top_entity_name`

3. Run (-r):
Executes the compiled and elaborated design.
Example: `ghdl -r top_entity_name`
Alternatively, you can run the generated executable directly on Linux/macOS: `./top_entity_name`

### Common Options 
`--work=NAME`: Specifies the name of the work library.

`--std=STANDARD`: Sets the VHDL standard (e.g., 87, 93, 00, 02).

`--vcd=FILENAME`: Generates a Value Change Dump (VCD) file for waveform viewing.

`--stop-time=TIME`: Stops the simulation after a specified time.

`--help`: Displays a summary of GHDL commands and options.

`--clean`: Removes generated files from the design library.

`--version`: Shows the GHDL version.

Note: You can find mor einformation regarding the usage of GHDL in http://ghdl.free.fr/site/pmwiki.php?n=Main.UserGuide.
