



module sipo_tb();
// declaring regs and wires

  reg clk,reset,data_in;
  wire [3:0]out;
   

  sipo DUT(.data_in(data_in),.clk(clk),.reset(reset),.out(out));

  task initilize;
      begin
         {data_in,clk}=0;

      end
  endtask

// gegenrating clk
   always #10 clk=~clk; 

// drive inputs to data_in

  task inputs(input m);
      begin
	 @(negedge clk)     
         data_in=m;
       end
   endtask

  task reset_in;
       begin
          @(negedge clk)
           reset=1'b1;
          @(negedge clk)
           reset=1'b0;
        end
   endtask

// procedural block for test cases

  initial
      begin
        initilize;
        reset_in;
		  repeat(20)
		  begin
        inputs(1'b0);
        inputs(1'b1);
        inputs(1'b1);
        inputs(1'b0);
        inputs(1'b0);
        inputs(1'b1);
        inputs(1'b0);
        inputs(1'b1);	        
	     inputs(1'b1);
        inputs(1'b0);
        inputs(1'b1);
        inputs(1'b0);
	     reset_in;
	     inputs(1'b1);
        inputs(1'b0);
        inputs(1'b1);
        inputs(1'b0);
		  end
       end

endmodule
