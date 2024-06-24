`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 05:30:25 PM
// Design Name: 
// Module Name: simpleDivider
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


module simpleDivider(clk100Mhz, slowClk);
input clk100Mhz; //fast clock
output slowClk; //slow clock
reg[27:0] counter;
assign slowClk= counter[27]; //(2^27 / 100E6) = 1.34seconds
initial begin
counter = 0;
end
always @ (posedge clk100Mhz)
begin
counter <= counter + 1; //increment the counter every 10ns (1/100 Mhz) cycle.
end
endmodule

    