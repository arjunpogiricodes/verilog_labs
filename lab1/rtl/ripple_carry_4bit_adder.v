

module ripple_carry_4bit_adder(a,b,cin,s,cout);

// declaring  input and output port directions


  input [3:0]a,b;
  input cin;
  output [3:0]s;
  output cout;
  wire [2:0]c;
  
 //using  privious full_adder instance 

full_adder FA1(a[0],b[0],cin,s[0],c[0]); 
full_adder FA2(a[1],b[1],c[0],s[1],c[1]); 
full_adder FA3(a[2],b[2],c[1],s[2],c[2]); 
full_adder FA4(a[3],b[3],c[2],s[3],cout);

endmodule
