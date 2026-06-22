module tb;
reg clk = 0, rst = 1 , coin_5 = 0, coin_10 = 0;
wire dispense, change;
vending_machine uut(.clk(clk),.rst(rst),.coin_5(coin_5),.coin_10(coin_10),.dispense(dispense),.change(change));
always #5 clk = ~clk;

initial begin
rst = 1;
#10;
rst = 0;
end
initial begin

@(posedge clk);
coin_5 = 1;
@(posedge clk);
coin_5 = 0;
@(posedge clk);
coin_5 = 1;             
@(posedge clk);
coin_5 = 0;
@(posedge clk);
coin_10 = 1;
@(posedge clk);
coin_10 = 0;             
@(posedge clk);
coin_5 = 1;            
@(posedge clk);
coin_5 = 0;
@(posedge clk);
coin_5 = 1;
@(posedge clk);
coin_5 = 0;
@(posedge clk)
coin_5 = 1;
@(posedge clk);
coin_5 = 0;
@(posedge clk);
coin_10 = 1;          
@(posedge clk);
coin_10 = 0;
end
initial begin
#150;
$finish;
end
endmodule

















