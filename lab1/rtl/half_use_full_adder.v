


module full_adder_using_half(a,b,c,sum,carry);

input a,b,c;
output sum,carry;

wire x,y,z;

half_adder HA1(.a(a), .b(b), .sum(x), .carry(y));

half_adder HA2(.a(x), .b(c), .sum(sum), .carry(z));

or R1(carry,y,z);

endmodule
