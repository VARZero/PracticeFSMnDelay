// databook이외의 회로 요소들

`include "./databook/gates.v"

// MUXs
// 2-to-1 mux (1bit)
module mx2(y, a, b, s);
    input a, b, s;
    output y;

    wire w1, w2, w3;

    Not iv(w1, s);
    Mtop nit(w2, a, w1);
    Mbot it(w3, b, s);
    if (w2==1'bz) y = w3;
    else if (w3==1'bz) y = w2;
endmodule

// 2-to-1 mux (4bit)
module mx2b4(y, a, b, s);
    input [3:0] a, b;
    input s;
    output [3:0] y;

    wire w1;
    wire [3:0] w2, w3;

    Not iv(w1, s);
    Mtop nit(w2[0], a[0], w1);
    Mtop nit(w2[1], a[1], w1);
    Mtop nit(w2[2], a[2], w1);
    Mtop nit(w2[3], a[3], w1);
    Mbot it(w3[0], b[0], s);
    Mbot it(w3[1], b[1], s);
    Mbot it(w3[2], b[2], s);
    Mbot it(w3[3], b[3], s);
    if (w2==1'bz) y = w3;
    else if (w3==1'bz) y = w2;
endmodule

// RIPPLE CARRY ADDER
// half-adder
module ha(y, cout, a, b);
    input a, b;
    output y, cout;

    SUM xr2(y, a, b);
    CARRY ad2(cout, a, b);
endmodule

// full-adder
module fa(y, cout, cin, a, b);
    input a, b, cin;
    output y, cout;

    wire w1, wc1, wc2;

    ADD ha(w1, wc1, a, b);
    CARRYADD ha(y, wc2, w1, cin);
    CARRYCH or2(cout, wc1, wc2);
endmodule