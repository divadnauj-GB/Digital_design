module rom #(parameter DWIDTH=32, parameter ASIZE=10) (
    input wire [ASIZE-1:0] mem_addr,
    output reg [DWIDTH-1:0] rd_data
);

reg [7:0] mem [0:2**ASIZE-1];

initial begin
    $readmemh("program.hex", mem);
end

always @(*) begin
    rd_data[7:0] = mem[{mem_addr[ASIZE-1:2],2'b00}+0];
    rd_data[15:8] = mem[{mem_addr[ASIZE-1:2],2'b00}+1];
    rd_data[23:16] = mem[{mem_addr[ASIZE-1:2],2'b00}+2];
    rd_data[31:24] = mem[{mem_addr[ASIZE-1:2],2'b00}+3];
end

endmodule