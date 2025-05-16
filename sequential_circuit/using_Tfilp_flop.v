module T_FF(
    input clk,
    input reset,
    input T,
    output reg Q
);
    always @(posedge clk,posedge reset )
    begin
        
        if(reset)
            Q<=1'b0;
        else if(T)
            Q<=~Q;
    end

endmodule


module counter_3bit(
    input clk,
    input reset,
    output[2:0] count
);
    wire Q0, Q1, Q2;

    // Instantiate T flip-flops
    T_FF tff0 (clk, reset, 1'b1, Q0);              // LSB toggles every clock
    T_FF tff1 (Q0, reset, 1'b1, Q1);               // MSB toggles on Q0 edge
    T_FF tff2 (Q1, reset, 1'b1, Q2);               // Top bit toggles on Q1 edge

    assign count = {Q2, Q1, Q0};

endmodule

module testbench;

    reg clk;
    reg reset;
    wire [2:0] count;

    counter_3bit uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    always #5 clk = ~clk;  // Clock generation

    initial begin
        $dumpfile("tff_counter.vcd");
        $dumpvars(0, testbench);
        $monitor("Time: %0t | Reset: %b | Count: %b", $time, reset, count);

        clk = 0;
        reset = 1;  // Apply reset
        #10;
        reset = 0;  // Release reset

        #100;
        $finish;
    end

endmodule
