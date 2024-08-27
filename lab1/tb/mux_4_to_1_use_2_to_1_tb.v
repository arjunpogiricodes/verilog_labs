
 module mux_4_to_1_use_2_to_1_tb();

// declaring regs and wires

 
 reg s0,s1,i0,i1,i2,i3;
 wire y;
 integer i;
// instance using
  mux_4_to_1_use_decoder DUT(s0,s1,i0,i1,i2,i3,y); 

// initial the values of inputs at time=0 
 
 initial 
      begin
	  {s0,s1,i0,i1,i2,i3}=6'b000000;
      end

// initial  the for loop for posssible test cases
 
 initial 
      begin
	  for(i=0;i<31;i=i+1)
	       begin
	        {s0,s1,i0,i1,i2,i3}=i;
	         #50;
	        end
       end
// moniter the values

 initial
     $monitor(" the value of s0=%b , s1=%b , i0=%b , i1=%b , i2=%b , i3=%b",
	  s0,s1,i0,i1,i2,i3);
  endmodule




