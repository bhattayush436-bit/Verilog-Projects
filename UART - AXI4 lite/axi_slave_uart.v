module axi_slave_uart(

//UART Transmitter Interface

input clk,
input rst,
output tx, 
output busy,

//UART Receiver Interface

input rx,
output wire [7:0] data_out,
output wire data_valid,

// Write Address Channel

input [31:0] awaddr,
input awvalid,
output reg awready,

// Write Data Channel

input [31:0] wdata,
input wvalid,
output reg wready,

// Write response Channel

output reg [1:0] bresp,
output reg bvalid,
input  bready,

// Read Address Channel

input [31:0] araddr,
input arvalid,
output reg arready,

// Read Data Channel

input rready,
output reg [31:0] rdata,
output reg rvalid,
output reg [1:0] rresp
    );
    reg tx_start;
    wire rx_data_valid;
    wire [7:0] rx_data;
    reg [31:0] write_addr_reg; //for storing addr
    reg [31:0] write_data_reg; //for storing data
    reg [31:0] read_data_reg;  //for reading data
    reg [31:0] read_addr_reg;  //for reading address
    reg [7:0] rx_data_reg;
    reg write_addr_rcvd;
    reg write_data_rcvd;
    reg read_addr_rcvd;
    reg tx_started; //used to check whether the transmission started or not.
    wire ar_handshake;
    wire r_handshake;
    wire aw_handshake;
    wire b_handshake;
    wire w_handshake;
    
    assign ar_handshake = arvalid && arready;
    assign r_handshake = rvalid && rready;
    assign aw_handshake = awvalid && awready;
    assign w_handshake = wvalid && wready;
    assign b_handshake = bvalid && bready;
    
    localparam okay = 2'b00;
    localparam error = 2'b11; 
    
    //tx instantiation
    
    UART_tx dut(.clk(clk),
     .rst(rst), 
     .data_in(write_data_reg [7:0]), 
     .busy(busy), 
     .tx(tx),
     .tx_start(tx_start));
     
     //rx instantiation
     
    uart_rx lut(
    .clk(clk),
    .rst(rst),
    .rx(rx),
    .data_out(data_out),
    .data_valid(data_valid)
);
    //Write Address Logic
    
    always@(posedge clk)
    begin
        if(rst) begin
        write_addr_rcvd <= 1'b0;
        awready <= 1'b0;
        write_addr_reg <= 32'h00000000;
        end
        else 
        begin
            awready <= 1'b1;
            if(aw_handshake) 
            begin
                write_addr_reg <= awaddr;
                write_addr_rcvd <= 1'b1;          
                awready <= 1'b0;
            end 
        end
        
    // Write Data Channel logic
    
        if (rst)
        begin
            wready <= 1'b0;
            write_data_rcvd <= 1'b0;
        end
        else 
        begin
            wready <= 1'b1;
            if (w_handshake)
            begin
                write_data_reg <= wdata;
                write_data_rcvd <= 1'b1;
                wready <= 1'b0;
            end
        end
    
    
    // Write Response Channel Logic
    
        if (rst)
        begin
            bresp <= okay;
            bvalid <= 1'b0;
            tx_start <= 1'b0;
            tx_started <= 1'b0;
        end
        else 
        begin
        tx_start <= 1'b0;

            if (write_addr_rcvd && write_data_rcvd &&
                write_addr_reg == 32'h00000000 && !tx_started) 
                begin
                        tx_start   <= 1'b1;
                        tx_started <= 1'b1;
                        bvalid <= 1'b1;
                 end
            if (b_handshake) 
                begin
                        bvalid<= 1'b0;
                        write_addr_rcvd <= 1'b0;
                        write_data_rcvd <= 1'b0;
                        tx_started <= 1'b0;
                end
        end
    
    //Read Address Channel Logic
    
        if (rst)
        begin
            arready <= 1'b0;
            read_addr_reg <= 32'h00000000;
            read_addr_rcvd <= 1'b0;
        end
        else 
        begin
            arready <= 1'b1;
            if (ar_handshake)
            begin
                read_addr_rcvd <= 1'b1;
                read_addr_reg <= araddr;
            end
        end
        if (data_valid)
        begin
            rx_data_reg <= data_out;
        end
    
    //Read Data Channel Logic
    
        if (rst)
        begin
            rvalid <= 1'b0;
            rresp <= error;
        end
        else 
        begin
                if (r_handshake)
                begin
                    rvalid <= 1'b0;
                    read_addr_rcvd <= 1'b0;
                end
            else if (!rvalid && read_addr_rcvd && read_addr_reg == 32'h00000004)
            begin
                rvalid <= 1'b1;
                rdata <= {24'b0,rx_data_reg};
                rresp <= okay;
            end
        end
    end
endmodule
