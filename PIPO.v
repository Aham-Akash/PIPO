module PIPO #(parameter n = 4) 
(
	input wire         i_clk,
	input wire         i_rst,
	input  wire        i_load,
	input wire [n-1:0] i_parallel_in,
	output reg [n-1:0] o_parallel_out
);
	reg [n-1:0] r_shift_reg;
	
	always @(posedge i_clk or posedge i_rst) begin
		if(i_rst) begin
			o_parallel_out <= 0;
			r_shift_reg    <= 0;
		end  
		else if(i_load) begin
			r_shift_reg    <= i_parallel_in;
			o_parallel_out <= r_shift_reg;
		end
	end
endmodule 