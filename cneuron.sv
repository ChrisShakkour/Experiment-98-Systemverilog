`timescale 1ns/100fs

module CNeuron 
  (
   input 	      clk,
   input [31:0]       kernel, 
   input [3:0] [7:0]  pixels, 
   output logic [7:0] convResult
   );
   
   logic [7:0] 	      sum;
   //integer 	      i;

   always_comb 
     begin
	sum = '0;
	sum = sum + kernels[7:0]   * pixels[0];
	sum = sum + kernels[15:8]  * pixels[1];
	sum = sum + kernels[23:16] * pixels[2];
	sum = sum + kernels[31:24] * pixels[3];
     end
   
   always_ff @(posedge clk)
     convResult <= sum;

endmodule
