 

 module priority_encoder_4_to_2(i0,i1,i2,i3,out1,out2);

// eclaration of input and output ports

 input i0,i1,i2,i3;

 output out1,out2;
 
// using dataflow model


 assign out1=(i3)|(i2);
 assign out2=(i3)|((~(i2))&(i1));

 endmodule


