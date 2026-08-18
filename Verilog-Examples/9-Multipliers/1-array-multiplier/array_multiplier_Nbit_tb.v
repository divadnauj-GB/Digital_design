`timescale 1ns/1ps
`define assert(signal, value) \
    if ((signal) !== (value)) begin \
        $display("ASSERTION FAILED in %m: %s != %b, %b", `"signal`", value, signal); \
        $finish; \
    end

module array_multiplier_Nbit_tb;
    parameter N = 4;
    reg [N-1:0] A;
    reg [N-1:0] B;
    wire [2*N-1:0] P;

    // Instantiate the array multiplier
    array_multiplier_Nbit #(N) uut (
        .A(A),
        .B(B),
        .P(P)
    );

    initial begin
        $dumpfile("sim.vcd");
        $dumpvars;
    end

    initial begin
        // Test case 1
        A = 4'b0011; // 3
        B = 4'b0101; // 5
        #10;
        $display("A = %b, B = %b, P = %b (Expected: 00001111)", A, B, P);
        `assert(P,8'b00001111);

        // Test case 2
        A = 4'b1111; // 15
        B = 4'b1111; // 15
        #10;
        $display("A = %b, B = %b, P = %b (Expected: 11100001)", A, B, P);
        `assert(P,8'b11100001);

        // Test case 3
        A = 4'b1010; // 10
        B = 4'b0011; // 3
        #10;
        $display("A = %b, B = %b, P = %b (Expected: 00011110)", A, B, P);
        `assert(P,8'b00011110);

        // Test case 4
        A = 4'b0000; // 0
        B = 4'b1111; // 15
        #10;
        $display("A = %b, B = %b, P = %b (Expected: 00000000)", A, B, P);
        `assert(P,8'b00000000);

        // Test case 5
        A = 4'b1001; // 9
        B = 4'b1001; // 9
        #10;
        $display("A = %b, B = %b, P = %b (Expected: 01010001)", A, B, P);
        `assert(P,8'b01010001);
        $display("All verification tests passed!");
        $finish;
    end
endmodule