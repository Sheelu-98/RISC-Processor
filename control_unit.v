`timescale 1ns / 1ps
module control_unit(
    input [16:0] opcode,
    output reg [2:0] ALU_ctrl, 
    output reg enable_A, 
    output reg enable_B,
    output reg enable_C
    );
    
    always @(*) begin
    case(opcode)
    17'b001: begin 
        ALU_ctrl = 3'b001; 
        enable_A = 1'b1;
        enable_B = 1'b1;
        enable_C = 1'b1;
        end 
    17'b010: begin
        ALU_ctrl = 3'b010;
        enable_A = 1'b0;
        enable_B = 1'b0;
        enable_C = 1'b0;
        end 
    17'b011: begin
        ALU_ctrl = 3'b011;
        enable_A = 1'b0;
        enable_B = 1'b0;
        enable_C = 1'b0;
        end
    17'b100:begin
        ALU_ctrl = 3'b100;
        enable_A = 1'b0;
        enable_B = 1'b0;
        enable_C = 1'b0;
        end
    endcase
    end
endmodule
