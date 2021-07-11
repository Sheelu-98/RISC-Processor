`timescale 1ns / 1ps
module instruction_memory(
    input [6:0] PC,
    output [31:0] Instruction
    );
    (*ram_style = "block"*)reg [7:0] Ins_memory [127:0];
    
    initial $readmemh("InstructionMemory.mem", Ins_memory);
    assign Instruction = {Ins_memory[PC], Ins_memory[PC + 1],
     Ins_memory[PC + 2], Ins_memory[PC + 3] };
    
endmodule
