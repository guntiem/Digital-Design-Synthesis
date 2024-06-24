`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2024 12:55:56 PM
// Design Name: 
// Module Name: Subtractor1b
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


module Subtractor1b( input A, B, Bin, output Difference, Bout);
    assign Difference = A^B^Bin;
    assign Bout = ~A & (B^Bin) | B & Bin;
endmodule
