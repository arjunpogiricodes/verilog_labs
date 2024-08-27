


module mux_4_to_1_use_decoder(s0,s1,i0,i1,i2,i3,out);

// declaring input and output ports

input s0,s1,i0,i1,i2,i3;
output out;
wire [3:0]y;
wor out;


// using decoder and tristate buffer desinging 4 to 1 mux
 
 assign y[0]=(~s0)&(~s1);
 assign y[1]=(~s0)&(s1);
 assign y[2]=(s0)&(~s1);
 assign y[3]=(s0)&(s1);

 // using bufif1 premitive
 
 bufif1 OUT1(out,i0,y[0]);
 bufif1 OUT2(out,i1,y[1]);
 bufif1 OUT3(out,i2,y[2]);
 bufif1 OUT4(out,i3,y[3]);

 endmodule
