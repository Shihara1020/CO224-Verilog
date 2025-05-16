module mux(in0, in1, sel, out);
    input in0, in1, sel;
    output reg out;

    always @(in0, in1, sel) begin
        if (sel == 1'b0)
            out = in0;
        else
            out = in1;
    end
endmodule


module testbench;
    reg in0, in1, sel;
    wire out;

    mux uut(in0, in1, sel, out);

    initial begin
        $monitor($time, " in0_t: %b, in1_t: %b, sel_t: %b, out_t: %b", in0, in1, sel, out);
        $dumpfile("wavedata.vcd");
        $dumpvars(0, testbench);

        // Test values
        in0 = 1'b1;
        in1 = 1'b0;
        sel = 1'b0;

        #10 sel = 1'b1;
        #10 in0 = 1'b0;
        #10 $finish;
    end
endmodule
