`timescale 1ns / 1ps
module register_file(
    input [4:0] read_addA,
    input [4:0] read_addB,
    input [4:0] write_addC,
    input [15:0] write_dataC,
    input clk,enable_A, enable_B, enable_C,
    output reg [15:0] read_dataA,
    output reg [15:0] read_dataB 
    );
    (*ram_style = "block"*)reg [15:0] reg_file [31:0];
    initial $readmemb("RegisterMemory.mem", reg_file);
    
    always @(posedge clk)
    begin
        if (enable_A) read_dataA = reg_file[read_addA];
        if (enable_B) read_dataB = reg_file[read_addB];
    end
    
    always @(negedge clk)
    begin
        if (enable_C) reg_file[write_addC] = write_dataC;
    end 
    
endmodule
