`timescale 1ns / 1ps

module SimpleCPU_tb;
    reg clk;
    reg reset;
    reg [7:0] instruction;
    wire [7:0] acc;

    SimpleCPU uut (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .acc(acc)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        reset = 0;
        instruction = 8'b0;

        reset = 1;
        #10 reset = 0;

        instruction = 8'b00000001; // ADD
        #30; // Increased delay to ensure acc is updated properly
        if (acc == 1)
            $display("Test passed!");
        else
            $display("Test failed!");

        instruction = 8'b00010001; // SUB
        #30; // Increased delay to ensure acc is updated properly
        if (acc == 0)
            $display("Test passed!");
        else
            $display("Test failed!");

        $finish;
    end
endmodule
