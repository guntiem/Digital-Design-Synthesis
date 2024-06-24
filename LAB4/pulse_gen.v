`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/24/2024 06:32:42 PM
// Design Name:
// Module Name: pulse_gen
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
module pulse_gen( MODE, START, STOP, CLK, RESET, PULSE);

input [1:0] MODE;
input STOP, START, CLK, RESET;
output reg PULSE;
reg is_generating;
reg [27:0] counter = 28'd0; // Counter to track clock cycles

always @(posedge CLK) begin
    if (RESET) 
    begin
        is_generating <= 1'b0;
        counter <= 28'd0;
        PULSE <= 1'b0;
    end
else if (START)
     begin
        is_generating <= 1'b1;
        counter <= 28'd0; // Reset counter on start
        PULSE <= 1'b0; // Ensure pulse is not generated on module pulse_gen 
    end
else if (STOP) 
    begin
        is_generating <= 1'b0;
        PULSE <= 1'b0; // Ensure pulse is not generated on stop
    end

else if (is_generating) begin

case (MODE)
    2'b00: 
    begin // Walk mode
        if (counter >= 3124999) begin // 32 pulses per second
        counter <= 28'd0;
        PULSE <= 1'b1;
    end 
    else
     begin
        counter <= counter + 1'b1;
        PULSE <= 1'b0;
    end
   end
    2'b01: 
    begin // Jog mode
        if (counter >= 1562499) begin // 64 pulses per second
        counter <= 28'd0;
        PULSE <= 1'b1;
    end 
    else begin
        counter <= counter + 1'b1;
        PULSE <= 1'b0;
    end
   end
    2'b10: 
    begin // Run mode
        if (counter >= 781249) begin // 128 pulses per second
        counter <= 28'd0;
        PULSE <= 1'b1;
    end 
    else begin
        counter <= counter + 1'b1;
        PULSE <= 1'b0;
    end
   end
    2'b11: begin // Off mode
        PULSE <= 1'b0;
    // No need to increment counter in off CLK 
     end
    endcase
 end

end

endmodule