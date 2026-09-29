module tb_eldi_riscv_core;

reg clk;
reg rstn;

reg [31:0]  imem_rd_idata;
reg [31:0]  dmem_rd_data;
wire [31:0] dmem_wr_data;
wire [31:0] imem_addr;
wire [31:0] dmem_addr;
wire dmem_we;
wire [3:0] dmem_bytesel;

always begin
    clk = ~clk;
    #20;
end


eldi_riscv_core DUT(
    .clk(clk),
    .rstn(rstn),
    .imem_rd_idata(imem_rd_idata),
    .dmem_rd_data(dmem_rd_data),
    .dmem_wr_data(dmem_wr_data),
    .imem_addr(imem_addr),
    .dmem_addr(dmem_addr),
    .dmem_we(dmem_we),
    .dmem_bytesel(dmem_bytesel)
);


initial begin
    $dumpfile("sim.vcd");
    $dumpvars;
    clk = 0;
    rstn = 0;
    #10;
    rstn = 1;
    imem_rd_idata = 32'b0000000000001111_00001_0110111;
    #300
    $finish;
end
endmodule