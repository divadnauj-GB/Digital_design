module ram #(parameter DWIDTH=32, parameter ASIZE=10) (
    input wire clk,
    input wire we,
    input wire [3:0] bytesel,
    input wire [ASIZE-1:0] mem_addr,
    input wire [DWIDTH-1:0] wr_data,
    output reg [DWIDTH-1:0] rd_data
);

 reg [7:0] mem [0:2**ASIZE-1]; // 32 registers of 32 bits
   
    always @(posedge clk ) begin
        if (we) begin
            case (bytesel)
                4'b0001: 
                    mem[{mem_addr[ASIZE-1:2],2'b00}+0] <= wr_data[7:0]; // Write data to the destination register
                4'b0010: 
                    mem[{mem_addr[ASIZE-1:2],2'b00}+1] <= wr_data[15:8]; // Write data to the destination register
                4'b0100: 
                    mem[{mem_addr[ASIZE-1:2],2'b00}+2] <= wr_data[23:16]; // Write data to the destination register
                4'b1000: 
                    mem[{mem_addr[ASIZE-1:2],2'b00}+3] <= wr_data[31:24]; // Write data to the destination register
                4'b0011: begin
                    mem[{mem_addr[ASIZE-1:2],2'b00}+0] <= wr_data[7:0]; // Write data to the destination register
                    mem[{mem_addr[ASIZE-1:2],2'b00}+1] <= wr_data[15:8]; // Write data to the destination register
                end
                4'b1100: begin 
                    mem[{mem_addr[ASIZE-1:2],2'b00}+2] <= wr_data[23:16]; // Write data to the destination register
                    mem[{mem_addr[ASIZE-1:2],2'b00}+3] <= wr_data[31:24]; // Write data to the destination register
                end
                4'b1111: begin 
                    mem[{mem_addr[ASIZE-1:2],2'b00}+0] <= wr_data[7:0]; // Write data to the destination register
                    mem[{mem_addr[ASIZE-1:2],2'b00}+1] <= wr_data[15:8]; // Write data to the destination register
                    mem[{mem_addr[ASIZE-1:2],2'b00}+2] <= wr_data[23:16]; // Write data to the destination register
                    mem[{mem_addr[ASIZE-1:2],2'b00}+3] <= wr_data[31:24]; // Write data to the destination register
                end
                default: begin
                    mem[{mem_addr[ASIZE-1:2],2'b00}+0] <= wr_data[7:0]; // Write data to the destination register
                    mem[{mem_addr[ASIZE-1:2],2'b00}+1] <= wr_data[15:8]; // Write data to the destination register
                    mem[{mem_addr[ASIZE-1:2],2'b00}+2] <= wr_data[23:16]; // Write data to the destination register
                    mem[{mem_addr[ASIZE-1:2],2'b00}+3] <= wr_data[31:24]; // Write data to the destination register
                end
            endcase
            
        end
    end

    always @(*) begin
        rd_data[7:0] = mem[{mem_addr[ASIZE-1:2],2'b00}+0];
        rd_data[15:8] = mem[{mem_addr[ASIZE-1:2],2'b00}+1];
        rd_data[23:16] = mem[{mem_addr[ASIZE-1:2],2'b00}+2];
        rd_data[31:24] = mem[{mem_addr[ASIZE-1:2],2'b00}+3];
    end


endmodule