module cla_32bit_adder (input wire [31:0] A,B,
            input wire Cin,
            output wire [31:0] S,
            output wire Cout);

    wire C3,C7,C11,C15,C19,C23,C27;


    cla_4bit CLA0(
        .A(A[3:0]),
        .B(B[3:0]),
        .Cin(Cin),
        .S(S[3:0]),
        .Cout(C3)
    );

    cla_4bit CLA1(
        .A(A[7:4]),
        .B(B[7:4]),
        .Cin(C3),
        .S(S[7:4]),
        .Cout(C7)
    );

    cla_4bit CLA2(
        .A(A[11:8]),
        .B(B[11:8]),
        .Cin(C7),
        .S(S[11:8]),
        .Cout(C11)
    );

    cla_4bit CLA3(
        .A(A[15:12]),
        .B(B[15:12]),
        .Cin(C11),
        .S(S[15:12]),
        .Cout(C15)
    );

    cla_4bit CLA4(
        .A(A[19:16]),
        .B(B[19:16]),
        .Cin(C15),
        .S(S[19:16]),
        .Cout(C19)
    );

    cla_4bit CLA5(
        .A(A[23:20]),
        .B(B[23:20]),
        .Cin(C19),
        .S(S[23:20]),
        .Cout(C23)
    );

    cla_4bit CLA6(
        .A(A[27:24]),
        .B(B[27:24]),
        .Cin(C23),
        .S(S[27:24]),
        .Cout(C27)
    );

    cla_4bit CLA7(
        .A(A[31:28]),
        .B(B[31:28]),
        .Cin(C27),
        .S(S[31:28]),
        .Cout(Cout)
    );
    

endmodule