

module load_4bit_sync_up_counter_tb();
// declaring the reg and wires

  reg clk,load,reset;
  reg [3:0]data;
  wire [4:0]count;
  integer i;
// instantiating
 
  load_4bit_sync_up_counter DUT(.clk(clk),.reset(reset),.load(load),.data_in(data),.count(count));

// task  iniktlizing
  
task initilize;
   begin
     {reset,load,clk}=0;
   end
endtask   
// generating clk

always #5 clk =~clk;

// creating task for load and data in

task inputs(input m,input [3:0]n);
  begin
   @(negedge clk)
    load =m;
   @(negedge clk)
     data=n;
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
  

// procudural for teset cases

 initial
   begin
     initilize;
	  reset_in;
     begin
     inputs(1'b0,4'b0001);
     end
   end
 initial
  begin
  for(i=0;i<16;i=i+1)
  begin
  $display(" count=%d " ,count);
  #5;
  end
  end

endmodule   
 
