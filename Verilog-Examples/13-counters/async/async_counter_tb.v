module async_counter_tb ;

    parameter WIDTH = 4;

    reg clk;
    reg rst_n;
    reg en;
    wire [WIDTH-1:0] count;

    // Instantiate the asynchronous counter
    async_counter #(WIDTH) uut (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .count(count)
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

        // Release reset
        #12;
        rst_n = 1;

        // Enable counting
        #10;
        en = 1; // Enable counting
        #100;

        // Disable counting
        en = 0; // Disable counting
        #20;

        // Finish simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t | rst_n: %b | en: %b | count: %b", $time, rst_n, en, count);
    end
endmodule