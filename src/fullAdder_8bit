module fullAdder_8bit(
    input [7:0] x, y,
    input cin,
    output [7:0] sum,
    output cout
);
    wire [7:0] c;
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin
            fullAdder FA_inst (
                .x(x[i]),
                .y(y[i]),
                .cin(i == 0 ? cin : c[i - 1]),
                .cout(c[i]),
                .sum(sum[i])
            );
        end
    endgenerate
    assign cout = c[7]; // Modify this line to access the correct index
endmodule
