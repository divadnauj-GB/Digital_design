# Modelsim simulation with TCL scripts

This example ilustartes a basic example of using TCL scripting for launch automatically simulation in modelsim. 

The following project tree contains the basic files required during the simualtion

```bash
./
  compile.tcl. #main compilation script for running on modelsim
  waveforms.do #Files describing the format and the waveforms selected during the simulation
  trafic_lights.vhd # this is the main design file
  trafic_lights_tb.vhd # this is the testbench file 
```
The simulations can be executed running the following command:

```bash
vsim -c -do compile.tcl # this run the simulation by command line without graphical interface.
```

as a result, the simulation will generate a message printed by the `testbench`indicating that the simulation succesfully finalized, or failed, it depends of the expected design outputs. here some example.

```bash
        # ...
    ->  # ** Note: Simulation_finished!
        #    Time: 170 ns  Iteration: 0  Instance: /trafic_lights_tb
        # End time: 21:15:00 on Aug 26,2025, Elapsed time: 0:00:03
        # Errors: 0, Warnings: 2
```

The simulation will generate a file named `vsim.wlf`containing the simulation waveforms if required for visualization. You can open the `vsim.wlf` file using the graphical interface of modelsim following: 

```bash 
   vsim -view vsim.wlf -do waveforms.do
```