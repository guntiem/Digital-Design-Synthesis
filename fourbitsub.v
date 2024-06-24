`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2024 01:19:36 PM
// Design Name: 
// Module Name: fourbitsub
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


module fourbitsub(input [3:0] A, input [3:0] B, input Bin, output [3:0] Difference, output Bout);
    wire Bin0, Bin1, Bin2;

    Subtractor1b F0(.A(A[0]), .B(B[0]), .Bin(Bin), .Difference(Difference[0]), .Bout(Bin0));
    Subtractor1b F1(.A(A[1]), .B(B[1]), .Bin(Bin0), .Difference(Difference[1]), .Bout(Bin1));
    Subtractor1b F2(.A(A[2]), .B(B[2]), .Bin(Bin1), .Difference(Difference[2]), .Bout(Bin2));
    Subtractor1b F3(.A(A[3]), .B(B[3]), .Bin(Bin2), .Difference(Difference[3]), .Bout(Bout));

endmodule
