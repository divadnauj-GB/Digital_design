# Simulation tools (Opensource)

HDL simulation is crucial for verifying the functional accuracy, timing, and behavior of digital designs before hardware implementation, which reduces errors, saves costs, and allows for rapid design modifications. Key HDL simulation tools include industry standards like Verilog and VHDL, which are supported by proprietary software from vendors like Aldec (e.g., Active-HDL) and open-source alternatives such as Icarus Verilog, Verilator, and GHDL.

## Open-Source Tools:
**Icarus Verilog**: A widely used, open-source Verilog simulator that allows for simulation and netlist generation. 

**Verilator**: A high-performance Verilog simulator that compiles Verilog into C++ or SystemC for faster execution and system-level simulation.

**GHDL**: A simulator and synthesis tool for VHDL. GHDL can be build for various backends: gcc - using the GCC compiler framework.

**Yosys**: An open-source synthesis framework that can be used in conjunction with simulation tools for the complete design flow. This also support the FPGA development on wide spectrum of devices.


## Tools Installation on Ubuntu 22.04 

### Icarus
```bash
sudo apt update
sudo apt install iverilog
iverilog -V
```

### GTKWAVE
```bash
sudo apt update
sudo apt install gtkwave
gtkwave --version
```

### Verilator (Optional)
```bash
sudo apt update
sudo apt install verilator
verilator --version
```

### GHDL (Optional for VHDL only)
```bash
sudo apt update
sudo apt install ghdl
ghdl --version
```

## Examples on how to use the simulation tools

### Verilog
#### icarus verilog
- [Example-cli](./Verilog/icarus/example-cli/)

- [Example-makefile](./Verilog/icarus/example-makefile/)

#### Verilator
- [Example-cli](./Verilog/verilator/example-cli/)

- [Example-makefile](./Verilog/verilator/example-makefile/)

#### Modelsim
- [Example-gui](./Verilog/modelsim/example-gui/)

- [Example-tcl](./Verilog/modelsim/example-tcl/)

### VHDL

#### GHDL
- [Example-cli](./VHDL/GHDL/example-cli/)

- [Example-script](./VHDL/GHDL/example-script/)

#### Modelsim
- [Example-gui](./VHDL/modelsim/example-gui/)

- [Example-tcl](./VHDL/modelsim/example-tcl/)