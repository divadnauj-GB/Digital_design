module tb_eldi_soc_top;

reg clk;
reg rstn;
reg [31:0] gpio_in;
wire [31:0] gpio_out;

always begin
    clk = ~clk;
    #5;
end


ELDI_SoC DUT(
    .clk(clk),
    .rstn(rstn),
    .gpio_in(gpio_in),
    .gpio_out(gpio_out)
);

initial begin
    $dumpfile("sim.vcd");
    $dumpvars;
    gpio_in = 0;
    clk = 0;
    rstn = 0;
    #10;
    rstn = 1;

    #50000000;
    $finish;
end

endmodule