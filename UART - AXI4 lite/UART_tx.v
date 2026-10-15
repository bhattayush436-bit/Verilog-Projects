module UART_tx(
input [7:0] data_in,
input clk, tx_start,rst,
output reg tx, busy
    );
    reg [1:0] state;
    parameter IDLE = 2'b00; 
    parameter START = 2'b01; 
    parameter DATA = 2'b10;
    parameter STOP = 2'b11; 
    reg [12:0] baud_counter;
    reg [7:0] shift_reg;
    reg [2:0] bit_count;
    always@(posedge clk)
    begin
        if(rst)
            begin
            state<=IDLE;
            baud_counter <= 0;
            busy <= 0;
            tx <= 1;
            bit_count<=0;
            shift_reg <= 8'b00000000; 
            baud_counter <= 0;
            end
        else
            begin
            case (state)
                IDLE: begin
                    if (tx_start)
                    begin
                        state <= START;
                        shift_reg <= data_in;
                        tx <= 1;
                        busy <= 1;
                        bit_count <= 0;
                        baud_counter <= 0;
                    end
                    else 
                    begin
                        busy <= 0;
                        tx <= 1;
                    end
                end
                START: begin
                        tx <= 0;
                        baud_counter <= baud_counter + 1;
                            if(baud_counter == 5207) 
                            begin
                                 baud_counter <= 0;
                                 state <= DATA;
                            end
                end
                DATA: begin
                        tx <= shift_reg[0];
                        baud_counter <= baud_counter + 1;
                            if (baud_counter == 5207)
                                begin
                                baud_counter <= 0;
                                if (bit_count == 3'd7)
                                    begin
                                    state <= STOP;
                                    bit_count <= 0;
                                end
                                else begin
                                    bit_count <= bit_count + 1;
                                    shift_reg <= shift_reg >> 1;
                                end
                            end    
                end
                STOP: begin
                       tx <= 1;
                       baud_counter <= baud_counter + 1;
                       if (baud_counter == 5207)
                        begin
                        baud_counter <= 0;
                        state <= IDLE;
                        busy <= 0;
                        end
                end
                default : state <= IDLE;
            endcase
            end    
    end
endmodule
