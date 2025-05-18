//CO224 - verilog Lab: Task 02
// E number - E/21/087



// -----------------------------------
//            Counter
// -----------------------------------

module four_bit_counter(clk,Enable,Reset,count);

input clk;
input Enable;
input Reset;
output reg [3:0]count;

//Always bloock triggered on rising edge
always @(posedge clk) begin
    if(Reset)
        count<=4'b0000;   // Reset the count
    else if(Enable)
        count<=count+1;   //increment the count
end
endmodule



// -----------------------------------
//            Test bench 
// -----------------------------------


module test_bench;

reg clk,reset,enable;
wire [3:0] count;

four_bit_counter uut(clk,enable,reset,count);


//clock generation
initial begin
    clk=0;
    forever #5 clk=~clk;
end

initial begin
    // Reset the counter
    reset=1;
end

initial begin
    $monitor("Time = %0t | reset = %b | enable = %b => count = %b (%0d)", $time,reset, enable, count, count);
    $dumpfile ("task2.vcd"); 
    $dumpvars(0,test_bench);

    #10
    reset=0;         // Deassert reset
    enable=1;        // Enable counting

    #50
    enable=0;        // Pause counting

    #20
    enable=1;        // Resume counting

    #30
    reset=1;         // Reset counting

    #10;
    reset=0;         // Deassert reset

    #20;
    $finish;
end

    
endmodule
