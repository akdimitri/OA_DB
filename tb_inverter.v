module tb_inverter();
reg in;
reg clk;
wire out;

my_inverter I1(
.in (in),
.clk (clk),
.out (out)
);

always #5 clk = ~clk;

initial begin
$dumpfile("my_inverter.vcd");
$dumpvars;
$monitor ("%0d ns \t in=%d \t out=%d", $time, in, out);

in= 0;
clk = 0;

repeat (5) begin
@(negedge clk);
end

@(posedge clk) in = 1;

@(posedge clk);

@(posedge clk) in = 0;

repeat (5) begin
@(negedge clk);
end

$finish;
end


endmodule
