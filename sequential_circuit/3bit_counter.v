module counter_3bit(
    input clk,
    input reset,
    output reg [2:0] count  
);
always @(posedge clk,posedge reset ) begin
    if(reset)
        count<=3'b000;
    else 
        count=count+1;
end

endmodule



module test_bench;
reg clk;
reg reset;
wire[2:0] count;
counter_3bit uut(clk,reset,count);

always #5 clk=~clk;

initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0, test_bench);
    $monitor("Time: %0t | Reset: %b | Count: %b", $time, reset, count);

    clk=0;
    reset=1;
    #10;
    reset=0;

    #80

    $finish;
end
endmodule