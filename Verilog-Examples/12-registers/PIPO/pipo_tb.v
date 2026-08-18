module pipo_tb ;

    parameter WIDTH = 8;

    reg clk;
    reg rst_n;
    reg en;
    reg [WIDTH-1:0] in_data;
    wire [WIDTH-1:0] out_data;

    // Instantiate the PIPO register
    pipo #(WIDTH) uut (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .in_data(in_data),
        .out_data(out_data)
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
        in_data = 0;

        // Release reset
        #12;
        rst_n = 1;

        // Test enabling and data input
        #10;
        en = 1; in_data = 8'hA5; // Enable and set in_data to A5
        #10;
        in_data = 8'h3C;         // Change in_data to 3C
        #10;
        en = 0;                  // Disable
        #10;
        in_data = 8'hFF;         // Change in_data to FF while disabled
        #10;
        en = 1;                  // Enable again
        #10;

        // Finish simulation
        #20;
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t | rst_n: %b | en: %b | in_data: %h | out_data: %h", 
                 $time, rst_n, en, in_data, out_data);
    end

endmodule