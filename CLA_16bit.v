`timescale 1ns / 1ps
module CLA_16bit(
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output carry
    );
    wire [2:0] cout;
    
    CLA_4bit M1(a[3:0], b[3:0], cin, sum[3:0], cout[0]),
             M2(a[7:4], b[7:4], cout[0], sum[7:4], cout[1]),
             M3(a[11:8], b[11:8], cout[1], sum[11:8], cout[2]),
             M4(a[15:12], b[15:12], cout[2], sum[15:12], carry);
             
    endmodule
