`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2024 04:57:49 PM
// Design Name: 
// Module Name: binarytobcd
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


module binarytobcd( binary, start, clk, done, bcd);
    input [13:0] binary;
    input start, clk;
    output reg done;
    output reg [15:0] bcd = 0;
    reg [13:0] binary_reg = 0;
    reg [2:0] state = 0;
    reg [3:0] counter = 0;
    always @(posedge clk)
        case(state)
            2'd0: begin 
                if(start) begin
                    bcd <= 16'd0;
                    binary_reg <= binary;
                    counter <= 0;
                    done <= 0;
                    state <= 2'd1;
                end
            end
            2'd1:
                if(counter == 4'd14) begin
                    state <= 2'd0;
                    done = 1;
                end 
                else begin 
                    if (bcd[3:0] >= 5) bcd[3:0] <= bcd[3:0] + 3;   
                    if (bcd[7:4] >= 5) bcd[7:4] <= bcd[7:4] + 3;
                    if (bcd[11:8] >= 5) bcd[11:8] <= bcd[11:8] + 3;
                    if (bcd[15:12] >= 5) bcd[15:12] <= bcd[15:12] + 3;  
                    state <= 2'd2;
                end     
            2'd2: begin                
                bcd <= {bcd[14:0], binary_reg[13]};
                binary_reg <= binary_reg << 1;
                counter <= counter + 1;
                state <= 2'd1;
            end 
       endcase 
                                
endmodule