# Verilator simulation with CLI commands

The following commands initiate the simulation of the design in this directory. 

```bash
verilator --binary --timing --trace -Wno-moddup -Wno-fatal trafic_lights_tb.v trafic_lights.v -top-module trafic_lights_tb #compile the design

./obj_dir/Vtrafic_lights_tb #run simulation

gtkwave trafic_lights_tb.vcd #open waveforms
```

## Intro to Verilator
Verilator is a tool that converts Verilog/SystemVerilog code into C++/SystemC code, which can then be compiled and simulated for high-performance verification. The primary command for using Verilator is verilator itself, along with various options and arguments to control its behavior.

### Key verilator commands and options:
`verilator [options] <input_files.v>`:
This is the basic usage, where `input_files.v` are your Verilog/SystemVerilog source files.

### Output Generation Options:
`--cc`: Generates C++ output files.

`--sc`: Generates SystemC output files.

`--binary`: Generates a self-contained executable directly (compiles the generated C++).

`--lint-only`: Performs linting (syntax and style checking) without generating any output code.

`--xml-only`: Generates an XML representation of the design.

### Tracing and Debugging:
`--trace`: Enables waveform generation (VCD format by default).

`--trace-fst`: Enables FST waveform generation (a more efficient format).

`--trace-depth <levels>`: Specifies the hierarchy depth for tracing.

`--debug`: Enables various internal debugging features and messages.

### Input and Include Paths:
`-y <dir>`: Adds a directory to the search path for include files and libraries.

`+incdir+<dir>`: Another way to specify include directories.

`-I<dir>`: Similar to +incdir, for GCC compatibility.

### Module and Top-Level Control:
`--top-module <topname>`: Specifies the top-level module if it's not the same as the input filename.

`--prefix <topname>`: Sets the prefix for generated filenames and class names.

### Language Features and Compliance:
`-sv`: Enables SystemVerilog parsing.

`--timescale <timescale>`: Sets the default timescale for modules without a timescale directive.

### Warnings and Error Handling:
`-Wall`: Enables all style warnings.

`-Wno-<message>`: Disables a specific warning.

`-Werror-<message>`: Converts a specific warning into an error.
Performance and Optimization:

`--threads <threads>`: Enables multithreaded compilation and simulation.

`--savable`: Enables saving and restoring the simulation state.

### Example Usage:

```bash
verilator --cc --trace --top-module my_design my_design.sv
```
This command would generate C++ code for my_design.sv, enable VCD tracing, and specify my_design as the top-level module. After this, you would typically compile the generated C++ code and link it with a C++ testbench to create an executable for simulation.

Note: More information regarding veriltaror and its command line arguments please refer to https://veripool.org/guide/latest/exe_verilator.html 
