


 module arithmetic_operator(a,b,c,d,sel,x,y,z,s);
// declaring the input and output ports

 input [3:0]a,b,c,d;
 input [1:0]sel;
 output reg [7:0]x,y,z,s;
// using behavioural and if else conditons

 always@(*)
   begin
     if(sel == 2'b00)
         x=a+b;
     else if(sel == 2'b01)
	     y=b-a;
     else if(sel == 2'b10)
	     z=c*a;
     else
	     s=c-d;
     end 
 endmodule
 
