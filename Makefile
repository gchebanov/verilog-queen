all:
	iverilog -o design.vvp queen_tb.v queen.v
	vvp ./design.vvp -lxt2
