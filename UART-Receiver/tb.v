module tb;
reg rst , clk, rx;
wire [7:0] data_out;
wire data_valid; 
uart_rx uut (.rx(rx), .clk(clk), .rst(rst), .data_valid(data_valid), .data_out(data_out));
initial begin
clk = 0;
rst = 1;
rx = 1;
end
always #5 clk = ~clk;
initial begin
#10;
rst = 1'b0;
end
initial begin
#200;
rx = 0;
#26080;
rx = 0;
#52070;
rx = 0;
#52070;
rx = 1;
#52070;
rx = 0;
#52070;
rx = 1;
#52070;
rx = 0;
#52070;
rx = 1;
#52070;
rx = 0;
#52070;
rx = 1;
#100;
$finish;
end
endmodule
