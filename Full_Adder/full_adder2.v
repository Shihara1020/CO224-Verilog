module test_bench;

reg A_test,B_test,Ci_test;
wire S_test,Co_test;

full_adder uut(A_test,B_test,Ci_test,S_test,Co_test);

initial begin
    $monitor("A: %b, B: %b, Cin: %b, Sum: %b, Cout: %b",A_test,B_test,Ci_test,S_test,Co_test);
    $dumpfile("full_adder.vcd");
    $dumpvars(0,test_bench);
    
    // Apply all combinations
    A_test = 0; B_test = 0; Ci_test = 0;
    #10;

    A_test = 0; B_test = 0; Ci_test = 1; 
    #10;

    A_test = 0; B_test = 1; Ci_test = 0; 
    #10;

    A_test = 0; B_test = 1; Ci_test = 1; 
    #10;

    A_test = 1; B_test = 0; Ci_test= 0; 
    #10;

    A_test = 1; B_test = 0; Ci_test = 1; 
    #10;

    A_test = 1; B_test = 1; Ci_test = 0; 
    #10;

    A_test = 1; B_test = 1; Ci_test = 1; 
    #10;
    $finish;

end


endmodule



module full_adder(A,B,Ci,S,Co);



input A,B,Ci;
output S,Co;
assign {Co,S} = A + B + Ci;

endmodule
