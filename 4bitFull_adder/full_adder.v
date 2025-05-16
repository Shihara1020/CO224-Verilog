module test_bench;

reg[3:0] A_test,B_test;
reg Ci_test;
wire[3:0] S_test;
wire Co_test;

four_bit_adder uut(A_test,B_test,Ci_test,S_test,Co_test);

initial begin
    $monitor("A: %b, B: %b, Cin: %b, Sum: %b, Cout: %b",A_test,B_test,Ci_test,S_test,Co_test);
    $dumpfile("full_adder.vcd");
    $dumpvars(0,test_bench);
    
    // Apply all combinations
    A_test <= 4'b0001; B_test <= 4'b0010; Ci_test = 0;
    #10;

    // A_test = 4'b1101; B_test = 4'b0011; Ci_test = 0;
    // #10;

    // A_test = 4'b1111; B_test = 4'b1111; Ci_test = 1; 
    // #10;

    // A_test = 4'b0101; B_test = 4'b0011; Ci_test = 1; 
    // #10;
    $finish;

end


endmodule

module four_bit_adder (
    input[3:0] A,
    input[3:0] B,
    input Ci,
    output[3:0] S,
    output Co  
);
wire c1,c2,c3;

full_adder FA0(A[0],B[0],Ci,S[0],c1);
full_adder FA1(A[1],B[1],c1,S[1],c2);
full_adder FA2(A[2],B[2],c2,S[2],c3);
full_adder FA3(A[3],B[3],c3,S[3],Co);

    
endmodule

module full_adder(A,B,Ci,S,Co);
input A,B,Ci;
output S,Co;
assign S=A^B^Ci;
assign Co=(A & B) | (A & Ci) | (B & Ci);

endmodule
