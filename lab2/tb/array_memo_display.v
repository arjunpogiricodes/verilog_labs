



 module memory_display();

// declaring the reg and wires

 reg [7:0]mem1;
 reg [7:0]mem2[0:3];
 integer i;

// initiating some values to the memory array
 initial
    begin
      mem1=8'ha9;
      $display("memory1 = %0h " ,mem1);
      mem2[0]=8'haa;      
      mem2[1]=8'hbb;      
      mem2[2]=8'hcc;      
      mem2[3]=8'hdd;
      for(i=0;i<4;i=i+1)
	 begin
           $display("memory2[%0d] = %0h " ,i,mem2[i]);
	   #10;
          end 
    end
 endmodule    
	    	 

