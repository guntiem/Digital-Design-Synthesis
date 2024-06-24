`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 04:53:38 PM
// Design Name: 
// Module Name: testbench2
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

module testbench2;

  // Declare signals for the testbench
  reg CLK;
  reg CLR;
  reg LOAD;
  reg UP;
  reg ENABLE;
  reg [3:0] D1;
  reg [3:0] D2;
  wire [3:0] Q1;
  wire [3:0] Q2;
  wire CO;

  // Instantiate the lab2bcd_2digit module
  BCD2dig uut (
    .D1(D1),
    .D2(D2),
    .ENABLE(ENABLE),
    .LOAD(LOAD),
    .UP(UP),
    .CLK(CLK),
    .CLR(CLR),
    .Q1(Q1),
    .Q2(Q2),
    .CO(CO)
  );

  // Define time parameters
  initial begin
    CLK = 0;
    CLR = 0;
    LOAD = 0;
    ENABLE = 0;
    UP = 1;
    D1 = 4'b0000;
    D2 = 4'b0000;
    #10;
    CLR = 1;  //turn off clr
    // load counter with 97 (in BCD)
    LOAD = 1;   //both load and enable = 1 for Q = D
    ENABLE = 1; 
    D1 = 4'b0111; // Load data1 with 7
    D2 = 4'b1001; // Load data2 with 9
    #10;
    LOAD = 0;
    #10;


    // 98 -> 99 -> 99 -> 98 -> 97 -> 96 -> 95 -> 95 -> 95
    UP = 1;
    #10;
    UP = 1;
    #10;
    UP = 1;
    #10;
    UP = 0;
    #10;
    UP = 0;
    #10;
    UP = 0;
    #10;
    UP = 0;
    #10;
    UP = 0;
    ENABLE = 0;
    #10;
    #10;
     //"stop" the clk
    //#10; //"stop" the clk
    //#10; 
    //#10;  //nothing 2 clock cycles

     //clr
    CLR = 0;
    #10;
    CLR = 1;
    //#10;

    // load counter with 02 (in BCD)
    LOAD = 1;
    ENABLE = 1;
    D1 = 4'b0010; //2 
    D2 = 4'b0000; //0
    #10;
    LOAD = 0;
    #10;

//    // decrement 3, increment counter 4 times
//    //01 -> 00 -> 00 -> 01 -> 02 -> 03 -> 04 -> 04 -> 04
    UP = 0;
    #10;
    UP = 0;
    #10;
    UP = 0;
    #10;
    UP = 1;
    #10;
    UP = 1;
    #10;
    UP = 1;
    #10;
    UP = 1;
    #10;
    UP = 1;
    ENABLE = 0;
    #10;
    #10;    //wait 2 cycles

//    // clr
    CLR = 0;
    #10;
    CLR = 1;

    //load counter with 42 (in BCD)
    ENABLE = 1;
    LOAD = 1;
    UP = 0;
    D1 = 4'b0010; //2
    D2 = 4'b0100;  //4
    #10;
    LOAD = 0;
    #10;
    #10;
     

//    // decrement counter three times, increment counter four times
//    // 41 -> 40 -> 39 -> 40 -> 41 -> 42 -> 43 -> 43 -> 43
    UP = 0;
    #10;
    UP = 1;
    #10;
    UP = 1;
    #10;
    UP = 1;
    #10;
    UP = 1;
    #10;
    UP = 1;
    ENABLE = 0;
    #10;
    #10;

    // Finish simulation
    $finish;
  end

  // Clock generation
  always begin
    #5 CLK = ~CLK;
  end

endmodule