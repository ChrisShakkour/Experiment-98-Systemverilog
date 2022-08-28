`timescale 1ns/100fs
`define NoOfKernels 2

module fcneuron_test;

logic clk;
logic [3:0] [7:0] pooledPixelArray[`NoOfKernels-1:0];
logic [63:0] weight;
logic [7:0] result;


FCNeuron I_FCNeuron(.clk(clk), .pooledPixelArray({pooledPixelArray[0],pooledPixelArray[1]}), .weight(weight), .result(result));

initial begin
clk = 1'b0 ;
end


always begin
//weight for X

@(negedge clk);
//weight for 0

@(negedge clk);
//weight for /

@(negedge clk);
//weight for \

@(negedge clk);
end

initial begin 
//X

repeat(4) @(negedge clk);
// '\'

repeat(4) @(negedge clk);
//"0"

repeat(4) @(negedge clk);
// '/'

repeat(4) @(negedge clk);
#20 $finish; 
end

always begin 
#5 clk = ~clk; 
end

endmodule
