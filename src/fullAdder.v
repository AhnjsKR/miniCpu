module fullAdder(
    input x, y, cin,
    output cout, sum
);
    assign sum = x ^ y ^ cin;
    assign cout = (x & y) | (x & cin) | (y & cin);
endmodule
