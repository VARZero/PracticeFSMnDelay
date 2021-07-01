`include "./databook/gate.v"
`include "./circuitEle.v"

module ALUb8(y, cout, a, b, cin);
    input [7:0] a, b;
    input cin;
    output [7:0] y;
    output cout;

    wire wc0, wc1, wc2, wc3, wc4, wc5, wc6;

    fa ADDER1(y[0], wc0, cin, a[0], b[0]);
    fa ADDER2(y[1], wc1, wc0, a[1], b[1]);
    fa ADDER3(y[2], wc2, wc1, a[2], b[2]);
    fa ADDER4(y[3], wc3, wc2, a[3], b[3]);
    fa ADDER1(y[4], wc4, wc3, a[4], b[4]);
    fa ADDER2(y[5], wc5, wc4, a[5], b[5]);
    fa ADDER3(y[6], wc6, wc5, a[6], b[6]);
    fa ADDER4(y[7], cout, wc6, a[7], b[7]);
endmodule

module ShifterRegister(Y, A, clk, rst);
    input [7:0] A;
    input rst;
    output [7:0] Y;

    dffr Register0(clk, rst, 1'b0, Y[0]);
    dffr Register1(clk, rst, A[0], Y[1]);
    dffr Register1(clk, rst, A[1], Y[2]);
    dffr Register1(clk, rst, A[2], Y[3]);
    dffr Register1(clk, rst, A[3], Y[4]);
    dffr Register1(clk, rst, A[4], Y[5]);
    dffr Register1(clk, rst, A[5], Y[6]);
    dffr Register1(clk, rst, A[6], Y[7]);
endmodule

module multiplier(CLK, rst, A, B, pdt, div, Y, fin);
    input CLK, rst, pdt, div; // 클럭, 리셋, 곱셈 선택, 나눗셈 선택
    input [7:0] A, B; // 입력 두개
    output fin; // 끝난지 여부 확인
    output [7:0] Y; // 출력 하나

    //
endmodule