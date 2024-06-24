`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2024 06:00:07 PM
// Design Name: 
// Module Name: clock_1hz
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


module clock_1hz(clk100Mhz, clk1Hz);

    input clk100Mhz;
    output reg clk1hz;

    reg [26:0] counter;
    
    initial begin 
        counter <= 0;
        clk1Hz <= 0;
    end 
    
    
always @(posedge clk100Mhz) begin 
        if (counter == 4999999) begin 
            couner <= 0;
            clk1Hz <= ~clk1Hz;
        end else begin 
            counter <= counter + 1;
        end 
 end 
 
endmodule