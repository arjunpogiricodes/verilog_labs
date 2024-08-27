

 module  mux_2_to_2(s,i0,i1,y);

 input s,i0,i1;

 output y;

 assign y=((~s)&i0)|(s&i1);

 endmodule
