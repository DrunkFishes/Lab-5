`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:50:20 10/23/2017 
// Design Name: 
// Module Name:    lab5_toplvl 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module lab5_toplvl(clk, reset, we, W_Adr, W, R_Adr, S_Adr, An, a, b, c, d, e, f , g);
    input clk, reset, we;
    input [2:0] W_Adr, R_Adr, S_Adr;
    input [3:0] W;
    output a, b, c, d, e, f, g;
    output [7:0] An;
    
    wire clk500, db_we;
    wire [15:0] R, S;
    
    //clk_500Hz                 (clk_in, reset, clk_out)
    clk_500Hz            clk_500(clk, reset, clk500);
    
    //one_shot.v                (D_in, clk_in, reset, D_out)
    one_shot                  db(we, clk500, reset, db_we);
    
    //register_file.v           (clk, reset, W, W_Adr, we, R_Adr, S_Adr, R, S)
    register_file       reg_file(clk, reset, {12'hFFF, W}, W_Adr, db_we, R_Adr, S_Adr, R, S);
    
    //display_controller        (clk, reset, An, D, a, b, c, d, e, f, g)
    display_controller   display(clk, reset, An, {R,S}, a, b, c, d, e, f, g);


endmodule
