

 module decoder_3_to_8(a,b,c,y);

// declaring input output ports
 
 input a,b,c;
 output [7:0]y;

// using data flow model decoder 3 ot 8

	 assign y[0]=(~a)&(~b)&(~c);
	 assign y[1]=(~a)&(~b)&(c);
	 assign y[2]=(~a)&(b)&(~c);
	 assign y[3]=(~a)&(b)&(c);
	 assign y[4]=(a)&(~b)&(~c);
	 assign y[5]=(a)&(~b)&(c);
	 assign y[6]=(a)&(b)&(~c);
	 assign y[7]=(a)&(b)&(c);

 endmodule
