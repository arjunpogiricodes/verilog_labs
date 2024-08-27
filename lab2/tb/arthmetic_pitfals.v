



module arithmetic_pitfals();
 integer i;
 reg [15:0] a,z;
   initial
        begin
           a=4'd12;
	   $display(" a=%b a=%d",a,a);
		     #10;
           a=-4'd12;
	   $display(" a=%b a=%d",a,a);
				#10;
           z=a/3;
	   $display(" z=%b z=%d",z,z);
		  #10;
		 i=-12/3;
		 $display(" i=%b i=%d",i,i);
         #10;
        i=-'d12/3;
        a=-12/3;
       	$display(" a=%b a=%d i=%b i=%d",a,a,i,i);	  
         end
endmodule	 
