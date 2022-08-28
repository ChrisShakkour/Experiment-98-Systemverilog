`timescale 1ns/100fs

module pooling_test;

logic clk,En;
logic [7:0] convResult;
logic [3:0][7:0] pooledPixels;

Pooling I_Pooling(.*);

initial begin
clk = 1'b0 ;
end


initial begin 
//code that sets convResult. For example:
convResult = 8'h31;
@(negedge clk);
convResult = 8'h84;
@(negedge clk);
//add code that assigns 6 more values. One per cycle   

#80 $finish; 
end

initial begin
//Code that sets En
end

always begin 
#5 clk = ~clk; 
end


endmodule
