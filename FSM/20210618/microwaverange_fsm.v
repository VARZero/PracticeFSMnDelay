`include "../../circuitEle.v"

module counter(y, a, b, cin);
    input [3:0] a, b;
    input cin;
    output [3:0] y;

    wire wc0, wc1, wc2, ws;

    fa ADDER1(y[0], wc0, cin, a[0], b[0]);
    fa ADDER2(y[1], wc1, wc0, a[1], b[1]);
    fa ADDER3(y[2], wc2, wc1, a[2], b[2]);
    // 여기서 사용하는 카운터의 4번째 ADDER은 합 값만 출력하기 때문에 carry값이 없습니다. (=xor로만 구성)
    xr2 ADDER4_1(ws, a[3], b[3]);
    xr2 ADDER4_2(y[3], ws, wc2);
endmodule

module MicroWaveRange(clk1, clk2, r, tin, p, rst);
    input [3:0] tin;
    input clk1, clk2, r, rst;
    output p;

    wire [3:0] w1, w2, w3;
    wire w4, w5;

    mx2b4 SUNSUBSEL(w1, tin, 4'b0001, p);
    counter TIMER(w3, w2, w1, p);
    dffr TIMERMEM(clk1, rst, w3, w2);
    nd4 CHECKZERO(w4, w2[0], w2[1], w2[2], w2[3]);
    ad2 RUNCHECK(w5, r, w4);
    dffr STATE(clk2, rst, w5, p);
endmodule
