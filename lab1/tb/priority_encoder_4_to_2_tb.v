

module priority_encoder_4_to_2_tb();

//declaring reg ans wires

 reg i0,i1,i2,i3;
 wire out1,out2;
 integer j;

//using encoder instance

 priority_encoder_4_to_2 DUT(i0,i1,i2,i3,out1,out2);

// assigning input values at time=0

 initial 
     begin
	 {i0,i1,i2,i3}=4'b0000;
     end
// giving possible test cases

 initial 
     begin
        for(j=0;j<16;j=j+1)
          begin
	         {i0,i1,i2,i3}=j;
		         #10;
          end
     end

// monitor the values
 
 initial
   $monitor(" input values i0,i1,i2,i3=%b%b%b%b output out1=%b,out2=%b",i0,i1,i2,i3,out1,out2);
 endmodule    

            		  

