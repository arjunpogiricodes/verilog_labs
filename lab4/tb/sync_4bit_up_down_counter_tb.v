



module sync_4bit_up_down_counter_tb();
// declaring the reg and wires

  reg clk,load,reset,mode;
  reg [3:0]data;
  wire [3:0]cout;
  integer i;
// instantiating
 
  sync_4bit_up_down_counter  DUT(.clk(clk),.reset(reset),.load(load),.mode(mode),.data_in(data),.cout(cout));

// task  iniktlizing
  
task initilize;
   begin
     {reset,load,clk,mode}=0;
   end
endtask   
// generating clk

always #5 clk =~clk;

// creating task for load and data in

task load_inputs(input m,input [3:0]n);
  begin
   @(negedge clk)
    load =m;
	 data=n;
   @(negedge clk)

     load= 1'b0;
  end
 endtask
 
 // reset task

 task reset_in; 
  begin
  @(negedge clk)
  reset =1'b0;
  @(negedge clk)
  reset =1'b1;
  end
  endtask
// mode task

 task mode_in(input m);
    begin
      @(negedge clk)	    
       mode=m;
    end
 endtask    
 	    

// procudural for teset cases

 initial
   begin
     initilize;
     reset_in;
     begin
     #80;	     
     load_inputs(1'b1,4'b0111);
     #50;
     mode_in(1'b1);
     #60;
     load_inputs(1'b1,4'b0111);
     end
   end
 initial
  begin
  for(i=0;i<16;i=i+1)
  begin
  $display(" count=%d " ,cout);
  #5;
  end
  end

endmodule   
 

