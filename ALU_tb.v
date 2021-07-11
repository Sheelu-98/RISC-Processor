`timescale 1ns / 1ps
module ALU_tb();
    reg [15:0] A;
    reg [15:0] B;
    reg [2:0] ctrl;
    wire zero;
    wire [15:0] ALU_result;
    
ALU inst1(A, B, ctrl, zero, ALU_result);
initial begin
A = 65;
B = 2;
ctrl = 3'b000;
#200 ctrl = 3'b001;
#200 ctrl = 3'b010;
#200 ctrl = 3'b011;
#200 ctrl = 3'b100;
end
    
endmodule
