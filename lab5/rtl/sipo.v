

module sipo(clk,reset,data_in,out);
// declaring the input and output ports

  input clk,reset,data_in;
  output [3:0]out;
  //output out1,out2,out3,out4;
  reg [3:0]w;
// logic

  always@(posedge clk)
    begin
     if(reset)
      w<=0;
     else
       begin
         w[3]<=w[2];
         w[2]<=w[1];
         w[1]<=w[0];
         w[0]<=data_in;
       end
     end
// assign the values of wire to output ports     
   assign out[0]=w[0];  
   assign out[1]=w[1];  
   assign out[2]=w[2];  
   assign out[3]=w[3];
/*	
   assign out1=w[0];  
   assign out2=w[1];  
   assign out3=w[2];  
   assign out4=w[3];*/
endmodule   


