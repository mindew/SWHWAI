module equality
	#(
		parameter w = 20)
(
input [w-1:0] a,
input [w-1:0] b,
output match
);

assign match = (a === b);


endmodule