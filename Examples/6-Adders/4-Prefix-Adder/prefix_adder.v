module prefix_adder (input wire [15:0] A,B,
            input wire Cin,
            output wire [15:0] S,
            output wire Cout);

    
wire [15:-1] Pii, Gii;
wire [15:-1] P1ij, G1ij;
wire [15:-1] P2ij, G2ij;
wire [15:-1] P3ij, G3ij;
wire [15:-1] P4ij, G4ij;

assign Gii[-1] = Cin;
assign Pii[-1] = 1'b0;

genvar s0;
generate
    for (s0=0;s0<15;s0=s0+1) begin
        pg_ii first_row(
            .Ai(A[s0]),
            .Bi(B[s0]),
            .Pii(Pii[s0]),
            .Gii(Gii[s0])
        );
    end
endgenerate

    assign P1ij[-1]  = Pii[-1];
    assign P1ij[1]  = Pii[1];
    assign P1ij[3]  = Pii[3];
    assign P1ij[5]  = Pii[5];
    assign P1ij[7]  = Pii[7];
    assign P1ij[9]  = Pii[9];
    assign P1ij[11] = Pii[11];
    assign P1ij[13] = Pii[13];

    assign G1ij[-1]  = Gii[-1];
    assign G1ij[1]  = Gii[1];
    assign G1ij[3]  = Gii[3];
    assign G1ij[5]  = Gii[5];
    assign G1ij[7]  = Gii[7];
    assign G1ij[9]  = Gii[9];
    assign G1ij[11] = Gii[11];
    assign G1ij[13] = Gii[13];

    pg_ij pg_0m1(
                .Pik(Pii[0]),
                .Pkm1j(Pii[-1]),
                .Gik(Gii[0]),
                .Gkm1j(Gii[-1]),
                .Pij(P1ij[0]),
                .Gij(G1ij[0])
            );

    pg_ij pg_21(
                .Pik(Pii[2]),
                .Pkm1j(Pii[1]),
                .Gik(Gii[2]),
                .Gkm1j(Gii[1]),
                .Pij(P1ij[2]),
                .Gij(G1ij[2])
            );

    pg_ij pg_43(
                .Pik(Pii[4]),
                .Pkm1j(Pii[3]),
                .Gik(Gii[4]),
                .Gkm1j(Gii[3]),
                .Pij(P1ij[4]),
                .Gij(G1ij[4])
            );

    pg_ij pg_65(
                .Pik(Pii[6]),
                .Pkm1j(Pii[5]),
                .Gik(Gii[6]),
                .Gkm1j(Gii[5]),
                .Pij(P1ij[6]),
                .Gij(G1ij[6])
            );

    pg_ij pg_87(
                .Pik(Pii[8]),
                .Pkm1j(Pii[7]),
                .Gik(Gii[8]),
                .Gkm1j(Gii[7]),
                .Pij(P1ij[8]),
                .Gij(G1ij[8])
            );

    pg_ij pg_109(
                .Pik(Pii[10]),
                .Pkm1j(Pii[9]),
                .Gik(Gii[10]),
                .Gkm1j(Gii[9]),
                .Pij(P1ij[10]),
                .Gij(G1ij[10])
            );


    pg_ij pg_1211(
                .Pik(Pii[12]),
                .Pkm1j(Pii[11]),
                .Gik(Gii[12]),
                .Gkm1j(Gii[11]),
                .Pij(P1ij[12]),
                .Gij(G1ij[12])
            );

    pg_ij pg_1413(
                .Pik(Pii[14]),
                .Pkm1j(Pii[13]),
                .Gik(Gii[14]),
                .Gkm1j(Gii[13]),
                .Pij(P1ij[14]),
                .Gij(G1ij[14])
            );



    /*Second ROW*/

    assign P2ij[-1] = P1ij[-1];
    assign P2ij[0] = P1ij[0];
    assign P2ij[3] = P1ij[3];
    assign P2ij[4] = P1ij[4];
    assign P2ij[7] = P1ij[7];
    assign P2ij[8] = P1ij[8];
    assign P2ij[11] = P1ij[11];
    assign P2ij[12] = P1ij[12];

    assign G2ij[-1] = G1ij[-1];
    assign G2ij[0] = G1ij[0];
    assign G2ij[3] = G1ij[3];
    assign G2ij[4] = G1ij[4];
    assign G2ij[7] = G1ij[7];
    assign G2ij[8] = G1ij[8];
    assign G2ij[11] = G1ij[11];
    assign G2ij[12] = G1ij[12];


    pg_ij pg_1m1(
                .Pik(P1ij[1]),
                .Pkm1j(P1ij[0]),
                .Gik(G1ij[1]),
                .Gkm1j(G1ij[0]),
                .Pij(P2ij[1]),
                .Gij(G2ij[1])
            );

    pg_ij pg_2m1(
                .Pik(P1ij[2]),
                .Pkm1j(P1ij[0]),
                .Gik(G1ij[2]),
                .Gkm1j(G1ij[0]),
                .Pij(P2ij[2]),
                .Gij(G2ij[2])
            );

    pg_ij pg_53(
                .Pik(P1ij[5]),
                .Pkm1j(P1ij[4]),
                .Gik(G1ij[5]),
                .Gkm1j(G1ij[4]),
                .Pij(P2ij[5]),
                .Gij(G2ij[5])
            );

    pg_ij pg_63(
                .Pik(P1ij[6]),
                .Pkm1j(P1ij[4]),
                .Gik(G1ij[6]),
                .Gkm1j(G1ij[4]),
                .Pij(P2ij[6]),
                .Gij(G2ij[6])
            );

    pg_ij pg_97(
                .Pik(P1ij[9]),
                .Pkm1j(P1ij[8]),
                .Gik(G1ij[9]),
                .Gkm1j(G1ij[8]),
                .Pij(P2ij[9]),
                .Gij(G2ij[9])
            );

    pg_ij pg_107(
                .Pik(P1ij[10]),
                .Pkm1j(P1ij[8]),
                .Gik(G1ij[10]),
                .Gkm1j(G1ij[8]),
                .Pij(P2ij[10]),
                .Gij(G2ij[10])
            );


    pg_ij pg_1311(
                .Pik(P1ij[13]),
                .Pkm1j(P1ij[12]),
                .Gik(G1ij[13]),
                .Gkm1j(G1ij[12]),
                .Pij(P2ij[13]),
                .Gij(G2ij[13])
            );

    pg_ij pg_1411(
                .Pik(P1ij[14]),
                .Pkm1j(P1ij[12]),
                .Gik(G1ij[14]),
                .Gkm1j(G1ij[12]),
                .Pij(P2ij[14]),
                .Gij(G2ij[14])
            );

    // Third STAGE 

    assign P3ij[-1]    = P2ij[-1];
    assign P3ij[0]     = P2ij[0] ;
    assign P3ij[1]     = P2ij[1] ;
    assign P3ij[2]     = P2ij[2] ;
    assign P3ij[7]     = P2ij[7] ;
    assign P3ij[8]     = P2ij[8] ;
    assign P3ij[9]     = P2ij[9] ;
    assign P3ij[10]    = P2ij[10];

    assign G3ij[-1]    = G2ij[-1];
    assign G3ij[0]     = G2ij[0] ;
    assign G3ij[1]     = G2ij[1] ;
    assign G3ij[2]     = G2ij[2] ;
    assign G3ij[7]     = G2ij[7] ;
    assign G3ij[8]     = G2ij[8] ;
    assign G3ij[9]     = G2ij[9] ;
    assign G3ij[10]    = G2ij[10];

    pg_ij pg_3m1(
                .Pik(P2ij[3]),
                .Pkm1j(P2ij[2]),
                .Gik(G2ij[3]),
                .Gkm1j(G2ij[2]),
                .Pij(P3ij[3]),
                .Gij(G3ij[3])
            );

    pg_ij pg_4m1(
                .Pik(P2ij[4]),
                .Pkm1j(P2ij[2]),
                .Gik(G2ij[4]),
                .Gkm1j(G2ij[2]),
                .Pij(P3ij[4]),
                .Gij(G3ij[4])
            );

    pg_ij pg_5m1(
                .Pik(P2ij[5]),
                .Pkm1j(P2ij[2]),
                .Gik(G2ij[5]),
                .Gkm1j(G2ij[2]),
                .Pij(P3ij[5]),
                .Gij(G3ij[5])
            );

    pg_ij pg_6m1(
                .Pik(P2ij[6]),
                .Pkm1j(P2ij[2]),
                .Gik(G2ij[6]),
                .Gkm1j(G2ij[2]),
                .Pij(P3ij[6]),
                .Gij(G3ij[6])
            );

    pg_ij pg_117(
                .Pik(P2ij[11]),
                .Pkm1j(P2ij[10]),
                .Gik(G2ij[11]),
                .Gkm1j(G2ij[10]),
                .Pij(P3ij[11]),
                .Gij(G3ij[11])
            );

    pg_ij pg_127(
                .Pik(P2ij[12]),
                .Pkm1j(P2ij[10]),
                .Gik(G2ij[12]),
                .Gkm1j(G2ij[10]),
                .Pij(P3ij[12]),
                .Gij(G3ij[12])
            );


    pg_ij pg_137(
                .Pik(P2ij[13]),
                .Pkm1j(P2ij[10]),
                .Gik(G2ij[13]),
                .Gkm1j(G2ij[10]),
                .Pij(P3ij[13]),
                .Gij(G3ij[13])
            );

    pg_ij pg_147(
                .Pik(P2ij[14]),
                .Pkm1j(P2ij[10]),
                .Gik(G2ij[14]),
                .Gkm1j(G2ij[10]),
                .Pij(P3ij[14]),
                .Gij(G3ij[14])
            );


    // Fourth STAGE

    assign P4ij[-1]    = P3ij[-1];
    assign P4ij[0]     = P3ij[0] ;
    assign P4ij[1]     = P3ij[1] ;
    assign P4ij[2]     = P3ij[2] ;
    assign P4ij[3]     = P3ij[3] ;
    assign P4ij[4]     = P3ij[4] ;
    assign P4ij[5]     = P3ij[5] ;
    assign P4ij[6]     = P3ij[6] ;

    assign G4ij[-1]    = G3ij[-1];
    assign G4ij[0]     = G3ij[0] ;
    assign G4ij[1]     = G3ij[1] ;
    assign G4ij[2]     = G3ij[2] ;
    assign G4ij[3]     = G3ij[3] ;
    assign G4ij[4]     = G3ij[4] ;
    assign G4ij[5]     = G3ij[5] ;
    assign G4ij[6]     = G3ij[6] ;

    pg_ij pg_7m1(
                .Pik(P3ij[7]),
                .Pkm1j(P3ij[6]),
                .Gik(G3ij[7]),
                .Gkm1j(G3ij[6]),
                .Pij(P4ij[7]),
                .Gij(G4ij[7])
            );

    pg_ij pg_8m1(
                .Pik(P3ij[8]),
                .Pkm1j(P3ij[6]),
                .Gik(G3ij[8]),
                .Gkm1j(G3ij[6]),
                .Pij(P4ij[8]),
                .Gij(G4ij[8])
            );

    pg_ij pg_9m1(
                .Pik(P3ij[9]),
                .Pkm1j(P3ij[6]),
                .Gik(G3ij[9]),
                .Gkm1j(G3ij[6]),
                .Pij(P4ij[9]),
                .Gij(G4ij[9])
            );

    pg_ij pg_10m1(
                .Pik(P3ij[10]),
                .Pkm1j(P3ij[6]),
                .Gik(G3ij[10]),
                .Gkm1j(G3ij[6]),
                .Pij(P4ij[10]),
                .Gij(G4ij[10])
            );

    pg_ij pg_11m1(
                .Pik(P3ij[11]),
                .Pkm1j(P3ij[6]),
                .Gik(G3ij[11]),
                .Gkm1j(G3ij[6]),
                .Pij(P4ij[11]),
                .Gij(G4ij[11])
            );

    pg_ij pg_12m1(
                .Pik(P3ij[12]),
                .Pkm1j(P3ij[6]),
                .Gik(G3ij[12]),
                .Gkm1j(G3ij[6]),
                .Pij(P4ij[12]),
                .Gij(G4ij[12])
            );


    pg_ij pg_13m1(
                .Pik(P3ij[13]),
                .Pkm1j(P3ij[6]),
                .Gik(G3ij[13]),
                .Gkm1j(G3ij[6]),
                .Pij(P4ij[13]),
                .Gij(G4ij[13])
            );

    pg_ij pg_14m1(
                .Pik(P3ij[14]),
                .Pkm1j(P3ij[6]),
                .Gik(G3ij[14]),
                .Gkm1j(G3ij[6]),
                .Pij(P4ij[14]),
                .Gij(G4ij[14])
            );

 // Final sum 

 add add_0(
    .Gim1m1(G4ij[-1]),
    .Ai(A[0]),
    .Bi(B[0]),
    .Si(S[0])
 );

 add add_1(
    .Gim1m1(G4ij[0]),
    .Ai(A[1]),
    .Bi(B[1]),
    .Si(S[1])
 );

 add add_2(
    .Gim1m1(G4ij[1]),
    .Ai(A[2]),
    .Bi(B[2]),
    .Si(S[2])
 );

 add add_3(
    .Gim1m1(G4ij[2]),
    .Ai(A[3]),
    .Bi(B[3]),
    .Si(S[3])
 );

 add add_4(
    .Gim1m1(G4ij[3]),
    .Ai(A[4]),
    .Bi(B[4]),
    .Si(S[4])
 );

 add add_5(
    .Gim1m1(G4ij[4]),
    .Ai(A[5]),
    .Bi(B[5]),
    .Si(S[5])
 );

 add add_6(
    .Gim1m1(G4ij[5]),
    .Ai(A[6]),
    .Bi(B[6]),
    .Si(S[6])
 );

