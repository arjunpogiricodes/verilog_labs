

 module binary_to_gray(a,b,c,d,g0,g1,g2,g3);

//declaring the input and output ports
  input a,b,c,d;
  output g0,g1,g2,g3;
// alreadydone

// convert binary to gray using data flow model

 assign g3=d;
 assign g2=d^c;
 assign g1=c^b;
 assign g0=b^a;
// convert gray to binary
 /*
 assign d=g3;
 assign c=d^g2;
 assign b=c^g1;
 assign a=b^g0;*/

 endmodule

