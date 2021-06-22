`timescale 1ns/100ps

module tb_MWA;
    reg clk, rst, r;
    reg [3:0] tin;
    wire p;

    MicroWaveRange MWA(clk, clk, r, tin, p, rst);

    initial forever #10 clk = ~clk;
    
    initial begin
        $dumpfile("MWA.vcd");
        $dumpvars(-1, MWA);
        #0 clk = 0; rst = 0; r = 0; tin = 4'b0000;
        #5 rst = 5;
        #15 tin = 4'b0100; r = 1;
        #10 tin = 4'b0000;
        #150;
        $finish;
    end
endmodule