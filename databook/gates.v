// 게이트 모음

// BUF
module bf(y, a);
    input a;
    output y;

    assign y = a;
endmodule

// NOT
module iv(y, a);
    input a;
    output y;

    assign y = ~a;
endmodule

// ANDs
// 2-input and
module ad2(y, a, b);
    input a, b;
    output y;

    assign y = a & b;
endmodule

// 3-input and
module ad3(y, a, b, c);
    input a, b, c;
    output y;

    assign y = a & b & c;
endmodule

// 4-input and
module ad4(y, a, b, c, d);
    input a, b, c, d;
    output y;

    assign y = a & b & c & d;
endmodule

// 5-input and
module ad5(y, a, b, c, d, e);
    input a, b, c, d, e;
    output y;

    assign y = a & b & c & d & e;
endmodule

// 6-input and
module ad6(y, a, b, c, d, e, f);
    input a, b, c, d, e, f;
    output y;

    assign y = a & b & c & d & e & f;
endmodule

// 7-input and
module ad7(y, a, b, c, d, e, f, g);
    input a, b, c, d, e, f, g;
    output y;

    assign y = a & b & c & d & e & f & g;
endmodule

// NANDs
// 2-input nand
module nd2(y, a, b);
    input a, b;
    output y;

    assign y = ~(a & b);
endmodule

// 3-input nand
module nd3(y, a, b, c);
    input a, b, c;
    output y;

    assign y = ~(a & b & c);
endmodule

// 4-input nand
module nd4(y, a, b, c, d);
    input a, b, c, d;
    output y;

    assign y = ~(a & b & c & d);
endmodule

// 5-input nand
module nd5(y, a, b, c, d, e);
    input a, b, c, d, e;
    output y;

    assign y = ~(a & b & c & d & e);
endmodule

// 6-input nand
module nd6(y, a, b, c, d, e, f);
    input a, b, c, d, e, f;
    output y;

    assign y = ~(a & b & c & d & e & f);
endmodule

// 7-input nand
module nd7(y, a, b, c, d, e, f, g);
    input a, b, c, d, e, f, g;
    output y;

    assign y = ~(a & b & c & d & e & f & g);
endmodule

// ORs
// 2-input or
module or2(y, a, b);
    input a, b;
    output y;

    assign y = a | b;
endmodule

// 3-input or
module or3(y, a, b, c);
    input a, b, c;
    output y;

    assign y = a | b | c;
endmodule

// 4-input or
module or4(y, a, b, c, d);
    input a, b, c, d;
    output y;

    assign y = a | b | c | d;
endmodule

// 5-input or
module or5(y, a, b, c, d, e);
    input a, b, c, d, e;
    output y;

    assign y = a | b | c | d | e;
endmodule

// 6-input or
module or6(y, a, b, c, d, e, f);
    input a, b, c, d, e, f;
    output y;

    assign y = a | b | c | d | e | f;
endmodule

// 7-input or 
module or7(y, a, b, c, d, e, f, g);
    input a, b, c, d, e, f, g;
    output y;

    assign y = a | b | c | d | e | f | g;
endmodule

// NORs
// 2-input nor
module nr2(y, a, b);
    input a, b;
    output y;

    assign y = ~(a | b);
endmodule

// 3-input nor
module nr3(y, a, b, c);
    input a, b, c;
    output y;

    assign y = ~(a | b | c);
endmodule

// 4-input nor
module nr4(y, a, b, c, d);
    input a, b, c, d;
    output y;

    assign y = ~(a | b | c | d);
endmodule

// 5-input nor
module nr5(y, a, b, c, d, e);
    input a, b, c, d, e;
    output y;

    assign y = ~(a | b | c | d | e);
endmodule

// 6-input nor
module nr6(y, a, b, c, d, e, f);
    input a, b, c, d, e, f;
    output y;

    assign y = ~(a | b | c | d | e | f);
endmodule

// 7-input nor 
module nr7(y, a, b, c, d, e, f, g);
    input a, b, c, d, e, f, g;
    output y;

    assign y = ~(a | b | c | d | e | f | g);
endmodule

// TRISTATE BUFFER
// inverting tri-buf
module it(y, a, e);
    input a, e;
    output y;

    assign y = (e==1'b0) ? z : (a==1'b0) ? 1 : 0;
endmodule

// inverting enable tri-buf
module ite(y, a, e);
    input a, e;
    output y;

    assign y = (e==1'b1) ? z : (a==1'b0) ? 1 : 0;
endmodule

// non-inverting tri-buf
module nit(y, a, e);
    input a, e;
    output y;

    assign y = (e==1'b0) ? z : (a==1'b0) ? 0 : 1;
endmodule

// non-inverting enable tri-buf
module nite(y, a, e);
    input a, e;
    output y;

    assign y = (e==1'b1) ? z : (a==1'b0) ? 0 : 1;
endmodule

// D FLIP-FLOP
// dff
module dff(clk, d, q);
    input clk, d;
    output q;

    reg q;

    always @(posedge clk) begin
        q <= d;
    end
endmodule

// dffr
module dffr(clk, rst, d, q);
    input clk, rst, d;
    output q;

    reg q;

    always @(posedge clk or negedge rst) begin
        if (rst == 1'b0) q <= 1'b0;
        else q <= d;
    end
endmodule

// dffrs
module dffrs(clk, st, rst, d, q);
    input clk, st, rst, d;
    output q;

    reg q;

    always @(posedge clk or negedge st or negedge rst) begin
        if (rst == 1'b0) q <= 1'b0;
        else if (st == 1'b0) q <= 1'b1;
        else q <= d;
    end
endmodule