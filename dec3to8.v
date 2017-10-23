`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:33:20 10/23/2017 
// Design Name: 
// Module Name:    dec3to8 
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
module dec3to8(X, En, Y);
	
		input      [2:0] X;
		input            En;
		output reg [7:0] Y;

	always @ (X or En) begin
	if(X ==0)
		Y = 8'b00000000;
	else
		case (X)
			0 : Y =8'b0000_0001;
			1 : Y =8'b0000_0010;
			2 : Y =8'b0000_0100;
			3 : Y =8'b0000_1000;
			4 : Y =8'b0001_0000;
			5 : Y =8'b0010_0000;
			6 : Y =8'b0100_0000;
			7 : Y =8'b1000_0000;
			default: Y = 8'b0000_0000;
		endcase
	end
endmodule
