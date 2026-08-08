# Set the top entity
set TOP_LEVEL_NAME trafic_lights_tb
# set the work library
exec vlib work
# compile the list of files in the design in order of hierarchi bottom-up
vlog -64 -work work ./trafic_lights.v
vlog -64 -work work ./trafic_lights_tb.v
# load the simulation
vsim -64 -voptargs=+acc work.${TOP_LEVEL_NAME}
# load the waveforms
do waveforms.do
# run the simulation
run 5000 ns
# quit the simulation
quit
