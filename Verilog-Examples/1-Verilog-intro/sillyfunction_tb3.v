`timescale 1ns/1ps
module sillyfunction_tb3();
  reg        clk, reset;
  reg        a, b, c, yexpected;
  wire        y;
  reg [31:0] vectornum, errors;    // bookkeeping variables
  reg [3:0]  testvectors[0:10000]; // array of testvectors
  
  // instantiate device under test
  sillyfunction dut(a, b, c, y);
  
  initial begin
    $dumpfile("sillyfunction_tb3.vcd"); 
    $dumpvars;
 end
  // generate clock
  always     // no sensitivity list, so it always executes
    begin
      clk = 1; #5; clk = 0; #5;
    end
// at start of test, load vectors and pulse reset
 
 initial
    begin
      $readmemb("t_vectors.tv", testvectors);
      vectornum = 0; errors = 0;
      reset = 1; #22; reset = 0;
    end


// Note: $readmemh reads testvector files written in
// hexadecimal
// apply test vectors on rising edge of clk
  always @(posedge clk)
    begin
      #1; {a, b, c, yexpected} = testvectors[vectornum];
    end
 // check results on falling edge of clk
   always @(negedge clk)
    if (~reset) begin // skip during reset
      if (y !== yexpected) begin  
        $display("Error: inputs = %b", {a, b, c});
        $display("  outputs = %b (%b expected)",y,yexpected);
        errors = errors + 1;
      end else begin
        $display("Correct: inputs=%b ouput=%b",{a,b,c},{y});
      end

// Note: to print in hexadecimal, use %h. For example,
//       $display(“Error: inputs = %h”, {a, b, c});

// increment array index and read next testvector
      vectornum = vectornum + 1;
      if (testvectors[vectornum] === 4'bx) begin 
          $display("%d tests completed with %d errors", 
                vectornum, errors);
        $finish;
      end
    end
endmodule

// === and !== can compare values that are 1, 0, x, or z.
  
