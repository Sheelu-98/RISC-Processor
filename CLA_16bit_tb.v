`timescale 1ns / 1ps
module CLA_16bit_tb();
reg [15:0] a,b;
reg cin;
wire [15:0] sum; 
wire carry;

CLA_16bit tb1(a,b,cin,sum,carry);
initial begin
a = 65; b = 98; cin = 0;
#200 a = 54; b = 64; cin = 0;
#200 a = 90; b = 12; cin = 1;
#200 a = 44; b = 99 ; cin = 1;
 end
endmodule
