//CO224 - verilog Lab: Task 01
// E number - E/21/087


// -----------------------------------
//            AND Unit
// ----------------------------------
module andUnit (A,B,C);
    input[7:0] A;
    input[7:0] B;
    output reg [7:0]C;

    always@(A,B) begin
        C=A&B;    // perform bitwise AND

    end    
endmodule



// -----------------------------------
//            OR Unit
// ----------------------------------
module orUnit(A,B,D);

    input[7:0] A;
    input[7:0] B;
    output reg [7:0] D;

    always@(A,B) begin
        D=A|B; // Perform bitwise OR
    end
    
endmodule


// -----------------------------------
//            8-bit Multiplexer Unit
// ----------------------------------

module muxUnit(C,D,S,Z);
    input [7:0]C;
    input [7:0]D;
    input S;
    output reg [7:0]Z;


    always @(*) begin
        if(S==1'b0)
            Z=C;        // If s=0 ,select AND ouput
        else
            Z=D;        // IF s=1,select OR output
    end

endmodule

// -----------------------------------
//            Logical selector 
// ----------------------------------

module logicalselector(A,B,S,Z);

    input [7:0]A;
    input [7:0]B;
    input S;
    output [7:0]Z;

    wire [7:0]C,D;
        
    // Instantiate AND gate module
    andUnit and_u(A,B,C);
    // Instantiate OR gate module
    orUnit or_u(A,B,D);
    // Instantiate MUX 
    muxUnit mux_u(C,D,S,Z);

endmodule



// -----------------------------------
//            Test bench 
// ----------------------------------
module testbench;
    reg [7:0]A,B;   // 8-bit inputs
    reg S;          // Slector input  
    wire [7:0]Z;   //8- bit ouptut from logical selector


    logicalselector uut(A,B,S,Z);

    initial begin
        $monitor("Time = %0t | A = %08b (%0d), B = %08b (%0d), S = %b => Z = %08b (%0d)", $time, A, A, B, B, S, Z, Z);

        $dumpfile("graphy.vcd");
        $dumpvars(0,testbench);
        
        A=8'b00000010; B=8'b00110110;S=1'b0;
        #5;

        A=8'b00000010; B=8'b00000111;S=1'b0;
        #10;

        A=8'b00000010; B=8'b00001110;S=1'b1;
        #20;

        A=8'b00000010; B=8'b00001110;S=1'b0;
        #25;

        A=8'b00011011; B=8'b00001110;S=1'b0;
        #5;

        $finish;
    end



endmodule