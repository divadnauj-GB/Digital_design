module trafic_lights_tb;

reg w_sa1;
reg w_sa2;
reg w_sb1;
reg w_sb2;


reg [3:0] test_data[0:16];

integer idx;
initial begin
    for(idx=0;idx<=16;idx=idx+1) begin
        test_data[idx]=idx;
    end
end


trafic_lights dut(
                .sa1(w_sa1),
                .sa2(w_sa2),
                .sb1(w_sb1),
                .sb2(w_sb2),
                .r(w_r),
                .o(w_o),
                .g(w_g));

integer i;
initial begin
    $dumpfile("trafic_lights_tb.vcd"); 
    $dumpvars (0,trafic_lights_tb);

    for(i=0;i <= 16;i=i+1) begin
        #10 {w_sa1,w_sa2,w_sb1,w_sb2} = test_data[i];
    end
    $display("Simulation finished!");
    $finish;
end



endmodule