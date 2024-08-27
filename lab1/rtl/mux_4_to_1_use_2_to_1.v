

module mux_4_to_1_use_2_to_1(s1,s0,i0,i1,i2,i3,y);
// declare the input and output poerts

 input s1,s0,i0,i1,i2,i3;
 output y;

// declare the wire for interconnecttion

 wire y1,y2;
// using 2 to 1 muxes instances
 mux_2_to_2 MUX1(s0,i0,i1,y1);
 mux_2_to_2 MUX2(s0,i2,i3,y2);
 mux_2_to_2 MUX3(s1,y1,y2,y);
 

// using dataflow model 

 //assign y1=((~s0)&i0)|((s0)&i1);
 
 //assign y2=((~s0)&i2)|((s0)&i3);


 //assign y=((~s1)&y1)|((s1)&y2);
 

 endmodule
