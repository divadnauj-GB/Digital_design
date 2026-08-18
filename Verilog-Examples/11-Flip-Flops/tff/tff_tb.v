module tff_tb;

    reg clk;
    reg rst_n;
    reg en;
    reg t;
    wire q;
    wire qn;

    // Instantiate the T flip-flop
    tff uut (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .t(t),
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
        t = 0;

        // Release reset
        #12;
        rst_n = 1;

        // Test enabling and toggle input
        #10;
        en = 1; t = 1; // Enable and set t to 1 (toggle)
        #10;
        t = 0;         // Set t to 0 (no toggle)
        #10;
        en = 0;       // Disable
        #10;
        t = 1;         // Set t to 1 while disabled
        #10;
        en = 1;       // Enable again
        #10;

        // Finish simulation
        #20;
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | rst_n=%b en=%b t=%b | q=%b qn=%b", 
                  $time, rst_n, en, t, q, qn);
    end
endmodule