

module decoder_2_to_4_assign(a,y);

//declaring the input and output port declaration 
 
input [0:1]a;
output [0:3]y;

//using dataflow abstraction

	 assign y[0]=(~a[0])&(~a[1]);
	 assign y[1]= (~a[0])&(a[1]);
	 assign y[2]= (a[0])&(~a[1]);
	 assign y[3]=  (a[0])&(a[1]);
endmodule 
