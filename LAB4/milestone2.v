`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2024 03:28:35 PM
// Design Name: 
// Module Name: milestone2
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


module milestone2(bcd, dot, clk, cathode, anode);
    input [15:0] bcd; 
    input clk;
    input dot; 
    output [7:0] cathode;
    output reg[3:0] anode;
    reg [1:0] refresh_counter = 0;
    reg refresh_clk = 0;
    reg [3:0] bcd_digit;
    reg dp;
    wire [7:0] digit;
    
    assign cathode = ~digit;
    
    bcd_seven bcd2seven(bcd_digit, dp, digit);
    
    reg[16:0] counter = 0;
    always @ (posedge clk)
        begin 
            if(counter == 100000) begin 
            counter <= 1;
            refresh_clk <= ~refresh_clk;
        end 
        else begin 
            counter <= counter + 1;
        end
     end
     
     always @ (posedge refresh_clk) begin 
        refresh_counter <= refresh_counter + 1;
        case(refresh_counter)
            2'd0: begin
                anode <= 4'b1110;
                bcd_digit <= bcd[3:0];
                dp <= 0;
            end 
            2'd1: begin
                anode <= 4'b1101;
                bcd_digit <= bcd[7:4];
                dp <= dot;
            end 
            2'd2: begin
                anode <= 4'b1011;
                bcd_digit <= bcd[11:8];
                dp <= 0;
            end 
            2'd3: begin
                anode <= 4'b0111;
                bcd_digit <= bcd[15:12];
                dp <= 0;
            end 
         endcase
      end                    
endmodule