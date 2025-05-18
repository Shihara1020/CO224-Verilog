//  Using SR Latch to Build a D Flip-Flop
module d_filp_flop(
    input clk,
    input D,
    output reg q,
    output q_bar
);

reg s,r;

assign q_bar=~q;

always@(posedge clk) begin
    s=clk &  D;
    r=clk & ~D;

    case({s,r})
        2'b00 : q<=q;
        2'b01 : q<=0;
        2'b10 : q<=1;
        2'b11 : q<=1'bx;
    endcase
end

endmodule

module test_bench;
reg clk;
reg d;
wire q,q_bar;

d_filp_flop uut(clk,d,q,q_bar);
//Clock generate
always #5 clk=~clk;

initial begin
    $dumpfile("d_ff.vcd");
    $dumpvars(0,test_bench);
    clk=0;
    d = 1; #10;
    d = 0; #10;
    d = 1; #10;
    d = 1; #10;
    d = 0; #10;
    d = 1; #10;

    #20;
    $finish;
end
endmodule


