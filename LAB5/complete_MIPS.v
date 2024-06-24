`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2024 06:15:53 PM
// Design Name: 
// Module Name: complete_MIPS
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

module complete_MIPS(
    input CLK,
    input RST,
    input HALT,
    output [6:0] ADDR,
    output [31:0] Mem_Bus,
    output REG1
);

    wire CS, WE;
    wire slowClk;

    // Instantiate MIPS CPU and Memory modules
    MIPS CPU(CLK, RST, CS, WE, ADDR, Mem_Bus, HALT, readreg3);
    Memory MEM(CS, WE, CLK, ADDR, Mem_Bus);

    // Connect HALT signal directly to output
    assign REG1 = HALT;

    // Stop simulation on reset or HALT
    always @(posedge CLK) begin
        if (RST || HALT) begin 
            $stop;
        end
    end

endmodule



