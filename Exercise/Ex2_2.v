module SR_filp_flop(
    input clk,
    input reset,
    input S,R,
    output reg Q
);

always @(posedge clk) begin
    if(reset)
        Q<=0;
    else begin 
        case({S,R})
            2'b00: Q <= Q;
            2'b01: Q <= 0;
            2'b10: Q <= 1;
            2'b11: Q <= 1'bx;

        endcase
    end 
end

endmodule

module test_bench;

    reg clk;
    reg rst;
    reg s, r;
    wire q;

    // Instantiate the SR flip-flop
    SR_filp_flop uut (clk,rst,s,r,q);

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $dumpfile("sr_flip_flop.vcd");
        $dumpvars(0, test_bench);

        // Initialize signals
        clk = 0; rst = 1; s = 0; r = 0;
        #10 rst = 0;

        // Test Set
        s = 1; r = 0; #10;

        // Test Reset
        s = 0; r = 1; #10;

        // Test No Change
        s = 0; r = 0; #10;

        // Test Invalid
        s = 1; r = 1; #10;

        // Finish
        #10;
        $finish;
    end

endmodule
