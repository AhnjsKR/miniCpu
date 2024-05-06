module ALU(
    input [7:0] a, b,
    output reg [7:0] out,
    input [3:0] op
);
    wire [7:0] add_result, sub_result, and_result, or_result;

    fullAdder_8bit adder(
        .x(a),
        .y(b),
        .cin(1'b0),
        .sum(add_result),
        .cout()
    );
    fullAdder_8bit subtractor(
        .x(a),
        .y(~b),
        .cin(1'b1),
        .sum(sub_result),
        .cout()
    );
    assign and_result = a & b;
    assign or_result = a | b;

    always @* begin
        case(op)
            4'b0000: out = add_result;
            4'b0001: out = sub_result;
            4'b0010: out = and_result;
            4'b0011: out = or_result;
            default: out = 8'b00000000;
        endcase
    end
endmodule
