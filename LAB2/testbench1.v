`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 04:09:34 PM
// Design Name: 
// Module Name: testbench1
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


module testbench1;

reg CLK;
reg CLR;
reg ENABLE;
reg LOAD;
reg UP;
reg [3:0] D;
wire [3:0] Q;
wire CO;

BCD1digit uut (
    .D(D),
    .ENABLE(ENABLE),
    .LOAD(LOAD),
    .UP(UP),
    .CLK(CLK),
    .CLR(CLR),
    .Q(Q),
    .CO(CO)
);

// Clock generation
always begin
    CLK = 0;
    #5;
    CLK = 1;
    #5;
end


initial begin
    // Set initial values for inputs
    CLR = 1;
    ENABLE = 1;
    LOAD = 0;
    UP = 1;
    D = 4'b0000;

    #50;

    D = 4'b0110; // Load the counter with 6
    LOAD = 1;    // Assert LOAD

    #20;

    // Deassert LOAD
    LOAD = 0;

    #10;

    ENABLE = 1; //Enable counter

    // Increment counter five times
    UP = 1;
    #10;
    UP = 1;
    #10;
    UP = 1;
    #10;
    UP = 1;
    #10;
    // Decrement counter three times
    UP = 0;
    #10;
    UP = 0;
    #10;
    UP = 0;
    #10;
    // Clear the counter
    CLR = 0; 
    #20;
    // deassert CLR
    CLR = 1;
    #10;
    // $finish;
end

endmodule
