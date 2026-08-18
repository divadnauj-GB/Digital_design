module jk_ff_tb ;

    reg clk;
    reg rst_n;
    reg en;
    reg j;
    reg k;
    wire q;
    wire qn;

    // Instantiate the JK flip-flop
    jk_ff uut (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .j(j),
        .k(k),
        .q(q),
        .qn(qn)
    );

    initial begin
        $dumpfile("sim.vcd");
        $dumpvars;
    end

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst_n = 0;
        en = 0;
        j = 0;
        k = 0;

        // Release reset
        #12;
        rst_n = 1;

        // Test enabling and JK inputs
        #10;
        en = 1; j = 1; k = 0; // Enable and set J=1, K=0 (Set)
        #10;
        j = 0; k = 1;         // Change to J=0, K=1 (Reset)
        #10;
        j = 1; k = 1;         // Change to J=1, K=1 (Toggle)
        #10;
        en = 0;               // Disable
        #10;
        j = 1; k = 0;         // Change to J=1, K=0 while disabled
        #10;
        en = 1;               // Enable again
        #10;

        // Finish simulation
        #20;
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | rst_n=%b en=%b | j=%b k=%b | q=%b qn=%b", 
                  $time, rst_n, en, j, k, q, qn);
    end
endmodule