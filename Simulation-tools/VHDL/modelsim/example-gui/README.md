# Modelsim simulation using GUI - For simple things

This example ilustartes a basic example of using GUI interface for runnning HDL simulation in Modelsim. 

The following project tree contains the basic files required during the simualtion

```bash
./
  trafic_lights.vhd # this is the main design file
  trafic_lights_tb.vhd # this is the testbench file 
```
The simulations requires the following sequence of steps, explained during the lesson:

1. create/open a project
2. Create/add files to the project (HDL)
3. Compile All files (HDL)
4. Start simulation selecting the propper optimization options
5. Add the selected signals to the waveforms pane
6. Run the simulation


NOTE: This simualtion procedure is used only in small examples, normally in real life the simulation resorts to scripting method mainly usin TCL languages. 



