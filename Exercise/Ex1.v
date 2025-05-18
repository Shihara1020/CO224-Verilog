module testbench;

    reg clk, reset;
    wire [1:0] q;

    // Instantiate the counter
    two_bit_counter uut(clk, reset, q);

    // Clock generation
    always #5 clk = ~clk;  // 10 time unit period

    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, testbench);
        $display("Time=%0t | Counter = %b", $time, q);

        clk = 0;
        reset = 1;       // Apply reset
        #10;
        reset = 0;       // Release reset

        // Observe for several clock cycles
        repeat (10) begin
            #10;
            $display("Time=%0t | Counter = %b", $time, q);
        end

        $finish;
    end

endmodule



module two_bit_counter (
    input clk,
    input reset,
    output [1:0] q
);
    wire q0, q1;
    wire q0_bar, q1_bar;

    d_ff ff0(clk, reset, q0_bar, q0, q0_bar);         // Toggled every clock
    d_ff ff1(q0, reset, q1_bar, q1, q1_bar);           // Toggled on q0 rising

    assign q = {q1, q0};

endmodule



module d_ff (
    input clk,
    input reset,
    input D,
    output reg Q,
    output Q_bar
);
    assign Q_bar = ~Q;

    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 1'b0;
        else
            Q <= D;
    end
endmodule

