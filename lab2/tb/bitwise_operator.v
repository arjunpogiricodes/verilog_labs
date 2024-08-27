


 module bitwise_operator();
 reg [2:0]a,b,c,x,y,z;
  initial
      begin
         a=3'd5;
	 b=3'b111;
	 c=3'bx;
	 x=a&b;
	 y=a&c;
	 z=b&3'b1;
         $display(" a=%b b=%b c=%b x = a&b =%b y= a&c = %b z= b&3'b1 =%b ",a,b,c,x,y,z);
       end
 endmodule       
