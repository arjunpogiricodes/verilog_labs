

module priority_encoder_8_to_3_tb();
// delcaring the regs and wires

  reg [7:0]i;
  wire [2:0]y;
  wire v;
// using instance of priority encoder

  priority_encoder_8_to_3 DUT(i,y,v);
 
// creating the task for inital values

  task initialize;
    begin
     i=0;
    end
  endtask
// drive the inputs 

 task inputs(input [7:0]m);
    begin
      i=m;
    end
  endtask

// using procedural block

 initial
    	 
     begin
	    initialize;
       inputs(8'b00000000);
		 #10;
       repeat(50)
       begin
       inputs({$random}%256);
       #10;
       end     
      end
// monitor the values

  initial
    $monitor("input =%b\noutput =%b\nvalid=%b " , i,y,v);
endmodule	  
