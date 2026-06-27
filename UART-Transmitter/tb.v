module tb;
reg [7:0] data_in;
reg tx_start,rst,clk;
wire tx, busy;
UART_tx uut (data_in, clk ,tx_start, rst, tx, busy);
initial begin
data_in = 8'b00000000;
clk = 0;
rst = 1;
tx_start = 0;
end
always #5 clk = ~clk;
initial 
begin
#10;
data_in = 8'b10101010;
#10;
rst = 0;
tx_start = 1;
#10;
tx_start = 0;
end
initial begin
#550000;
$finish; 
end
endmodule
