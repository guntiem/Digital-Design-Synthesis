`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2024 06:18:40 PM
// Design Name: 
// Module Name: Memory
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


module Memory(CS, WE, CLK, ADDR, Mem_Bus);
    input CS;
    input WE;
    input CLK;
    input [6:0] ADDR;
    inout [31:0] Mem_Bus;
    
    reg [31:0] data_out;
    reg [31:0] RAM [0:127];
    
    
    initial
    begin
    /* Write your readmemh code here */
    $readmemh("C:\Users\egunti\Downloads\lab4_instruction.txt", RAM); // CHANGEd
    end
    
    assign Mem_Bus = ((CS == 1'b0) || (WE == 1'b1)) ? 32'bZ : data_out;
    
	//Keep this negedge. Do not change it.
    always @(negedge CLK)
    begin
        if((CS == 1'b1) && (WE == 1'b1))
            RAM[ADDR] <= Mem_Bus[31:0];
        
        data_out <= RAM[ADDR];
    end
endmodule
