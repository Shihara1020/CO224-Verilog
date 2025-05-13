module testbed;
  reg A_test, B_test;
  wire C_test;

  // Instantiate the AND_gate module
  AND_gate uut (
    .A(A_test),
    .B(B_test),
    .C(C_test)
  );

  initial begin
    $monitor("A : %b , B : %b , C : %b", A_test, B_test, C_test);

    $dumpfile("And.vcd");      // Changed from ".vecd" to ".vcd" (standard file extension)
    $dumpvars(0, testbed);

    A_test = 0;
    B_test = 0;
    #5;

    A_test = 1;
    #5;

    A_test = 0;
    B_test = 1;
    #5;

    A_test = 1;
    #5;

    $finish;
  end
endmodule

// AND gate module
module AND_gate(input A, input B, output C);
  and u1(C,A,B);
endmodule
