module SimpleCPU(
    input clk,
    input reset,
    input [7:0] instruction,
    output reg [7:0] acc
);
    parameter FETCH = 2'b00, DECODE = 2'b01, EXECUTE = 2'b10;
    reg [1:0] state;
    reg [7:0] opcode, operand;
    wire [7:0] alu_out;
    wire alu_cout;
    reg [3:0] alu_control;

    ALU alu (
        .a(opcode),
        .b(operand),
        .op(alu_control),
        .out(alu_out)
    );

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= FETCH;
            acc <= 8'b0;
        end else begin
            case (state)
                FETCH: begin
                    opcode <= instruction[7:4];
                    operand <= instruction[3:0];
                    state <= DECODE;
                end

                DECODE: begin
                    case (opcode)
                        4'b0000: alu_control <= 4'b0000; // ADD
                        4'b0001: alu_control <= 4'b0001; // SUB
                        default: alu_control <= 4'b0000; // Default to ADD
                    endcase
                    state <= EXECUTE;
                end

                EXECUTE: begin
                    acc <= alu_out;
                    state <= FETCH;
                end
            endcase
        end
    end
endmodule
