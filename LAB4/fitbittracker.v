`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/24/2024 06:22:22 PM
// Design Name:
// Module Name: fitbit_tracker
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

module fitbittracker(PULSE, CLK, RESET, STEPS, OFLOW, DISTANCE);

input PULSE, CLK, RESET;
output reg [13:0] STEPS;
output reg OFLOW;

output reg [4:0] DISTANCE;

reg [15:0] step_counter;

always @(posedge CLK) 
begin
    if(RESET) 
    begin
        step_counter <= 16'd0;
        STEPS <= 14'd0;
        OFLOW <= 1'b0;
        DISTANCE <= 5'd0;
    end 
    else
     begin
        if(PULSE) begin  
        step_counter <= step_counter + 1'b1;
    end
    else 
     begin
        OFLOW <= 1'b1;
     end
    end
        STEPS <= step_counter[13:0];
        
        // Distance calculation
        DISTANCE <= step_counter / 2048; // Each increment represents 0.5 miles
        if(DISTANCE > 19) begin // Limit to 9.5 miles max
        DISTANCE <= 19;
    end
   end
  

endmodule