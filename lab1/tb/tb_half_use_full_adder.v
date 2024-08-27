
module half_use_full_adder_tb();
reg a,b,cin;
wire sum,carry;
integer i;

data_flow_full_adder DUT(a,b,cin,sum,carry);

initial

begin
	a=1'b0;b=1'b0;cin=1'b0;
end
initial
begin
	for(i=0;i<8;i=i+1)
	begin
		{a,b,cin}=i;
		#100;
	end
end

initial $monitor("input a=%b /t b=%b /t c=%b /t output sum=%b/t carry=%b ",a,b,cin,sum,carry );
endmodule
