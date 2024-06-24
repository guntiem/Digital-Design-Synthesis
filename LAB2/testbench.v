`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 02:37:54 PM
// Design Name: 
// Module Name: testbench
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


module testbench();
//    reg clk, rst, X;
//    wire S, V;
//    wire[2:0] Q;
   
//    excess3_df (X, rst, clk, S, V, Q);
//    initial
//    begin
//        clk = 0;
//    forever begin #5 clk =~ clk; end end
//    initial begin
//    rst = 0; #20 rst = 1;
//    X = 1; #10 X = 0; #10 X = 1; #10 X = 0; #20 X = 1;
//    end

    //inputs
    reg X, clk, rst;
    
    //outputs
    wire S, V;
    
    //instantiate module(s) under test
    excess3_behav dut(
        .X (X),
        .clk (clk),
        .rst (rst),
        .S (S),
        .V (V)
        
    );
    
    //clock generation, provided from lecture slides
    initial
    begin
        clk = 0;
        forever 
        begin
            #5 clk = ~clk; //Clock period is 10 ns, so it "flips" every 5 ns
        end
    end
    
    //intiialization/reset and perform test cases
    initial
    begin //Due to negedge RST, start with RST = 1 first
        rst = 1; #10; rst = 0; #35; rst = 1; #2.5; //Perform reset, wait at least 3 cycles (#35), add some delay padding to align X after rising edge
        X = 1; #10; X= 0; #10; X=1; #10; X=1; #10; //1101
        X = 0; #10; X= 0; #10; X=1; #10; X=1; #10; //1100 
        X = 1; #10; X= 1; #10; X=0; #10; X=1; #10; //1011

	//Do the same for 1100 and 1011, no need to reset
    end
   
endmodule
