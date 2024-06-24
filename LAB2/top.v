`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 05:32:05 PM
// Design Name: 
// Module Name: top
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


module top(
input LOAD,
input [3:0] D, 
input ENABLE, 
input UP,
input CLK, 
input CLR,
output [3:0] Q,
output CO
 );
 
 simpleDivider divider(.CLK100MHZ(CLK));
 BCD1digit counter(.LOAD(LOAD), .D(D[3:0]), .ENABLE(ENABLE), .UP(UP),
 .CLK(divider.slowClk), .CLR(CLR));
 
 assign Q = counter.Q;
 assign CO = counter.CO;


   
endmodule
