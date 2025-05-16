module mul(
    input [0:3] A,
    input[0:3] B,
    input sel,
    output reg [0:3]out
);

always @(A ,B,sel) begin
    if(sel == 1'b0)
    out=A+B;
    else
    out=A-B;
    
end



endmodule

module testbench;
    reg [3:0] a, b;
    reg sel;
    wire [3:0] out;

    mul uut(a, b, sel, out); // instantiate the unit

    initial begin
        $monitor($time, " a=%d, b=%d, sel=%b -> out=%d", a, b, sel, out);

        a = 4'd7; b = 4'd3; sel = 0; #10;  // 7 + 3 = 10
        a = 4'd7; b = 4'd3; sel = 1; #10;  // 7 - 3 = 4
        a = 4'd5; b = 4'd9; sel = 1; #10;  // 5 - 9 = overflow (negative)
        
        $finish;
    end
endmodule
