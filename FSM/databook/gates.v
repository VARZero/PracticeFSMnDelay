// 게이트들

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

