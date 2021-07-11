`timescale 1ns / 1ps
module instruction_memory_tb();
reg [6:0] PC;
wire [31:0] Instruction;

instruction_memory i1(PC, Instruction);
initial begin
PC = 0;
#200 PC = 4;
#50 PC = 6;
end
endmodule
