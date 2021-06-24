`include "./databook/gate.v"
`include "./circuitEle.v"

module dffrEn(clk, rst, d, q, enable);
    input clk, rst, d, enable;
    output q;

    reg q;
    wire dataW;

    mx2 EnableSel(dataW, q, d, enable);
    dffr EnDFF(clk, rst, dataW, q);
endmodule

module ALU(y, cout, a, b, cin);
    input [3:0] a, b;
    input cin;
    output [3:0] y;
    output cout;

    wire wc0, wc1, wc2;

    fa ADDER1(y[0], wc0, cin, a[0], b[0]);
    fa ADDER2(y[1], wc1, wc0, a[1], b[1]);
    fa ADDER3(y[2], wc2, wc1, a[2], b[2]);
    fa ADDER4(y[3], cout, wc2, a[3], b[3]);
endmodule

module 8to1bShift(in, out);
    input [7:0] in;
    output [7:0] out;

    always @(in) begin
        out[0] <= 0;
        out[1] <= in[0];
        out[2] <= in[1];
        out[3] <= in[2];
        out[4] <= in[3];
        out[5] <= in[4];
        out[6] <= in[5];
        out[7] <= in[6];
    end
endmodule

module calculator(CLKd, CLKs, Y, C, Of, A, B, Op, S);
    input CLKd, CLKs;
    output [7:0] Y;
    output C, Of;
    input [7:0] A, B;
    input [2:0] Op;

endmodule