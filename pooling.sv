`timescale 1ns/100fs

module Pooling ( input clk, En,
    input [7:0]  convResult, 
	output logic [3:0][7:0] pooledPixels);
 
    integer i;
    logic [2:0] [7:0] convolution;
    logic [3:0] [7:0] pooledReg;

	always_ff @(posedge clk)
	  begin

          end

	always_ff @(negedge clk)
         begin
         if (En == 1'b1)
          begin
 
          end
	 end
     
     assign pooledPixels = pooledReg;
endmodule
