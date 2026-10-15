module tb;

//UART Transmitter Interface

reg clk;
reg rst;
wire tx; 
wire busy;  

//UART Reciever Interface

wire rx;
wire [7:0] data_out;
wire data_valid;

// Write Address Channel

reg [31:0] awaddr;
reg awvalid;
wire awready;

// Write Data Channel

reg [31:0] wdata;
reg wvalid;
wire wready;

// Write response Channel

wire [1:0] bresp;
wire bvalid;
reg  bready;

//Read Address Channel

reg [31:0] araddr;
reg arvalid;
wire arready;

//Read Data Channel

wire [31:0] rdata;
wire rvalid;
reg rready;
wire [1:0] rresp;
wire [7:0] rx_data;
wire rx_data_valid;

axi_slave_uart uut(.clk(clk),
                   .rst(rst),
                   .bresp(bresp),
                   .bvalid(bvalid),
                   .bready(bready),
                   .wready(wready),
                   .wvalid(wvalid),
                   .wdata(wdata),
                   .awaddr(awaddr),
                   .awready(awready),
                   .awvalid(awvalid),
                   .araddr(araddr),
                   .arvalid(arvalid),
                   .arready(arready),
                   .rdata(rdata),
                   .rvalid(rvalid),
                   .rready(rready),
                   .rresp(rresp),
                   .tx(tx),
                   .busy(busy),
                   .rx(rx),
                   .data_out(data_out),
                   .data_valid(data_valid));

assign rx = tx;

always #5 clk = ~clk;
initial begin
clk = 1'b0;
rst = 1'b1;
awaddr = 32'd0;
awvalid = 1'b0;
wdata = 32'd0;
wvalid = 1'b0;
bready = 1'b0;

#20;
rst = 1'b0;
end

//Write Address Logic

initial begin
#20;
@(negedge clk);
awaddr = 32'h00000000;
awvalid = 1'b1;
@(posedge clk);//awready enable
@(posedge clk); //for handshake
@(negedge clk);
awvalid = 1'b0;
end

//Write Data Logic

initial begin
#40;
@(negedge clk);
wdata = 32'h0000055;
wvalid = 1'b1;
@(posedge clk); //wready enable
@(posedge clk); //for handshake
@(negedge clk);
wvalid = 1'b0;
end

//Write Response Logic

initial begin
#60;
@(negedge clk);
bready = 1'b1;
@(posedge clk);
@(negedge clk);
bready = 1'b0;
end

//Read Address Channel Logic

//initial begin
//#100;
//@(negedge clk);
//araddr = 32'h00000004;
//arvalid = 1'b1;
//@(posedge clk);
//@(posedge clk);
//@(negedge clk);
//arvalid = 1'b0;
//end


initial begin
    wait (data_valid == 1'b1);

    @(negedge clk);
    araddr  = 32'h00000004;
    arvalid = 1'b1;

    @(posedge clk);
    while (arready !== 1'b1)
        @(posedge clk);

    @(negedge clk);
    arvalid = 1'b0;
end

//Read Data Channel Logic

//initial begin
//#130;
//@(negedge clk);
//rready = 1'b1;
//@(posedge clk);
//@(posedge clk);
//@(negedge clk);
//rready = 1'b0;
//end
initial begin
    rready = 1'b0;

    wait (rvalid == 1'b1);

    @(negedge clk);
    rready = 1'b1;

    @(posedge clk);  // Complete the handshake

    @(negedge clk);
    rready = 1'b0;
end
endmodule
