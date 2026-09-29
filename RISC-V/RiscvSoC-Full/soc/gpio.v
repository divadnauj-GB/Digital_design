module gpio(    
    input wire clk,
    input wire rstn,
    input wire we,
    input wire [3:0] bytesel,
    input wire [31:0] addr,
    input wire [31:0] wdata,
    output wire [31:0] rdata,
    input wire [31:0] gpio_port_in,
    output wire [31:0] gpio_port_out
);


reg [31:0] input_reg;
reg [31:0] output_reg;

always @(posedge clk, negedge rstn) begin
    if(!rstn) begin
        input_reg <= 0;
        output_reg <= 0;
    end else begin
        input_reg <= gpio_port_in;
        if(addr[2]==1'b0 && we==1'b1) begin
            case (bytesel)
                4'b0001: output_reg[7:0] <= wdata[7:0];
                4'b0010: output_reg[15:8] <= wdata[15:8];
                4'b0100: output_reg[23:16] <= wdata[23:16];
                4'b1000: output_reg[31:24] <= wdata[31:24];
                4'b0011: output_reg[15:0] <= wdata[15:0];
                4'b1100: output_reg[31:16] <= wdata[31:16];
                4'b1111: output_reg <= wdata;
                default: output_reg <= wdata;
            endcase
            
        end
    end
end

assign rdata = input_reg;
assign gpio_port_out = output_reg;

endmodule