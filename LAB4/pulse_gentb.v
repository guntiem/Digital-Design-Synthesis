`timescale 1ns / 1ps

module system_tb();

// Inputs to pulse_gen and system
reg [1:0] mode;
reg stop, start, clk, reset;

// Outputs from pulse_gen and inputs to fitbit_tracker
wire pulse;

// Outputs from fitbit_tracker
wire [13:0] steps;
wire oflow;
wire [4:0] distance;

// Instantiate the pulse generator module
pulse_gen uut_pg(
    .MODE(mode),
    .STOP(stop),
    .START(start),
    .CLK(clk),
    .RESET(reset),
    .PULSE(pulse)
);

// Instantiate the Fitbit tracker module
fitbittracker uut_ft(
    .PULSE(pulse),
    .CLK(clk),
    .RESET(reset),
    .STEPS(steps),
    .OFLOW(oflow),
    .DISTANCE(distance)
);

initial begin
    // Initialize Inputs
    clk = 0;
    reset = 1; // Activate reset at the beginning
    start = 0;
    stop = 0;
    mode = 2'b00; // Start with walk mode
   
    // Wait 100 ns for global reset to finish
    #100;
    reset = 0; // Release reset
   
    // Start the simulation with different modes and observe the behavior
    start = 1; // Start generating pulses
    mode = 2'b00; // Walk mode
    #200000; // Simulate for a period of time
   
    mode = 2'b01; // Jog mode
    #200000; // Simulate for a period of time
   
    mode = 2'b10; // Run mode
    #200000; // Simulate for a period of time
   
    mode = 2'b11; // Off mode, should not generate pulses
    #200000; // Simulate for a period of time
   
    stop = 1; // Stop generating pulses
    #100000; // Wait to observe effect of stop
   
    // Reset system to observe reset behavior
    reset = 1;
    #100;
    reset = 0; // Release reset again to see system in initial state
   
    #100;
    $finish; // End simulation
end

// Clock generation with a period of 10ns to simulate 100MHz operation
always #5 clk = ~clk;

endmodule
