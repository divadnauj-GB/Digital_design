module tb_branch_jump_deco;

 reg Branch;
 reg [1:0] Jump;
 reg [2:0] funct3;
 reg Z,C,V,N;
 wire [1:0] PCControl;

branch_jump_deco DUT(
    .Branch(Branch),
    .Jump(Jump),
    .funct3(funct3),
    .Z(Z),
    .C(C),
    .V(V),
    .N(N),
    .PCControl(PCControl)
);



initial begin
    $dumpfile("sim.vcd");
    $dumpvars;
end


initial begin
    {Branch,Jump,funct3,Z,C,V,N} = 10'b0_00_xxx_x_x_x_x;
    #1
    {Branch,Jump,funct3,Z,C,V,N} = 10'b0_01_000_x_x_x_x;
    #1
    {Branch,Jump,funct3,Z,C,V,N} = 10'b0_10_xxx_x_x_x_x;
    #1
    {Branch,Jump,funct3,Z,C,V,N} = 10'b1_00_000_0_x_x_x;
    #1
    {Branch,Jump,funct3,Z,C,V,N} = 10'b1_00_000_1_x_x_x;
    #1
    {Branch,Jump,funct3,Z,C,V,N} = 10'b1_00_001_0_x_x_x;
    #1
    {Branch,Jump,funct3,Z,C,V,N} = 10'b1_00_001_1_x_x_x;
    #1
    {Branch,Jump,funct3,Z,C,V,N} = 10'b1_00_100_x_x_0_0;
    #1
    {Branch,Jump,funct3,Z,C,V,N} = 10'b1_00_100_x_x_1_1;
    #1
    {Branch,Jump,funct3,Z,C,V,N} = 10'b1_00_100_x_x_0_1;
    #1
    {Branch,Jump,funct3,Z,C,V,N} = 10'b1_00_100_x_x_1_0;
    #1
    {Branch,Jump,funct3,Z,C,V,N} = 10'b1_00_101_x_x_0_0;
    #1
    {Branch,Jump,funct3,Z,C,V,N} = 10'b1_00_101_x_x_1_1;
    #1
    {Branch,Jump,funct3,Z,C,V,N} = 10'b1_00_101_x_x_0_1;
    #1
    {Branch,Jump,funct3,Z,C,V,N} = 10'b1_00_101_x_x_1_0;
    #1
    {Branch,Jump,funct3,Z,C,V,N} = 10'b1_00_110_x_0_x_x;
    #1
    {Branch,Jump,funct3,Z,C,V,N} = 10'b1_00_110_x_1_x_x;
    #1
    {Branch,Jump,funct3,Z,C,V,N} = 10'b1_00_111_x_0_x_x;
    #1
    {Branch,Jump,funct3,Z,C,V,N} = 10'b1_00_111_x_1_x_x;
    #1
    $finish;
end
endmodule