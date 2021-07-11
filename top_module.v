`timescale 1ns / 1ps
module top_module(
    input clk_50,
    output top_out
    );
    
    reg [6:0] PC; 
    wire clk_100;
    wire [31:0] Instruction;
    wire [15:0] ALU_result, read_dataA, read_dataB;
    wire [2:0] ALU_ctrl;
    wire zero, enable_A, enable_B, enable_C, locked;
    
    //pipeline registers
    //stage 1-2
    reg [31:0] ir;
    reg [4:0] write_add1;
    reg en_A, en_B, en_C1, en_C2, en_C3;
    reg [2:0] ctrl1, ctrl2;
    //stage 2-3
    reg [15:0] pipe_A, pipe_B;
    reg [4:0] write_add2; 
    //stage 3-4
    reg [15:0] ALU_out;
    reg z;
    reg [4:0] write_add3;
   
   //MMU module
     clk_gen_100 cg1 (.clk_100(clk_100),.locked(locked),.clk_50(clk_50));
       
    assign top_out = z;
    
    //Module instantiations
    instruction_memory im1(.PC(PC), .Instruction(Instruction));
    register_file rf1(.read_addA(ir[4:0]), .read_addB(ir[9:5]), .write_addC(write_add3), .write_dataC(ALU_out),
     .clk(clk_100), .enable_A(en_A), .enable_B(en_B),.enable_C(en_C3), .read_dataA(read_dataA), .read_dataB(read_dataB));
    ALU a1(.A(pipe_A), .B(pipe_B), .ctrl(ctrl2), .zero(zero), .ALU_result(ALU_result));
   
    initial PC = 7'b0;
    
    always @(posedge clk_100) begin
    ir <= Instruction;
    write_add1 <= ir[14:10];
    ctrl1 <= ir[17:15];
    en_A <= 1'b1;
    en_B <= 1'b1;
    en_C1 <= 1'b1;
    
    pipe_A <= read_dataA;
    pipe_B <= read_dataB;
    ctrl2 <= ctrl1;
    en_C2 <= en_C1;
    write_add2 <= write_add1;
    
    ALU_out <= ALU_result;
    z <= zero;
    write_add3 <= write_add2;
    en_C3 <= en_C2;
    
    PC <= (PC >= 15)? 7'b0: PC + 4;
    end
  
    endmodule
