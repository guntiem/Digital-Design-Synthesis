`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 04:48:23 PM
// Design Name: 
// Module Name: BCD2dig
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

module BCD2dig(
    input [3:0] D1, 
    input [3:0] D2, 
    input ENABLE,   
    input LOAD,    
    input UP,       
    input CLK,      
    input CLR,      
    output [3:0] Q1, 
    output [3:0] Q2, 
    output reg CO    
);

    reg ENABLE_1;     // Enable for the first digit
    reg ENABLE_2;     // Enable for the second digit
    reg UP_2;         // Up/Down control for the second digit
    reg ENABLE_OVERRIDE; // Enable override control
    reg ENABLE_OVERRIDE2;

    wire CO1, CO2;
    
    // Instantiate the first digit BCD1digit module for Q1
    BCD1digit bcd1 (
        .D(D1),
        .ENABLE(ENABLE_1), //for some reason i switch Q1 with enable 2
        .LOAD(LOAD),
        .UP(UP),
        .CLK(CLK),
        .CLR(CLR),
        .Q(Q1),
        .CO(CO1) // Connect Q1's carry output to CO1
    );

    // Instantiate the second digit BCD1digit module for Q2
    BCD1digit bcd2 (
        .D(D2),
        .ENABLE(ENABLE_2),   //for some reason i switch Q2 with enable 1
        .LOAD(LOAD),
        .UP(UP), 
        .CLK(CLK),
        .CLR(CLR),
        .Q(Q2),
        .CO(CO2) // Connect Q2's carry output to CO2
    );

    always @(*) begin
        ENABLE_1 <= ~ENABLE_OVERRIDE & ENABLE;
        ENABLE_2 <= (LOAD & ENABLE) | (Q1 == 4'd9 | Q1 == 4'd0) & (Q2 != 4'd0 & Q2 != 4'd9);    //sets Q2 value, and changes Q2 value according to conditions

        
        if (((Q2 == 4'd9 & Q1 == 4'd9) & UP == 1'd1) | ((Q2 == 4'd0 & Q1 == 4'd0) & UP == 1'd0)) begin      //combo 99 and 00
            if (((Q2 == 4'd0 & Q1 == 4'd0) & UP == 1'd0) & (LOAD == 1'd1)) begin          //use load so that it will stop the override at CLR
                ENABLE_OVERRIDE <= 1'd0; 
                CO <= 1'd1;
            end else begin                         //continue override
                ENABLE_OVERRIDE <= 1'd1;        
                CO <= 1'd1;
            end 
        end
        else begin
            ENABLE_OVERRIDE <= 1'd0;   //no override
            CO <= 1'd0;
            if (Q1 == 4'd0 & UP == 1) begin             //makes sure that Q2 doesn't keep incrementing whenever it's going 0->1 
                ENABLE_2 <= (LOAD & ENABLE) ;
            end 
            else if (Q1 == 4'd9 & UP == 0)              //makes sure that Q2 doesn't keep decrementing whenever it's going 9->0
                ENABLE_2 <= (LOAD & ENABLE) ;
        end
        
        //intermediate logic
//        ENABLE_1 <= ~ENABLE_OVERRIDE & ENABLE;
//        ENABLE_2 <= (ENABLE & ENABLE_OVERRIDE & ~ENABLE_OVERRIDE) | (LOAD & ENABLE);

    end

endmodule
