`timescale 1ns / 1ps
module top_module_tb();
reg clk_50;
wire top_out;

top_module pt1(clk_50, top_out);
initial forever #20 clk_50 = ~clk_50;
initial begin
clk_50 <= 1;
end


endmodule
