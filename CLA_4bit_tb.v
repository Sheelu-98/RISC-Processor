`timescale 1ns / 1ps
module CLA_4bit_tb();
reg [3:0] a,b;reg cin;
wire [3:0] sum;wire carry;
CLA_4bit tb1(a,b,cin,sum,carry);
initial begin
a = 4'b1100;b = 4'b1010;cin = 0;
#300 a = 11 ; b = 7; cin = 0;
#300 a = 5; b = 8; cin = 0;
end
endmodule
