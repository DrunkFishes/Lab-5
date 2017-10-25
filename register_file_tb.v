`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:07:24 10/23/2017
// Design Name:   register_file
// Module Name:   D:/Ben/Documents/Xilinx ISE/CECS301-Lab5/register_file_tb.v
// Project Name:  CECS301-Lab5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: register_file
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module register_file_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [15:0] W;
	reg [2:0] W_Adr;
	reg we;
	reg [2:0] R_Adr;
	reg [2:0] S_Adr;

	// Outputs
	wire [15:0] R;
	wire [15:0] S;

	// Instantiate the Unit Under Test (UUT)
	register_file uut (
		.clk(clk), 
		.reset(reset), 
		.W(W), 
		.W_Adr(W_Adr), 
		.we(we), 
		.R_Adr(R_Adr), 
		.S_Adr(S_Adr), 
		.R(R), 
		.S(S)
	);

    //Instantiate address counter
        integer addr;
        
    // Generate 10 ns clock
    always
        #5 clk = ~clk;
   
   
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		W = 0;
		W_Adr = 0;
		we = 0;
		R_Adr = 0;
		S_Adr = 0;
        @(negedge clk)
            reset = 1;
        @(negedge clk)
            reset = 0;
        
        //Initial Read
        for(addr = 0; addr < 8; addr = addr + 1) begin
            @(negedge clk) // Assign all inputs
                R_Adr = addr;
                S_Adr = 7 - addr;
                W_Adr = 0;
                   we = 0;
                    W = 0;
                reset = 0;
            @(posedge clk)
                #1 $display("T=%t    RAdr=%h    R=%h    SAdr=%h    S=%h",
                            $time, R_Adr, R, S_Adr, S);
        end
                            
        //Write
        for(addr = 0; addr < 8; addr = addr + 1) begin
            @(negedge clk) // Assign all inputs
                R_Adr = 0;
                S_Adr = 0;
                W_Adr = addr;
                   we = 1;
                    W = ~addr;
                reset = 0;
        end
        
        //Read Again
        for(addr = 0; addr < 8; addr = addr + 1) begin
            @(negedge clk) // Assign all inputs
                R_Adr = addr;
                S_Adr = 7 - addr;
                W_Adr = 0;
                   we = 0;
                    W = 0;
                reset = 0;
            @(posedge clk)
                #1 $display("T=%t    RAdr=%h    R=%h    SAdr=%h    S=%h",
                            $time, R_Adr, R, S_Adr, S);
        end
	end
    
endmodule

