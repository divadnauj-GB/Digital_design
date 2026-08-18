module de1_basic_project(CLOCK_50,LEDR, LEDG, SW, KEY);
    input CLOCK_50;
    input [3:0] KEY;
    input [9:0] SW;
    output [9:0] LEDR;
    output [7:0] LEDG;


    assign LEDR = SW;



endmodule