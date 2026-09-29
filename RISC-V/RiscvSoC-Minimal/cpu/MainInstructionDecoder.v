module MainInstructionDecoder(
input wire [6:0] opcode,
output reg [1:0] AluSrcA,
output reg AluSrcB,        
output reg [1:0] AluOp,  
output reg MemWrite,    
output reg RegWrite,    
output reg [1:0] Jump,   
output reg Branch,      
output reg [2:0] Immcntl,
output reg [1:0] ResultSrc
);

localparam LOAD         =  7'd3;
localparam ALUIMM       =  7'd19;
localparam STORE        =  7'd35;
localparam ALUREG       =  7'd51;
localparam BRANCH       =  7'd99;
localparam JAL          =  7'd111;


always @(*) begin
    case (opcode)
        LOAD   : begin
            AluOp        = 2'b00; 
            MemWrite     = 1'b0;   
            RegWrite     = 1'b1; 
            Jump         = 2'b00;  
            Branch       = 1'b0;
            Immcntl      = 3'b000; 
            AluSrcA      = 2'b00;    
            AluSrcB      = 1'b1; 
            ResultSrc    = 2'b01;   
        end
        STORE  : begin
            AluOp        = 2'b00; 
            MemWrite     = 1'b1;   
            RegWrite     = 1'b0; 
            Jump         = 2'b00;  
            Branch       = 1'b0;
            Immcntl      = 3'b001; 
            AluSrcA      = 2'b00;    
            AluSrcB      = 1'b1; 
            ResultSrc    = 2'b00; 
        end
        ALUREG : begin
            AluOp        = 2'b10; 
            MemWrite     = 1'b0;   
            RegWrite     = 1'b1; 
            Jump         = 2'b00;  
            Branch       = 1'b0;
            Immcntl      = 3'b000; 
            AluSrcA      = 2'b00;    
            AluSrcB      = 1'b0; 
            ResultSrc    = 2'b00;
        end
        BRANCH : begin
            AluOp        = 2'b01; 
            MemWrite     = 1'b0;   
            RegWrite     = 1'b0; 
            Jump         = 2'b00;  
            Branch       = 1'b1;
            Immcntl      = 3'b010; 
            AluSrcA      = 2'b00;    
            AluSrcB      = 1'b0; 
            ResultSrc    = 2'b00;
        end
        ALUIMM : begin
            AluOp        = 2'b10; 
            MemWrite     = 1'b0;   
            RegWrite     = 1'b1; 
            Jump         = 2'b00;  
            Branch       = 1'b0;
            Immcntl      = 3'b000; 
            AluSrcA      = 2'b00;    
            AluSrcB      = 1'b1; 
            ResultSrc    = 2'b00;
        end
        JAL    : begin
            AluOp        = 2'b00; 
            MemWrite     = 1'b0;   
            RegWrite     = 1'b1; 
            Jump         = 2'b01;  
            Branch       = 1'b0;
            Immcntl      = 3'b011; 
            AluSrcA      = 2'b00;    
            AluSrcB      = 1'b0; 
            ResultSrc    = 2'b10;
        end
        default: begin
            AluOp        = 2'b00; 
            MemWrite     = 1'b0;   
            RegWrite     = 1'b0; 
            Jump         = 2'b00;  
            Branch       = 1'b0;
            Immcntl      = 3'b000; 
            AluSrcA      = 2'b00;    
            AluSrcB      = 1'b0; 
            ResultSrc    = 2'b00; 
        end
    endcase
end





endmodule