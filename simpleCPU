module SimpleCPU (
    input clk,
    input reset,
    input [7:0] instruction,
    output reg [7:0] acc // Accumulator
);
    // State definitions
    parameter FETCH = 2'b00, DECODE = 2'b01, EXECUTE = 2'b10;

    // Current state
    reg [1:0] state;

    // Instruction fields
    reg [7:0] opcode;
    reg [7:0] operand;

    // ALU output and carry out
    wire [7:0] alu_out;
    wire alu_cout;

    // Control signals for the ALU
    reg [3:0] alu_control;

    // Instantiate the ALU
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
                    // In this example, we have two instructions: ADD and SUB
                    // Let's assume that ADD has an opcode of 4'b0000 and SUB has an opcode of 4'b0001
                    case (opcode)
                        8'b00000000: alu_control <= 4'b0000; // ADD
                        8'b00000001: alu_control <= 4'b0001; // SUB
                        default: alu_control <= 4'b0000; // Default to ADD
                    endcase
                    state <= EXECUTE;
                end

                EXECUTE: begin
                    // Perform the operation using the ALU
                    acc <= alu_out;
                    state <= FETCH;
                end
            endcase
        end
    end
endmodule
