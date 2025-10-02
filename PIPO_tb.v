module PIPO_tb #(parameter n = 4) ();
	reg          i_clk;
	reg          i_rst;
	reg          i_load;
	reg [n-1:0]  i_parallel_in;
	wire [n-1:0] o_parallel_out;
	
	PIPO DUT (.i_clk(i_clk), 
	          .i_rst(i_rst), 
				 .i_load(i_load), 
				 .i_parallel_in(i_parallel_in), 
				 .o_parallel_out(o_parallel_out)
				 );
				 
	initial begin 
		i_clk = 1'b0;
		forever #2 i_clk = ~i_clk;	// 250M Hz clock
	end
	
	initial begin
		i_rst = 1; 
		i_load = 0; 
		i_parallel_in = 4'b1010;
		#10 i_rst = 0; 
		    i_load = 1;
		#15 i_load = 0; 
		    i_parallel_in = 4'b0101;
		#10 i_load =1; 
		#20 $finish;
	end
endmodule 