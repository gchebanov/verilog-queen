module queen(go, clk, ans, valid);
  parameter N=11;
  parameter LN=5;
  input go, clk;
  output valid;
  output[31:0] ans;
  reg valid;

  reg [N-1:0] mh;
  reg [2*N-1:0] md, ms;

  reg [31:0] ans;
  reg [LN-1:0] k, j;
  reg [LN-1:0] a [N-1:0];
  reg [N-1:0] b;

  always @(posedge clk) begin
    if (k == N) begin
      k <= k - 1;
      ans <= ans + 1;
    end if (k < N) begin
      if (a[k] == N) begin
        k <= k - 1;
      end begin
        j = a[k];
        if (b[k]) begin
          if (!mh[j] && !ms[k + j] && !md[N - k + j]) begin
            mh[j] <= 1; ms[k + j] <= 1; md[N - k + j] <= 1;
            b[k] <= 0;
            a[k + 1] <= 0;
            b[k + 1] <= 1;
            k <= k + 1;
          end else begin
            a[k] <= a[k] + 1;
            b[k] <= 1;
          end
        end else begin
          mh[j] <= 0; ms[k + j] <= 0; md[N - k + j] <= 0;
          a[k] <= a[k] + 1;
          b[k] <= 1;
        end
      end
    end else if (k == (1<<LN) - 1) begin
      $monitor("found ans -> %d", ans);
      valid <= 1;
    end
  end

  always @(posedge go) begin
    mh <= 0;
    md <= 0;
    ms <= 0;
    ans <= 0;
    valid <= 0;
    k <= 0;
    a[0] <= 0;
    b[0] <= 1;
  end
endmodule
