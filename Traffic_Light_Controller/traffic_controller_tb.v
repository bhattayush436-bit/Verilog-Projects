module tb;
reg clk = 0, rst = 1, din = 0;
wire dout = 0;
traffic_light uut (.clk(clk),.rst(rst),.din(din),.dout(dout));
always #5 clk = ~clk;
initial begin
#10 rst = ~rst;
end
initial begin
#15;
din = 1;
#15;
din = 1;
#15;
din = 1;
#15;
din = 1;
#15;
din = 1;
#15;
din = 1;
#15;
din = 1;
#15;
din = 1;
end
initial begin
#150;
$finish;
end    
endmodule
