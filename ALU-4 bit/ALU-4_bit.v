module alu_4bit(
input [3:0] A, B,
input [3:0] sel,
output reg [3:0] result,
output reg carry, borrow 
    );
    always@(*)
    begin
    result = 4'b0000;
    carry = 1'b0;
    borrow = 1'b0;
       case(sel)
         4'b0000: begin
              result = A&B;
         end
         4'b0001: begin
              result  = A|B;
         end
         4'b0010: begin
              result = A^B;
         end
         4'b0011: begin
              result = ~(A^B);
         end
         4'b0100: begin
            result = ~(A&B);
         end
         4'b0101: begin
            result = A>>1;
         end
         4'b0110: begin
            result = A<<1;
         end
         4'b0111: begin
            result = ~A;
         end
         4'b1000: begin
         if(A==B)
         begin
            result = 4'b0001;
         end
         else result = 4'b0000;
         end
         4'b1001: begin
            if(A<B)
         begin
            result = 4'b0001;
         end
         else result = 4'b0000;
         end
         4'b1010: begin
            if(A>B)
         begin
            result = 4'b0001;
         end
         else result = 4'b0000;
         end
         4'b1011: begin
           {carry,result} = A+1;
         end
         4'b1100: begin
            borrow = (A==4'b0000);
            result = A-1;
         end
         4'b1101: begin
            result = ~(A|B);
         end
         4'b1110: begin
             borrow = (A<B);
             result = A-B;
         end
         4'b1111: begin
           {carry,result} = A+B;
         end
         default: begin
            result = 4'b0000;
            borrow = 0;
            carry = 0;
         end
       endcase
    end
endmodule
