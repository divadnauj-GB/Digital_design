`timescale 1ns/1ps
`define assert(signal, value) \
    if ((signal) !== (value)) begin \
        $display("ASSERTION FAILED in %m: %s != %b, %b", `"signal`", value, signal); \
        $finish; \
    end

module tb_ELDI_SoC;
    reg clk;
    reg rstn;
    reg [7:0] gpio_in;
    wire [15:0] gpio_out;


    always begin
        clk = ~clk;
        #1;
    end


    ELDI_SoC uut (
        .clk(clk),
        .rstn(rstn),
        .gpio_in(gpio_in),
        .gpio_out(gpio_out)
    );

    initial begin
        $dumpfile("sim.vcd");
        $dumpvars;
    end

    integer i;
    initial begin
        gpio_in = 8'h00;
        clk=0;
        rstn=0;
        #20;
        rstn=1;
        #1;
        for(i=0;i<511;i=i+1) begin
            repeat (10) begin @(negedge clk); end
            gpio_in = i[7:0];
            repeat (6) begin @(negedge clk); end
            `assert(gpio_out,{8'd0,gpio_in});
        end
        $display("All verification tests passed!");
        $finish;
    end

endmodule