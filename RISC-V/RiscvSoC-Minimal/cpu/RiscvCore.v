module RiscvCore(
    input wire clk,
    input wire rstn,
    input wire [31:0]  ibus_rd_idata,
    input wire [31:0]  dbus_rd_data,
    output wire [31:0] dbus_wr_data,
    output wire [31:0] ibus_addr,
    output wire [31:0] dbus_addr,
    output wire dbus_we,
    output wire [3:0] dbus_ByteEnable
);


wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;
wire [6:0] opcode;
wire [2:0] funct3;
wire [6:0] function7;

reg [31:0] PC;
reg [31:0] NextPC;
wire [31:0] NextPC4;
wire [31:0] NextPCImm;
wire [31:0] NextPCSrc1Imm;

wire [31:0] OpA;
wire [31:0] OpB;

wire [31:0] rfSrcA;
wire [31:0] rfSrcB;
reg [31:0] rfSrcDest;
wire [31:0] AluResult;
wire [3:0] ALUControl;
wire Z,C,N,V;

wire [31:0] ImmSrcVal;

wire [1:0] AluSrcA;
wire AluSrcB;     
wire MemWrite;    
wire RegWrite;    
wire [2:0] Immcntl;
wire [1:0] ResultSrc;
wire [2:0] MemLoadSignExt;
wire [1:0] PCControl;

wire [31:0] MemReadData;

/*Separate instruction fields*/
assign rs1 = ibus_rd_idata[19:15];
assign rs2 = ibus_rd_idata[24:20];
assign rd = ibus_rd_idata[11:7];
assign opcode = ibus_rd_idata[6:0];
assign funct3 = ibus_rd_idata[14:12];
assign function7 = ibus_rd_idata[31:25];


always @(posedge clk, negedge rstn) begin
    if(!rstn) begin
        PC <= 0;
    end else begin
        PC <= NextPC;
    end
end

assign ibus_addr = PC;

assign NextPC4      = PC+4;
assign NextPCImm    = PC+ImmSrcVal;
assign NextPCSrc1Imm = AluResult;

always @(*) begin
    case (PCControl)
        2'b00:  NextPC = NextPC4;
        2'b01:  NextPC = NextPCImm;
        2'b10:  NextPC = NextPCSrc1Imm;
        default: NextPC = NextPC4;
    endcase
end

ControlUnit CPU_CU(
    .opcode(opcode),
    .function7(function7),
    .funct3(funct3),
    .Z(Z),
    .C(C),
    .V(V),
    .N(N),
    .AluSrcA(AluSrcA),
    .AluSrcB(AluSrcB),        
    .MemWrite(MemWrite),    
    .RegWrite(RegWrite),    
    .Immcntl(Immcntl),
    .ResultSrc(ResultSrc),
    .ALUControl(ALUControl),
    .PCControl(PCControl),
    .ByteEnable(dbus_ByteEnable),
    .MemLoadSignExt(MemLoadSignExt)
);

assign dbus_we = MemWrite;

RegFile CPU_RF(
    .clk(clk),
    .rstn(rstn),
    .we(RegWrite), // write enable
    .rs1(rs1), // source register 1
    .rs2(rs2), // source register 2
    .rd(rd),  // destination register
    .wd(rfSrcDest), // write data
    .rd1(rfSrcA), // read data 1
    .rd2(rfSrcB)  // read data 2
);


ImmSrc CPU_IMMSRC(
    .Immcntl(Immcntl),
    .Instr(ibus_rd_idata),
    .ImmSrcVal(ImmSrcVal)
);

/*AluSrcA multiplexer*/
assign OpA = AluSrcA[1] ? PC : AluSrcA[0] ? 0 : rfSrcA;

/*AluSrcB multiplexer*/
assign OpB = AluSrcB ? ImmSrcVal: rfSrcB;

Alu CPU_ALU(
    .A(OpA),
    .B(OpB),
    .ALUControl(ALUControl),
    .Result(AluResult),
    .Z(Z),
    .N(N),
    .C(C),
    .V(V)
);

assign dbus_addr = AluResult;
assign dbus_wr_data = rfSrcB;


LoadSignExt CPU_LOADMEM(
    .MemLoadSignExt(MemLoadSignExt),
    .MemRVal(dbus_rd_data),
    .ReadMemVal(MemReadData)
);


/* rfSrcDest multiplexer*/
always @(*) begin
    case (ResultSrc)
        2'b00:  rfSrcDest = AluResult;
        2'b01:  rfSrcDest = MemReadData;
        2'b10:  rfSrcDest = NextPC4;
        default: rfSrcDest = rfSrcA;
    endcase
end

endmodule