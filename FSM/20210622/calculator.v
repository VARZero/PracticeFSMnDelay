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

module calculator(CLKd, CLKs, rst, Y, C, Of, A, B, Op, S);
    input CLKd, CLKs, rst;
    output [7:0] Y;
    output C, Of;
    input [7:0] A, B;
    input [2:0] Op;

    wire valueEn;
    wire [7:0] ASave, BSave;

    // A 부분을 저장할 공간
    dffrEn IA0Memory(CLKd, rst, A[0], ASave[0], valueEn);
    dffrEn IA1Memory(CLKd, rst, A[1], ASave[1], valueEn);
    dffrEn IA2Memory(CLKd, rst, A[2], ASave[2], valueEn);
    dffrEn IA3Memory(CLKd, rst, A[3], ASave[3], valueEn);
    dffrEn IA4Memory(CLKd, rst, A[4], ASave[4], valueEn);
    dffrEn IA5Memory(CLKd, rst, A[5], ASave[5], valueEn);
    dffrEn IA6Memory(CLKd, rst, A[6], ASave[6], valueEn);
    dffrEn IA7Memory(CLKd, rst, A[7], ASave[7], valueEn);

    // B 부분을 저장할 공간
    dffrEn IB0Memory(CLKd, rst, B[0], BSave[0], valueEn);
    dffrEn IB1Memory(CLKd, rst, B[1], BSave[1], valueEn);
    dffrEn IB2Memory(CLKd, rst, B[2], BSave[2], valueEn);
    dffrEn IB3Memory(CLKd, rst, B[3], BSave[3], valueEn);
    dffrEn IB4Memory(CLKd, rst, B[4], BSave[4], valueEn);
    dffrEn IB5Memory(CLKd, rst, B[5], BSave[5], valueEn);
    dffrEn IB6Memory(CLKd, rst, B[6], BSave[6], valueEn);
    dffrEn IB7Memory(CLKd, rst, B[7], BSave[7], valueEn);
endmodule