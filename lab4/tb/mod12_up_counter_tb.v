

module mod12_up_counter_tb();
// declaring the reg and wires

  reg clk,load,reset;
  reg [3:0]data;
  wire [3:0]count;
  integer i;
// instantiating
 
  mod12_up_counter DUT(.clk(clk),.reset(reset),.load(load),.data_in(data),.cout(count));
 
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
  

// procudural for teset cases

 initial
   begin
     initilize;
	  reset_in;
     begin
	  #170;
     inputs(1'b1,4'b0011);
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
 

