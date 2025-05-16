module blockingExample(a,b,c,x,y);

input a,b,c;
output reg x,y;
always @(a,b,c) begin
    x=a&b;
    y=x|c;   
end

endmodule

module nonblockingExample(a,b,c,x,y);

input a,b,c;
output reg x,y;
always @(a,b,c) begin
    x<=a&b;
    y<=x|c;   
end

endmodule

module gate_level (a,b,c,x,y);
input a,b,c;
output x,y;
and (x,a,b);
and (y,x,c);
endmodule

module testbench;
reg a,b,c;
wire x,y;

gate_level uu1(a,b,c,x,y);
initial begin
    // t=0 
    a=1'b1;
    b=1'b1;
    c=1'b0;
end


initial begin
    $monitor("t= %2g | a=%b | b=%b | c=%b | x=%b | y=%b",$time,a,b,c,x,y);
    #5 a=1'b0;
    #5 $finish;
end
endmodule