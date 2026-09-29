module ControlUnit(
input wire [6:0] opcode,
input wire [6:0] function7,
input wire [2:0] funct3,
input wire Z,
input wire C,
input wire V,
input wire N,
output wire [1:0] AluSrcA,
output wire AluSrcB,        
output wire MemWrite,    
output wire RegWrite,       
output wire [2:0] Immcntl,
output wire [1:0] ResultSrc,
output wire [3:0] ALUControl,
output wire [1:0] PCControl,
output wire [3:0] ByteEnable,
output wire [2:0] MemLoadSignExt
);

wire [1:0] AluOp;  
wire [1:0] Jump;   
wire Branch;

MainInstructionDecoder InstrDec(
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


AluControl AluCntr(
    .AluOp(AluOp),
    .funct3(funct3),
    .Opcode_5(opcode[5]),
    .function7_5(function7[5]),
    .ALUControl(ALUControl)
);


PCControl PCCntr(
    .Branch(Branch),
    .Jump(Jump),
    .funct3(funct3),
    .Z(Z),
    .C(C),
    .V(V),
    .N(N),
    .PCControl(PCControl)
);

ByteSelect ByteEna(
    .funct3(funct3[1:0]),
    .ByteEnable(ByteEnable)
);

assign MemLoadSignExt=funct3;

endmodule