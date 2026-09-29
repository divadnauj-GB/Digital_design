module RegFile(
    input clk,
    input rstn,
    input we, // write enable
    input [4:0] rs1, // source register 1
    input [4:0] rs2, // source register 2
    input [4:0] rd,  // destination register
    input [31:0] wd, // write data
    output reg [31:0] rd1, // read data 1
    output reg [31:0] rd2  // read data 2
);

    reg [31:0] registers [0:31]; // 32 registers of 32 bits

    integer i;
    
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 32'b0; // Reset all registers to zero
            end
        end else if (we && rd != 5'b00000) begin
            registers[rd] <= wd; // Write data to the destination register
        end
    end

    always @(*) begin
        rd1 = (rs1 == 5'b00000) ? 32'b0 : registers[rs1]; // Read data from source register 1
        rd2 = (rs2 == 5'b00000) ? 32'b0 : registers[rs2]; // Read data from source register 2
    end
endmodule