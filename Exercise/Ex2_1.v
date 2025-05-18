// D Flip-Flop (Behavioral Modeling)
// Stores the input D on the rising edge of the clock

module D_flip_flop(
    input clk,
    input REST,
    input D,
    output reg Q
) ;

always @(posedge clk)
begin
    if(REST)
        Q<=1'b0;
    else
        Q<=D;
end

endmodule

module test_bench;
    reg clk,rest,d;
    wire Q;
    D_flip_flop uut(clk,rest,d,q);
    
    //Clock generate
    always #5 clk=~clk;

    initial begin
        $dumpfile("d_flip_flop.vcd"); 
        $dumpvars(0, test_bench);

        clk=0;
        rest=1;
        d=0;

        #10
        rest=0;

        d=1;
        #10;
        d=0;
        #10;
        d=1;
        #10;

        #20
        $finish;
        
    end
endmodule