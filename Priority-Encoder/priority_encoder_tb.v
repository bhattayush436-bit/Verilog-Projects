module tb;
reg [7:0] in;
wire [2:0] dout;
pencoder8x3 dut(.in(in), .dout(dout));
initial begin
in = 8'b11111111;
end
initial
begin
#10;
in = 8'b00100000;
#10;
in = 8'b00100100;
#10;
in = 8'b01000000;
#10;
in = 8'b00100100;
#10;
$finish;
end
endmodule
