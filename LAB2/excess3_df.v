`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 02:14:06 PM
// Design Name: 
// Module Name: excess3_df
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


module excess3_df(
 input X, clk, rst,
 output S, V
    );
   
    reg Q0, Q1, Q2, S, V;
    always @(negedge clk, negedge rst) begin
    if(~rst) begin
        Q0 <= 0;
        Q1 <= 0;
        Q2 <= 0;
        S <= 0;
        V <= 0;
        end
       
    else begin
        Q0 <= ( ((~Q2)&X) | ((~Q2) & (~Q1)&(Q0)) | (Q1&(~Q0)) );
        Q1 <= ( ((~Q2)&(~Q1)&(~X)) | ((~Q2)&(~Q1)&Q0) | ((~Q2)&Q1&X) );
        Q2 <= ( ((~Q2)& Q1 &Q0) | (Q2 &(~Q1)&Q0) | ((~Q2)&(Q1)&(~X)) );
        S = ( ((~Q2)& (~Q0) & X) | ((~Q1)& Q0 & X) | (Q1 & (~X)) | (Q2 & (~Q1) & X) );
        V = ((Q2 & Q1 & X));
        end
    end          
endmodule



//module excess3_df(X, clk, rst, S, V);
//    input X, clk, rst;
//    output reg S, V;
    
//    //intermediate register for states
//    reg [2:0] Q;
    
//    always @ (negedge clk, negedge rst)
//    begin
//        //asynchronous reset
//        if(~rst)
//        begin
//            Q0 <= 0;
//            Q1 <= 0;
//            Q2 <= 0;
//            S <= 0;
//            V <= 0;
//        end
//        //finite state machine, simplfied boolean equations/expressions
//        //both output and state assignment should be done in here, output assignment outside this always block is considered asynchronous
//        else
//        begin
//            V <= (Q[2] & Q[1] & X);
//	        Q0 <= ( ((~Q[2])&X) | ((~Q[2]) & (~Q[1])&(Q[0])) | (Q[1]&(~Q[0])) );
//            Q1 <= ( ((~Q[2])&(~Q[1])&(~X)) | ((~Q[2])&(~Q[1])&Q[0]) | ((~Q[2])&Q[1]&X) );
//            Q2 <= ( ((~Q[2])& Q[1] &Q[0]) | (Q[2] &(~Q[1])&Q[0]) | ((~Q[2])&(Q[1])&(~X)) );
//            S <= ( ((~Q[2])& (~Q[0]) & X) | ((~Q[1])& Q[0] & X) | (Q[1] & (~X)) | (Q[2] & (~Q[1]) & X) );
//        end
//    end  
//endmodule
