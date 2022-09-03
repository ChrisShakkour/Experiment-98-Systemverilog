`timescale 1ns/100fs

`define NoOfKernels 2
`define NoOfShapes  4
`define numAddr     5

module Top 
  ( 
    input 	       clk, 
    input [3:0] [7:0]  pixels,
    input 	       rst, learn, classify,
    input [31:0]       KR_DATA_I1, KR_DATA_I2, W1_DATA_I1, W1_DATA_I2, W2_DATA_I1, W2_DATA_I2, 
    output logic [7:0] result
    );

logic [`NoOfKernels-1:0] [7:0] convResult;
logic [3:0] [7:0] pooledPixelArray[`NoOfKernels-1:0];
logic [`numAddr-1:0] KMEM_ADD1;
logic [`numAddr-1:0] KMEM_ADD2;
logic [`numAddr-1:0] WMEM_ADD1;
logic [`numAddr-1:0] WMEM_ADD2;
logic KMEM_WEB1, KMEM_OEB1, KMEM_CSB1;
logic KMEM_WEB2, KMEM_OEB2, KMEM_CSB2;
logic WMEM_WEB1, WMEM_OEB1, WMEM_CSB1;
logic WMEM_WEB2, WMEM_OEB2, WMEM_CSB2;
logic [1:0][31:0] KR_DATA_O;
logic [31:0] W1_DATA_O1, W1_DATA_O2,W2_DATA_O1, W2_DATA_O2;
logic En;


   NeuralNet_cont2 NNC_U1(.*);   

   // Kernel memory
   dpram32x32_cb KMEM_U1
     (
      .A1	(KMEM_ADD1)	, .A2      (KMEM_ADD2),
      .CEB1	(KMEM_CEB1)	, .CEB2    (KMEM_CEB2),
      .WEB1	(KMEM_WEB1)	, .WEB2    (KMEM_WEB1),
      .OEB1	(KMEM_OEB1)	, .OEB2    (KMEM_OEB1),
      .CSB1	(KMEM_CSB1)	, .CSB2    (KMEM_CSB2),
      .I1	(KR_DATA_I1)	, .I2      (KR_DATA_I2), 
      .O1	(KR_DATA_O[0])	, .O2      (KR_DATA_O[1])
      );

   // Weights memory 1
   dpram32x32_cb WMEM_U1
     (
      .A1	(WMEM_ADD1)	, .A2      (WMEM_ADD1),
      .CEB1	(WMEM_CEB1)	, .CEB2    (WMEM_CEB1),
      .WEB1	(WMEM_WEB1)	, .WEB2    (WMEM_WEB1),
      .OEB1	(WMEM_OEB1)	, .OEB2    (WMEM_OEB1),
      .CSB1	(WMEM_CSB1)	, .CSB2    (WMEM_CSB1),
      .I1	(W1_DATA_I1)	, .I2      (W1_DATA_I2), 
      .O1	(W1_DATA_O1)	, .O2      (W1_DATA_O2)
      );

   // weights memory 2
   dpram32x32_cb WMEM_U2
     (
      .A1	(WMEM_ADD2)	, .A2      (WMEM_ADD2),
      .CEB1	(WMEM_CEB2)	, .CEB2    (WMEM_CEB2),
      .WEB1	(WMEM_WEB2)	, .WEB2    (WMEM_WEB2),
      .OEB1	(WMEM_OEB2)	, .OEB2    (WMEM_OEB2),
      .CSB1	(WMEM_CSB2)	, .CSB2    (WMEM_CSB2),
      .I1	(W2_DATA_I1)	, .I2      (W2_DATA_I2), 
      .O1	(W2_DATA_O1)	, .O2      (W2_DATA_O2)
      );


   
// Example of generate statement	(required for experiment 2 later section)
// genvar k;
// generate for (k = 0; k <`NoOfKernels ; k = k + 1) begin
// Code to be repeated for each k
// end
// endgenerate

endmodule
