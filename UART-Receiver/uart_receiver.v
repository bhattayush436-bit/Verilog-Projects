module uart_rx(
input rx, clk, rst,
output reg  [7:0] data_out,
output reg data_valid 
    );
    reg [12:0] baud_counter = 0;
    reg [2:0] bit_count;
    reg [1:0] state;
    reg [7:0] shift_reg;
    localparam IDLE = 2'b00;
    localparam START = 2'b01;
    localparam DATA = 2'b10;
    localparam STOP = 2'b11;
    always@(posedge clk)
        if (rst) 
        begin
            state <= IDLE;
            bit_count <= 0;
            baud_counter <= 0;
            shift_reg <= 0;
            data_valid <= 0;
        end
        else begin
            case (state)
                IDLE: begin
                    if (rx)
                    begin
                        state <= IDLE;
                        data_valid <= 0;
                        baud_counter <= 0;
                    end
                    else begin
                        state <= START;
                        bit_count <= 0;
                        baud_counter <= 0;
                    end
                end
                START: begin
                    baud_counter <= baud_counter + 1;
                    if (baud_counter == 2608)
                    begin
                       if (rx)
                       begin
                           state <= IDLE;
                           baud_counter <= 0;
                       end
                       else begin
                            state <= DATA;
                            baud_counter <= 0;
                       end
                    end
                end
                DATA: begin
                    baud_counter <= baud_counter + 1;
                    if (baud_counter == 5207)
                    begin
                        if (bit_count == 7)
                        begin
                             state <= STOP;
                             bit_count <= 0;
                             baud_counter <= 0;
                             shift_reg [7] <= rx;
                        end
                        else begin
                             state <= DATA;
                             baud_counter <= 0;
                             shift_reg [bit_count] <= rx;
                             bit_count <= bit_count + 1;
                        end
                    end
                end  
                STOP: begin
                  baud_counter <= baud_counter + 1;
                    if (baud_counter == 5207 )
                    begin
                        if (rx == 1'b1)
                        begin
                            state <= IDLE;
                            data_out <= shift_reg;
                            data_valid <= 1'b1;
                            baud_counter <= 0;
                        end
                        else begin
                            baud_counter <= 0;
                            state <= STOP;
                        end
                    end
                end
                default: begin
                      state <= IDLE;
                      baud_counter <= 0;
                      bit_count <= 0;
                      data_valid <= 0; 
                      data_out <= 0;
                end
            endcase
    end
endmodule
