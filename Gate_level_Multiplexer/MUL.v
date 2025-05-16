module multiplexer (
    input I0, I1, I2, I3, S0, S1,
    output out
);
    wire n0, n1; // for NOT of select lines
    wire w0, w1, w2, w3; // for AND gate outputs

    not (n0, S0);
    not (n1, S1);

    and (w0, I0, n1, n0);  // select 00
    and (w1, I1, n1, S0);  // select 01
    and (w2, I2, S1, n0);  // select 10
    and (w3, I3, S1, S0);  // select 11

    or (out, w0, w1, w2, w3);  // final output

endmodule

module multiplexer_behavioral_modeling (
    input I0, I1, I2, I3, S0, S1,
    output reg out
);
    always @( I0,I1,I2,I3,S0,S1) begin
        if(S0==1'b0 && S1==1'b0)begin
            out=I0; 

        end else if (S0==1'b1 && S1==1'b0) begin
            out=I1;      
        end
        else if (S0==1'b0 && S1==1'b1) begin
            out=I2;
        end
        else if (S0==1'b1 && S1==1'b1) begin
            out=I3;
        end
    end

endmodule



module testBench;

reg i0,i1,i2,i3,s1,s0;
wire out;

multiplexer_behavioral_modeling uut(i0,i1,i2,i3,s0,s1,out);

initial begin
        // Example test values
        i0 = 0; i1 = 1; i2 = 0; i3 = 1;

        s1 = 0; s0 = 0; #10;
        $display("Select=00, Output=%b", out);

        s1 = 0; s0 = 1; #10;
        $display("Select=01, Output=%b", out);

        s1 = 1; s0 = 0; #10;
        $display("Select=10, Output=%b", out);

        s1 = 1; s0 = 1; #10;
        $display("Select=11, Output=%b", out);

        $finish;

end



endmodule