module test;

reg clk = 0;
reg go = 0;
wire valid;
wire [31:0] ans;
always #1 clk = !clk;

queen q(go, clk, ans, valid);

initial #13 go <= 1;

always @valid begin
  if (valid) begin
    $monitor("ans -> %d", ans);
    $finish;
  end
end

initial begin
// $dumpfile("dump.lxt");
// $dumpvars(0,test);
// # 200 $finish;
end

endmodule
