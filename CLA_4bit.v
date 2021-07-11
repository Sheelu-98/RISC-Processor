`timescale 1ns / 1ps
module CLA_4bit(
    input [3:0] a,b, input cin,
    output [3:0] sum, output carry );
    wire g0, g1, g2, g3, p0, p1, p2, p3;
    wire pc0, pc1, pc2, pc3, pg0, pg1, pg2, pg3, pg4, pg5;
    wire [2:0] c;
    
    // Generation block
    and ab0(g0, a[0], b[0]), ab1(g1, a[1], b[1]), ab2(g2, a[2], b[2]), ab3(g3, a[3], b[3]);
    
    //Propagation block
    xor axb0(p0, a[0], b[0]), axb1(p1, a[1], b[1]),axb2(p2, a[2], b[2]), axb3(p3, a[3], b[3]);
        
    // CLA logic-- Carry bit generation
    // assign c[0] = g0 | (p0 & cin);
    and (pc0, p0, cin);     or (c[0], g0, pc0);
    
    //assign c[1] = g1 | (p1 & g0) | (p1 & p0 & cin);
    and (pc1, pc0, p1);  and (pg0, p1, g0); 
    or (c[1], g1, pg0, pc1);
    
    //assign c[2] = g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & cin);
    and (pc2, p2, pc1);   and (pg1, pg0, p2);  and (pg2, g1, p2);
    or (c[2], g2, pc2, pg1, pg2);
    
    //assign carry = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & cin);
    and (pc3, p3, pc2);   and (pg3, pg1, p3);   and (pg4, pg2, p3);   and (pg5, p3, g2);
    or (carry, g3, pc3, pg3, pg4, pg5);
    
    //Sum block
    xor s0(sum[0], p0, cin), s1(sum[1], p1, c[0]),
        s2(sum[2], p2, c[1]), s3(sum[3], p3, c[2]);
         
endmodule