add add_7(
    .Gim1m1(G4ij[6]),
    .Ai(A[7]),
    .Bi(B[7]),
    .Si(S[7])
 );

 add add_8(
    .Gim1m1(G4ij[7]),
    .Ai(A[8]),
    .Bi(B[8]),
    .Si(S[8])
 );

 add add_9(
    .Gim1m1(G4ij[8]),
    .Ai(A[9]),
    .Bi(B[9]),
    .Si(S[9])
 );

 add add_10(
    .Gim1m1(G4ij[9]),
    .Ai(A[10]),
    .Bi(B[10]),
    .Si(S[10])
 );

  add add_11(
    .Gim1m1(G4ij[10]),
    .Ai(A[11]),
    .Bi(B[11]),
    .Si(S[11])
 );

   add add_12(
    .Gim1m1(G4ij[11]),
    .Ai(A[12]),
    .Bi(B[12]),
    .Si(S[12])
 );

   add add_13(
    .Gim1m1(G4ij[12]),
    .Ai(A[13]),
    .Bi(B[13]),
    .Si(S[13])
 );

   add add_14(
    .Gim1m1(G4ij[13]),
    .Ai(A[14]),
    .Bi(B[14]),
    .Si(S[14])
 );

   add add_15(
    .Gim1m1(G4ij[14]),
    .Ai(A[15]),
    .Bi(B[15]),
    .Si(S[15])
 );
endmodule