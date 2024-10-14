`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2024 02:00:35
// Design Name: 
// Module Name: signex_tb
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


module signex_tb;

    reg [15:0] fp16;          // 16-bit floating-point input
    wire [31:0] fp32;         // 32-bit floating-point output
    
    // Instantiate the FP16 to FP32 conversion module
    sign_ex uut (
        .fp16(fp16),
        .fp32(fp32)
    );
    

    // Test various cases
    initial begin
        // Test Case 1: Zero (0.0)
        fp16 = 16'b0000000000000000;  // Half-precision zero
        #10;
       
        // Test Case 2: A positive normal number (3.75)
        fp16 = 16'b0100001110000000;  // 3.75 in half-precision
        #10;

        // Test Case 3: A negative normal number (-6.5)
        fp16 = 16'b1100011010000000;  // -6.5 in half-precision
        #10;

        // End simulation
        $finish;
    end

endmodule
