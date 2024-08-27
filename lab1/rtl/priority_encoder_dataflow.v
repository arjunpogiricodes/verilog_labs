

 module priority_encoder_dataflow(i,y);

// declaring the input and output ports for normal encoder

 input [7:0]i;
 output [2:0]y;

// using data flow model

 assign y[0]=i[1]|i[3]|i[5]|i[7];
 assign y[1]=i[2]|i[3]|i[6]|i[7];
 assign y[2]=i[4]|i[5]|i[6]|i[7];

 endmodule

 module priority_ckt_dataflow(a,z,idle);

// declaring input and output ports for priority ckt 

 input [7:0]a;
 output [7:0]z;
 output idle;

 // using data flow model

 assign z[7]=a[7];
 assign z[6]=a[6]&(~a[7]);
 assign z[5]=a[5]&(~a[6])&(~a[7]);
 assign z[4]=a[4]&(~a[5])&(~a[6])&(~a[7]);
 assign z[3]=a[3]&(~a[4])&(~a[5])&(~a[6])&(~a[7]);
 assign z[2]=a[2]&(~a[3])&(~a[4])&(~a[5])&(~a[6])&(~a[7]);
 assign z[1]=a[1]&(~a[2])&(~a[3])&(~a[4])&(~a[5])&(~a[6])&(~a[7]);
 assign z[0]=a[0]&(~a[1])&(~a[2])&(~a[3])&(~a[4])&(~a[5])&(~a[6])&(~a[7]);
 assign idle=(~a[0])&(~a[1])&(~a[2])&(~a[3])&(~a[4])&(~a[5])&(~a[6])&(~a[7]);

 endmodule

 module priority_encoder_top(in,out,idle_state);

//declaring the input and output for top module

 input [7:0]in;
 output [2:0]out;
 output idle_state;
 wire [7:0]w;

//uisng normal encoder and priority ckt instance for top module

 priority_ckt_dataflow  P_CKT(in,w,idle_state);
 priority_encoder_dataflow ENCODER(w,out);

 endmodule 


 

