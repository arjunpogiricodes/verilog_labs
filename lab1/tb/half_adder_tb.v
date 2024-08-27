module half_adder_tb();

reg a,b;
wire sum,carry;
integer i;
half_adder dut(a,b,sum,carry);
initial
begin
	a=1'b0;b=1'b0;
end
initial
begin
	for(i=0;i<4;i=i+1)
	begin
		{a,b}=i;
		#100;
	end
end
initial
	$monitor("input a=%b /t b=%b /t output sum = %b /t carry = %b",a,b,sum,carry);
//initial #500 $finish;
endmodule
