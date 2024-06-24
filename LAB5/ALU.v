//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 04/12/2024 06:35:26 PM
//// Design Name: 
//// Module Name: ALU
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////


module ALU(clk, rst, op, instr, alu_in_A, alu_in_B, alu_result, halt);
    input clk;
    input rst;
    input halt;
    input [5:0] op;    
	input [31:0] instr;
    input [31:0] alu_in_A;
    input [31:0] alu_in_B;
    output reg [31:0] alu_result;
    //'define numshift instr[10:6];
    parameter add  = 6'b100000;
    parameter sub  = 6'b100010;
    parameter xor1 = 6'b100110;
    parameter and1 = 6'b100100;
    parameter or1  = 6'b100101;
    parameter slt  = 6'b101010;
    parameter srl  = 6'b000010;
    parameter sll  = 6'b000000;
    //ADDING mult 
    parameter mult = 6'b011000;
    parameter numshift = 5;
    
    always @(posedge clk) 
    begin
        if (rst)
            alu_result <= 0;
        else 
        begin
            if      (op == and1) alu_result <= alu_in_A & alu_in_B;
            else if (op == or1)  alu_result <= alu_in_A | alu_in_B;
            else if (op == add)  alu_result <= alu_in_A + alu_in_B;
            else if (op == sub)  alu_result <= alu_in_A - alu_in_B;
            else if (op == srl)  alu_result <= alu_in_B >> numshift;
            else if (op == sll)  alu_result <= alu_in_B << numshift;
            else if (op == slt)  alu_result <= (alu_in_A < alu_in_B)? 32'd1 : 32'd0;                    
            else if (op == xor1) alu_result <= alu_in_A ^ alu_in_B;	
            //ADDING 
            else if (op == mult) alu_result <= alu_in_A * alu_in_B;
            else alu_result <= 0;
        end
    end
    
endmodule