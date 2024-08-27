

module siso_tb();
// declaring regs and wires

  reg clk,reset,data_in;
  wire data_out;
   

  siso DUT(.data_in(data_in),.clk(clk),.reset(reset),.data_out(data_out));

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

endmodule
