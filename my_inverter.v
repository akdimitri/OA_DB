//-------------------------------------------------
// Author: 	Dimitrios Antoniadis
// Date:	25/6/2020	
// File:	inverter.v
// Description:	Synchronous Inverter	
//-------------------------------------------------

module my_inverter(
in,
out,
clk
);

// --- Inputs ---
input in;
input clk;

// --- Outputs ---
output out;

// --- Wires ---
wire in;
wire clk;
reg out;

always @(posedge clk) begin
out <= ~in;
end

endmodule
