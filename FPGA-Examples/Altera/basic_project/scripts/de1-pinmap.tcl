set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS_INPUT_TRI_STATED"
set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"
set_global_assignment -name RESERVE_ASDO_AFTER_CONFIGURATION "USE AS REGULAR IO"
set_global_assignment -name RESERVE_ALL_UNUSED_PINS_NO_OUTPUT_GND "AS INPUT TRI-STATED"

# Clock / Reset
set_location_assignment PIN_R22 -to KEY[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY[0]
set_location_assignment PIN_L1 -to CLOCK_50
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK_50

# Switches
set_location_assignment PIN_L22 -to SW[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[0]
set_location_assignment PIN_L21 -to SW[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[1]
set_location_assignment PIN_M22 -to SW[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[2]
set_location_assignment PIN_V12 -to SW[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[3]
set_location_assignment PIN_W12 -to SW[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[4]
set_location_assignment PIN_U12 -to SW[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[5]
set_location_assignment PIN_U11 -to SW[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[6]
set_location_assignment PIN_M2 -to SW[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[7]   
set_location_assignment PIN_M1 -to SW[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[8] 
set_location_assignment PIN_L2 -to SW[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[9] 

# RED LED
set_location_assignment PIN_R20 -to LEDR[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[0]
set_location_assignment PIN_R19 -to LEDR[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[1]
set_location_assignment PIN_U19 -to LEDR[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[2]
set_location_assignment PIN_Y19 -to LEDR[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[3]
set_location_assignment PIN_T18 -to LEDR[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[4]
set_location_assignment PIN_V19 -to LEDR[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[5]
set_location_assignment PIN_Y18 -to LEDR[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[6]
set_location_assignment PIN_U18 -to LEDR[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[7]
set_location_assignment PIN_R18 -to LEDR[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[8]
set_location_assignment PIN_R17 -to LEDR[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[9]

# GREEN LED
set_location_assignment PIN_U22 -to LEDG[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[0]
set_location_assignment PIN_U21 -to LEDG[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[1]
set_location_assignment PIN_V22 -to LEDG[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[2]
set_location_assignment PIN_V21 -to LEDG[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[3]
set_location_assignment PIN_W22 -to LEDG[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[4]
set_location_assignment PIN_W21 -to LEDG[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[5]
set_location_assignment PIN_Y22 -to LEDG[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[6]
set_location_assignment PIN_Y21 -to LEDG[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDG[7]

