module sr_latch(Q,Qbar,Sbar,Rbar);
output Q,Qbar;
input Sbar,Rbar;

nand n1(Q,Sbar,Qbar);
nand n2(Qbar,Rbar,Q);

endmodule


module sr_latch_tb;
reg set,reset;
wire q,qbar;
//feed invert set and reset signals to the SR latch
sr_latch uut(q,qbar,~set,~reset);

initial begin
    $monitor($time,"set= %b,reset=%b,q=%b,qn=%b",set,reset,q,qbar);
    set=0;reset=0;
    #5
    reset=1;
    #5
    reset=0;
    #5
    set=1;  
end

endmodule
