module tb_control_unit;

reg [6:0] opcode;
wire [1:0] AluSrcA;
wire AluSrcB;        
wire [1:0] AluOp;  
wire MemWrite;    
wire RegWrite;    
wire [1:0] Jump;   
wire Branch;      
wire [2:0] Immcntl;
wire [1:0] ResultSrc;

localparam LOAD         =  7'd3;
localparam ALUIMM       =  7'd19;
localparam AUIPC        =  7'd23;
localparam STORE        =  7'd35;
localparam ALUREG       =  7'd51;
localparam LUI          =  7'd55;
localparam BRANCH       =  7'd99;
localparam JALR         =  7'd103;
localparam JAL          =  7'd111;

control_unit DUT(
    .opcode(opcode),
    .AluSrcA(AluSrcA),
    .AluSrcB(AluSrcB),        
    .AluOp(AluOp),
    .MemWrite(MemWrite),    
    .RegWrite(RegWrite),  
    .Jump(Jump),   
    .Branch(Branch),      
    .Immcntl(Immcntl),
    .ResultSrc(ResultSrc)
);


initial begin
    $dumpfile("sim.vcd");
    $dumpvars;
    opcode = LOAD;
    #1;
    opcode = STORE;
    #1;
    opcode = AUIPC;
    #1;
    opcode = LUI;
    #1;
    opcode = ALUREG;
    #1;
    opcode = BRANCH;
    #1;
    opcode = ALUIMM;
    #1;
    opcode = JALR;
    #1;
    opcode = JAL;
    #1;
    $finish;
end
endmodule