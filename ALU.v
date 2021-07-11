`timescale 1ns / 1ps
module ALU(
    input [15:0] A,
    input [15:0] B,
    input [2:0] ctrl,
    output zero,
    output reg [15:0] ALU_result
    );
    wire cout;
    wire [15:0] add_result;
    
    always @(*) begin
        case(ctrl)
        'b001: ALU_result <= A[7:0]*B[7:0];
        'b010: ALU_result <= A << B;
        'b011: ALU_result <= A ^ B;
        'b100: ALU_result <= add_result;
        endcase
   end
   // Add block
   CLA_16bit add(A, B, 0, add_result, cout);
   
   assign zero = (ALU_result == 'b0)? 1'b1: 1'b0;                    
    
endmodule
