module tb;

    reg clk, rst;
    reg [7:0] data_in;
    reg wr_en, rd_en;

    wire [7:0] data_out;
    wire full, empty;

    fifo dut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    initial begin
        clk   = 0;
        rst   = 1;
        wr_en = 0;
        rd_en = 0;

        #10;
        rst = 0;
    end

    always #5 clk = ~clk;

    initial begin

        #10;
        wr_en   = 1;
        data_in = 8'd4;
        rd_en   = 0;

        #10;
        rd_en = 1;
        wr_en = 0;

        #10;
        wr_en   = 1;
        data_in = 8'd5;
        rd_en   = 0;

        #10;
        rd_en   = 0;
        wr_en   = 1;
        data_in = 8'd6;

        #10;
        rd_en   = 0;
        wr_en   = 1;
        data_in = 8'd7;

        #10;
        wr_en   = 1;
        rd_en   = 0;
        data_in = 8'd8;

        #10;
        rd_en = 1;
        wr_en = 0;

        #10;
        rd_en   = 1;
        wr_en   = 1;
        data_in = 8'd9;

        #10;
        wr_en   = 1;
        rd_en   = 0;
        data_in = 8'd10;

        #10;
        wr_en   = 1;
        rd_en   = 0;
        data_in = 8'd11;

        #10;
        wr_en   = 1;
        rd_en   = 0;
        data_in = 8'd12;

        #10;
        wr_en   = 1;
        rd_en   = 0;
        data_in = 8'd13;

        #10;
        wr_en   = 1;
        rd_en   = 0;
        data_in = 8'd14;

        #15;
        $finish;

    end

endmodule
