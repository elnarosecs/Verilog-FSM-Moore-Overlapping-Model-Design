`include "seq_detector.v"
module tb;
	reg clk,rst,in;
	wire out;

sequence_detector dut(clk,rst,in,out);
	
	always #5 clk = !clk;

	initial begin
		clk = 0;
		rst = 1;
		repeat(2) @(posedge clk);
		rst = 0;

		repeat(10) begin
		in = $random();
		@(posedge clk);
		end

		#200 $finish();
	end

endmodule
