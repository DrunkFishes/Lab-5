`timescale 1ns / 1ps
 /*******************************************************************************
 * Author:   Benjamin Adinata
 * Email:	 benjaminadinata@yahoo.com
 * Filename: 
 * Date:     October 23, 2017
 * Version:  1.0
 * Purpose:  
 *					
 * Notes:	 
 *******************************************************************************/

module display_controller(clk, reset, An, D, a, b, c, d, e, f, g);
    // inputs		
    input   clk, reset;
	input   [31:0] D;
    
	
    //outputs
    output  wire [7:0] An;
	output             a, b, c, d, e, f, g; //output to hex-7 segment andoes
	 
    wire clk_out;
    wire [2:0] seg_sel;
    wire [3:0] Y;
    wire [15:0] switch;
    wire [31:0] seg;
    
    //pixel_clk      (clk_in, reset,  clk_out)
    pixel_clk   pclk (clk,    reset,  clk_out);
    
    //pixel_controller   (clk,	 	 reset, 		seg_sel, 		An)
    pixel_controller pcon(clk_out, 	 reset, 		seg_sel, 		An);
    
    //ad_mux    (Sel,     D, Y)
    ad_mux  mux (seg_sel, D, Y);
    
    //hex_to_7segment      (hex, a, b, c, d, e, f, g)
    hex_to_7segment hexseg ( Y,  a, b, c, d, e, f, g);

endmodule
