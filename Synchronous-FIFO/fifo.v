module fifo(
input clk,rst,
input wr_en, rd_en,
input [7:0] data_in,
output reg [7:0] data_out,
output reg full, empty
    );
    reg [7:0] memory [0:7]; 
    reg [2:0] wr_ptr;
    reg [2:0] rd_ptr;
    reg [3:0] count;
    always@(*) 
    begin
        if (count == 8)
        begin
             full<= 1;
             empty <= 0; 
         end
         else if (count == 0)
        begin
             full<= 0;
             empty <= 1;    
        end
          else 
        begin
             full<= 0;
             empty <= 0;    
        end
    end
    always@(posedge clk)
    begin
        if (rst == 1)
        begin
            data_out <= 0;
            wr_ptr <= 0;
            rd_ptr <= 0;
            count <= 0;
        end
        else begin
             if (wr_en && !full && !rd_en)
            begin
                memory [wr_ptr] <= data_in;
                wr_ptr <= wr_ptr + 1;
                count <= count + 1;
            end
            else if (rd_en && !empty && !wr_en)
            begin
                data_out <= memory [rd_ptr];
                count <= count - 1;
                rd_ptr <= rd_ptr + 1;
            end
            else if (wr_en && rd_en)
            begin
                if (full)
                begin
                data_out <= memory [rd_ptr];
                rd_ptr <= rd_ptr + 1; 
                count <= count - 1;
                end
                else if (empty)
                begin
                    memory [wr_ptr] <= data_in;
                    wr_ptr <= wr_ptr + 1;
                    count <= count + 1;
                end
                else 
                begin
                    memory [wr_ptr] <= data_in;
                    wr_ptr <= wr_ptr + 1;
                    data_out <= memory [rd_ptr];
                    rd_ptr <= rd_ptr + 1;             
                end
            end
        end
    end
endmodule
