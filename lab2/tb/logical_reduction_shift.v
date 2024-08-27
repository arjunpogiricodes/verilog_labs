



 module logical_reduction_shift();

   reg [7:0]a,b,c,d,x,y,z;
	reg signed [7:0]e,s;

   initial
        begin
           a=8'd25;
           b=8'b11111111;
           c=8'bx10xxx;
	        d=8'b0001z;
	        e=-14;
	   $display(" a=%b b=%b c=%b d=%b e=%b",a,b,c,d,e);
           #10;
	   x=a&&b;
	   y=a||c;
	   z=!b&&a;
	   s=a&&e;
		$display(" a=%b b=%b c=%b d=%b e=%b",a,b,c,d,e);
         
	   $display(" x(a&&b)=%0b y(a||c)=%0b  z(!b&&a)=%0b s(a&&e)=%0b",x,y,z,s);
           #10;
	   x=&a;
	   y=~^b;
	   z=~c;
	   s=|e;
		$display(" a=%b b=%b c=%b d=%b e=%b",a,b,c,d,e);
	   $display(" x(&a)=%0b y(~^b)=%0b  z(~c)=%0b s(|e)=%0b",x,y,z,s);
	   #10;
	   x=a>>>1;
	   y=e>>>3;
      z=b<<4;
	   s=e<<1; 
		$display(" a=%b b=%b c=%b d=%b e=%b",a,b,c,d,e);
	   $display(" x(a>>>1)=%b y(e>>>3)=%b  z(b<<4)=%b  s(e<<1)=%b",x,y,z,s);
	   #10;
         end
 endmodule	 


	   



     	   
