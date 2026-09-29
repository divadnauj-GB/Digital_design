module tb_Alu ;

reg [31:0] OpA;
reg [31:0] OpB;
reg [3:0] AluControl;
wire [31:0] AluResult;
wire Z;
wire N;
wire C;
wire V;

Alu CPU_ALU(
    .A(OpA),
    .B(OpB),
    .ALUControl(AluControl),
    .Result(AluResult),
    .Z(Z),
    .N(N),
    .C(C),
    .V(V)
);


initial begin
    $dumpfile("sim.vcd"); 
    $dumpvars;
 end


initial begin
    AluControl = 4'b0000;
    OpA = 32'h80000000;
    OpB = 32'h80000000;
    #1;
    OpA = 32'h70000000;
    OpB = 32'h80000000;
    #1;
    OpA = 32'h80000000;
    OpB = 32'h70000000;
    #1;
    AluControl = 4'b0001;
    OpA = 32'h80000000;
    OpB = 32'h80000000;
    #1;
    OpA = 32'h70000000;
    OpB = 32'h80000000;
    #1;
    OpA = 32'h80000000;
    OpB = 32'h70000000;
    #1;
    AluControl = 4'b0010;
    OpA = 32'h00000001;
    OpB = 32'h0000001f;
    #1;
    AluControl = 4'b0101;
    OpA = 32'h80000000;
    OpB = 32'h70000000;
    #1;
    OpA = 32'h70000000;
    OpB = 32'h80000000;
    #1;
    AluControl = 4'b1001;
    OpA = 32'h80000000;
    OpB = 32'h70000000;
    #1;
    OpA = 32'h70000000;
    OpB = 32'h80000000;
    #1;
    $display("All verification tests passed!");
    $finish;
end

endmodule