try to get results like [https://oeis.org/A000170/list] with Verilog

Firstly, you should install i[carus]verilog.
End just run make and enjoy results.

To modify board size, change parameter N in queen.v file.

It looks like:

> user@asus-laptop:~/code/verilog/verilog-queen$ time make
> iverilog -o design.vvp queen_tb.v queen.v
> vvp ./design.vvp -lxt2
> ans ->         92
> 
> real	0m0.085s
> user	0m0.072s
> sys	0m0.004s
