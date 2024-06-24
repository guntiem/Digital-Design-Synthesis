`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2024 02:03:03 PM
// Design Name: 
// Module Name: milestone1
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


module milestone1(input wire [1:0] MODE,input wire START,input wire STOP,input wire CLK,
                  input wire RESET, output wire[13:0] STEPS,output wire OFLOW,output wire DISTANCE);
                  
 
 wire pulse_signal;
 
 
 pulse_gen puls_generator( .MODE(MODE), .STOP(STOP), .START(START), .CLK(CLK), .RESET(RESET), .PULSE(pulse_signal));
 
 fitbittracker fit_bit_tracker(.PULSE(pulse_signal),.CLK(CLK),.RESET(RESET),.STEPS(STEPS),.OFLOW(OFLOW),.DISTANCE(DISTANCE));
 
                  
endmodule
