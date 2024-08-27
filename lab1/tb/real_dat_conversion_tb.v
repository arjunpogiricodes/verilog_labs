



 module real_data_conversation_tb();

// declaration of input and output ports
 reg [63:0]a;
 time sim_time;
 real r;
 real y;
	    	 
  initial 
     begin
       r = 105.676;
       #10;
		 sim_time = $time;
		 a=$realtobits(r);
		 $display(" sim_time=%0t ",sim_time); 	
     end
  

 initial 0
   begin
    
     #100;
	  y=$bitstoreal(a);
	  sim_time = $time;
     $display(" r =%0.3f ",r); 
     $display(" a =%b",a); 	 
     $display(" y =%0.3f",y); 	 
     $display(" sim_time=%0t ",sim_time); 	 	
   end	  
 endmodule   

