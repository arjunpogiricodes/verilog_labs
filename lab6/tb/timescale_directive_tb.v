

`timescale 1us/1ps
module timescale_directive();

reg clk;

initial
begin
clk =0;
end

always #0.0005 clk = ~clk;

endmodule
