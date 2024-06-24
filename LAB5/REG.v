`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2024 06:21:23 PM
// Design Name: 
// Module Name: REG
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


module REG(CLK, RegW, DR, SR1, SR2, Reg_In, ReadReg1, ReadReg2, ReadReg3); //added output
    input CLK;
    input RegW;
    input [4:0] DR;
    input [4:0] SR1;
    input [4:0] SR2;
    input [31:0] Reg_In;
    output reg [31:0] ReadReg1;
    output reg [31:0] ReadReg2;
    output reg [31:0] ReadReg3;
    reg [31:0] REG [0:31];
    
    /*
	initial begin
        ReadReg1 = 0;
        ReadReg2 = 0;
    end
	*/
    
    always @(posedge CLK)
    begin
        if(RegW == 1'b1)
            REG[DR] <= Reg_In[31:0];
        
        ReadReg1 <= REG[SR1];
        ReadReg2 <= REG[SR2];
        ReadReg3 <= REG[SR3];
    end
endmodule