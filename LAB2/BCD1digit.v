`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 03:57:53 PM
// Design Name: 
// Module Name: BCD1digit
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


`timescale 10ns / 1ps
module BCD1digit(D, ENABLE, LOAD, UP, CLK,CLR, Q, CO);
    input [3:0]D;
    input ENABLE;     //1 bit inputs
    input LOAD;          //
    input CLK;         //
    input CLR;
    input UP;
    output reg[3:0]Q;
    output reg CO;
    // Synchronous counter
    always @(posedge CLK or negedge CLR)
    begin
        if (!CLR) begin
            Q <= 4'b0000; // Clear the counter
        end else if (LOAD && ENABLE) begin
            Q <= D; // Load data input D into the counter
        end else if (ENABLE) begin //Load is 0
            if (UP) begin
                if (Q == 4'b1001) begin
                    Q <= 4'b0000; // Reset to 0
                end else begin
                    Q <= Q + 1; // Increment the counter
                end
            end else begin
                if (Q == 4'b0000) begin
                    Q <= 4'b1001; // Reset to 9
                end else begin
                    Q <= Q - 1; // Decrement the counter
                end
            end
        end
    end
    
    always @(*)
    begin
        if (~CLR) begin
            CO = 0; // Clear the carry output when CLR is asserted
        end else if (ENABLE) begin
            if (Q == 4'b1001 & UP) begin
                CO = 1; // Asynchronous carry output when Q reaches 9
            end else if (Q == 4'b000 & ~UP)
            begin
                CO = 1;
            end else
            
            begin
                CO = 0;
            end
        end
    end

endmodule
