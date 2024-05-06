module SimpleCPU_tb;
    reg clk;
    reg reset;
    reg [7:0] instruction;
    wire [7:0] acc;

    // Instantiate the SimpleCPU module
    SimpleCPU uut (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .acc(acc)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Testbench
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        instruction = 8'b0;

        // Apply reset
        reset = 1;
        #10 reset = 0;

        // Test ADD instruction
        instruction = 8'b00000001; // opcode = 0000 (ADD), operand = 0001
        #10;

        // Check result
        if (acc == 1)
            $display("Test passed!");
        else
            $display("Test failed!");

        // Test SUB instruction
        instruction = 8'b00010001; // opcode = 0001 (SUB), operand = 0001
        #10;

        // Check result
        if (acc == 0)
            $display("Test passed!");
        else
            $display("Test failed!");

        // End simulation
        $finish;
    end
endmodule
