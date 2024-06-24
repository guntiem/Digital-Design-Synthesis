`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Emiie Gunti, Prabhath N Adireddi
// 
// Create Date: 02/16/2024 02:09:02 PM
// Design Name: 
// Module Name: excess3_behav
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module excess3_behav(

input clk, input rst, input X,
    output reg S, output reg V, output Q
    );
   
    localparam S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b010, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110, S7 = 3'b111;
   
    reg [2:0]Q;
   
   
    always @(negedge clk)begin
    if (~rst) begin
        Q <= S0;
    end else begin
    case (Q)
       S0: begin
            if( X == 1'b0)begin
                S <= 1'b1;
                V <= 1'b0;
                Q = S1;
                end
            else begin
                S <=1'b0;
                V <= 1'b0;
                Q = S2;
                end
        end
       
       S1: begin
             if( X == 1'b0)begin
                S <= 1'b1;
                V <= 1'b0;
                Q = S3;
                end
            else begin
                S <= 1'b0;
                V <= 1'b0;
                Q = S4;
                end
         end  
         
        S2: begin
             if( X == 1'b0)begin
                S <= 1'b0;
                V <= 1'b0;
                Q = S4;
                end
            else begin
                S <= 1'b1;
                V <= 1'b0;
                Q = S4;
                end
          end
         
         S3: begin
             if( X == 1'b0)begin
                S <= 1'b0;
                V <= 1'b0;
                Q = S5;
                end
            else begin
                S <= 1'b1;
                V <= 1'b0;
                Q = S5;
                end
           end
           
          S4: begin
             if( X == 1'b0)begin
                S <= 1'b1;
                V <= 1'b0;
                Q = S5;
                end
            else begin
                S <= 1'b0;
                V <= 1'b0;
                Q = S6;
                end
            end
           
           S5: begin  
             if( X == 1'b0)begin
                S <= 1'b0;
                V <= 1'b0;
                Q = S0;
                end
            else begin
                S <= 1'b1;
                V <= 1'b0;
                Q = S0;
                end  
            end
             
           S6: begin
             if( X == 1'b0)begin
                S <= 1'b1;
                V <= 1'b0;
                Q = S0;
                end
            else begin
                S <= 1'b0;
                V <= 1'b1;
                Q = S0;
                end
           end
           
           S7: begin
               Q = S0;
           end    
           
  endcase
  end
  end
                       
             
       
endmodule
