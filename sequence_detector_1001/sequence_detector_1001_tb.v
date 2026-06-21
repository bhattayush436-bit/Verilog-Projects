module tb2;
reg clk, rst , din;
wire dout;
sequence_detector_1001_overlapping uut (.clk(clk),.rst(rst),.din(din),.dout(dout));
initial begin
clk = 0;
rst = 1;
end
always #5 clk = ~clk;
initial 
begin
#20;
rst = 0;
end
initial 
begin
din = 1;
#10;
din = 0;
#10;
din = 0;
#10;
din = 1;
#10;
din = 1;
#10;
din = 0;
#10;
din = 0;
#10;
din = 1;
#10;
din = 1;
#10;
din = 0;
#10;
din = 0;
#10;
din = 1;
#10;
din = 0;
#10;
din = 0;
#10;
din = 1;
#10;
$finish;
end
initial 
begin
    $monitor("Time=%0t din=%b dout=%b", $time, din, dout);
end

endmodule
