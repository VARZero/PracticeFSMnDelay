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
module mx2(y, a, b, s);
    input [3:0] a, b;
    input s;
    output y;

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

// RIPPLE CARRY
// half-adder
module ha(y, cout, a, b);
    input a, b;
    output y, cout;

    

// full-adder