`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2024 04:28:23 PM
// Design Name: 
// Module Name: bcd_seven
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


module bcd_seven(bcd, dot, segs_with_dp);
    input [3:0] bcd;
    input dot;
    output [7:0] segs_with_dp;
    
    reg [6:0] seven;
    
    always @(bcd)
    begin 
        case (bcd)
            4'b0000 : seven = 7'b0111111;
            4'b0001 : seven = 7'b0000110;
            4'b0010 : seven = 7'b1011011;
            4'b0011 : seven = 7'b1001111;
            4'b0100 : seven = 7'b1100110;
            4'b0101 : seven = 7'b1101101;
            4'b0110 : seven = 7'b1111101;
            4'b0111 : seven = 7'b0000111;
            4'b1000 : seven = 7'b1111111;
            4'b1001 : seven = 7'b1101111;
            default : seven = 7'b0000000;
         endcase
     end 
     assign segs_with_dp = {dot, seven};
            
endmodule