`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2024 01:58:58
// Design Name: 
// Module Name: sign_ex
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


module sign_ex (
    input [15:0] fp16,     // 16-bit floating-point input
    output [31:0] fp32     // 32-bit floating-point output
);

    wire sign;
    wire [4:0] exp16;      // 5-bit exponent from fp16
    wire [9:0] mant16;     // 10-bit mantissa from fp16
    wire [7:0] exp32;      // 8-bit exponent for fp32
    wire [22:0] mant32;    // 23-bit mantissa for fp32
    
    assign sign = fp16[15];        // Extract sign bit
    assign exp16 = fp16[14:10];    // Extract 5-bit exponent
    assign mant16 = fp16[9:0];     // Extract 10-bit mantissa

    // Adjust exponent by the bias difference (127 - 15 = 112)
    assign exp32 = (exp16 == 0) ? 0 : (exp16 + 8'd112);  // Handle subnormal numbers

    // Shift mantissa to fit 23 bits
    assign mant32 = {mant16, 13'b0};   // Shift the 10-bit mantissa to the left by 13 bits

    // Combine everything into the 32-bit floating-point output
    assign fp32 = {sign, exp32, mant32};

endmodule
