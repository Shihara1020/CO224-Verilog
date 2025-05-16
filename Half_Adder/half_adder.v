//============================
// Testbench Module
//============================
module testbed;

    reg A_test, B_test;        // Input signals for testing
    wire S_test, C_test;       // Output signals from DUT

    // Instantiate the Design Under Test (DUT)
    half_adder h1 (
        .A(A_test),
        .B(B_test),
        .S(S_test),
        .C(C_test)
    );

    // Apply test values
    initial begin
        $monitor("A_test= %b, B_test= %b, S_test= %b, C_test= %b", A_test, B_test, S_test, C_test);
        
        //plot
        $dumpfile("mavedata.vcd");
        $dumpvars(0,testbed);

        A_test = 0; B_test = 0;
        #5;
        A_test = 1;
        #5;
        A_test = 0; B_test = 1;
        #5;
        A_test = 1;
        #5;

        $finish;
    end

endmodule




//============================
// Half Adder Module
//============================
module half_adder(
    input A, B,
    output S, C
);

    // Logic for half adder
    //using gate level modeling
    xor x1(S, A, B);  //Sum = A XOR B
    and a1(C, A, B);  //Carry = A AND B
    

    //using behavior modelling
    // assign S=A^B;
    // assign C=A&B;

endmodule
