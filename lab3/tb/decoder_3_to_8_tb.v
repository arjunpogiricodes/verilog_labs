

module decoder_3_to_8_tb();

// declaring the regs and wires

 reg [2:0]i;
 wire [7:0]y;
// using instance 

 decoder_3_to_8 DUt(i,y);

// creating task for initilize the inital values

 task initilize;
   begin
     i=0;
   end
  endtask

// creating the task for driving the inputs

 task inputs(input [2:0]m);
    begin
      i=m;
    end
 endtask
// using procedural block

   initial
      begin
        initilize;
       repeat(30)
         begin
	   inputs({$random}%8);
           #10;
         end
      end
// using monitor to check the values

 initial
    $monitor(" input =%b output =%b " , i,y);
endmodule	 
