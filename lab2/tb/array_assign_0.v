


 module array_assining();
  
// declaring the reg and wires

 reg [8:0]memo[9:0];
 integer i;

// using for loop assign 0 to all locations

 initial
     begin
	   
       for(i=0;i<10;i=i+1)
        begin 
	     memo[i] = 0;
		  //#1;
		   $display("memo[%0d]=%b ",i,memo[i]);
		  end
         
      end
// monitor the values 

 //initial
  // $monitor(" memo[%0d]=%b ",i,memo[i]);
 endmodule	 
