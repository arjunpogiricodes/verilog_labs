

 module decoder_3_to_8_tb();

// declaring regs nad wires

 reg a,b,c;
 wire [7:0]y;

 integer i,j,k;

// using decoder 3 to 8 instance

 decoder_3_to_8 DUT(a,b,c,y);

// declaring that input values at time =o 
 initial 
      begin
     {a,b,c}=0;
      end
// giving test bench casess using for loop

 initial  
      begin
         for(i=0;i<8;i=i+1)
		        begin
	            a=i;
               for(j=0;j<8;j=j+1)
		             begin
			          b=j;
						 #10;
                   for(k=0;k<8;k=k+1)
		                 begin
				           c=k;
							  #10;
			              end
		             end
		         #10;	
	          end
      end
 
// momoter the values

initial 
 $monitor(" a = %b , b =%b , c=%b , output y=%b ",a,b,c,y);
endmodule	
