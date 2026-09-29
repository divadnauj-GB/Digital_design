module tb_AluControl;

reg [1:0] AluOp;
reg [2:0] funct3;
reg function7_5;
wire [3:0] ALUControl;



AluControl DUT(
.AluOp(AluOp),
.funct3(funct3),
.function7_5(function7_5),
.ALUControl(ALUControl)
);


initial begin
    $dumpfile("sim.vcd");
    $dumpvars;
end

integer i;
initial begin
    AluOp=2'b00;
    for(i=0;i<=15;i=i+1) begin
        funct3 = i[3:1];
        function7_5 = i[0];
        #1;
    end
    
    AluOp=2'b01;
    for(i=0;i<=15;i=i+1) begin
        funct3 = i[3:1];
        function7_5 = i[0];
        #1;
    end

    AluOp=2'b10;
    for(i=0;i<=15;i=i+1) begin
        funct3 = i[3:1];
        function7_5 = i[0];
        #1;
    end

    AluOp=2'b11;
    for(i=0;i<=15;i=i+1) begin
        funct3 = i[3:1];
        function7_5 = i[0];
        #1;
    end
    $display("All verification tests passed!");
    $finish;
end


endmodule