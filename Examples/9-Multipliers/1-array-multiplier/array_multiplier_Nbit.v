module array_multiplier_Nbit #(parameter N = 4) (
    input [N-1:0] A,
    input [N-1:0] B,
    output [2*N-1:0] P
);
    wire [N-1:0][N:0] pp; // Partial products
    wire [N-1:0][N:0] sum;  // Sum wires
    wire [N-1:0][N:0] carry; // Carry wires

    // Generate partial products
    genvar i, j;
    generate
        for (i = 0; i < N; i = i + 1) begin : gen_pp
            for (j = 0; j <= N; j = j + 1) begin : gen_pp_inner
                if (j==N) begin : pp_zero
                    assign pp[i][j] = 1'b0;
                end else begin
                    assign pp[i][j] = A[i] & B[j];
                end
                
            end
        end
    endgenerate

    // First row of addition (no carry-in)
    //assign sum[0][0] = pp[0][0];
    
    /*
    generate
        for (i = 1; i < N; i = i + 1) begin : first_row_add
            assign carry[i][0] = 1'b0;
        end
    endgenerate
    */
    
    generate
        assign carry[0][0] = 1'b0;
        for (j = 1; j <= N; j = j + 1) begin : first_row_add
            fa full_adder (
                .a(pp[0][j]),
                .b(pp[1][j-1]),
                .cin(carry[0][j-1]),
                .sum(sum[0][j-1]),
                .cout(carry[0][j])
            );
        end
        assign sum[0][N] = carry[0][N];
    endgenerate

    // Subsequent rows of addition
    generate
        for (i = 1; i < N-1; i = i + 1) begin : gen_rows
            assign carry[i][0] = 1'b0;
            for (j = 1; j <= N; j = j + 1) begin : gen_cols
                fa full_adder (
                    .a(sum[i-1][j]),
                    .b(pp[i+1][j-1]),
                    .cin(carry[i][j-1]),
                    .sum(sum[i][j-1]),
                    .cout(carry[i][j])
                );
            end
            assign sum[i][N] = carry[i][N];
        end
    endgenerate

    // Assign final product bits
    assign P[0] = pp[0][0];
    generate
        for (i = 0; i < N-1; i = i + 1) begin : assign_product
            assign P[i+1] = sum[i][0];
        end
    endgenerate
    assign P[2*N-1:N] = sum[N-2][N:1];  
endmodule