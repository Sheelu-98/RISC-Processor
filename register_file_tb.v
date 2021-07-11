`timescale 1ns / 1ps
module register_file_tb();
    reg [4:0] read_addA;
    reg [4:0] read_addB;
    reg [4:0] write_addC;
    reg [15:0] write_dataC;
    reg clk,enable_A, enable_B, enable_C;
    wire [15:0] read_dataA;
    wire [15:0] read_dataB;

register_file i1(read_addA, read_addB, write_addC, write_dataC, clk,
 enable_A, enable_B, enable_C, read_dataA, read_dataB);

initial forever #15 clk = ~clk;

initial begin
clk<=1;
read_addA <= 5'b01; read_addB <= 5'b10;
write_addC <= 5'b11; write_dataC <= 16'b0110;
enable_A <= 0; enable_B <= 0; enable_C <= 0; 
#100
read_addA <= 5'b101; read_addB <= 5'b110;
enable_A = 1; enable_B = 1; enable_C = 1;
end
endmodule
