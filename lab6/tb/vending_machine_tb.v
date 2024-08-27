


module vending_machine_tb();

// declaring the regs and wires

     reg reset,clk;
     reg [1:0]coin_in;
     wire product,change;

//instantiating       

vending_machine DUT(.clk(clk),.reset(reset),.coin_in(coin_in),.product(product),.change(change));

// creatingt the task for initialize

 task initialize;
    begin
      {clk,coin_in}=0;
    end
  endtask

// generating the clk puls

 always #10 clk = ~clk;

// creating the task for reset 

  task reset_data;
     begin
      @(negedge clk)
       reset =1'b1;
      @(negedge clk)
       reset =1'b0;
     end
  endtask

// creating the task for driving the inputs for coin in

  task  coin(input [1:0]m);
      begin
      @(negedge clk)
      coin_in = m;
     end
   endtask
// giving the logic for different inputs

  initial
    begin
     initialize;
     reset_data;
     //repeat(20)
     //begin	     
     coin(2'b00);
     $display(" present state = %b  din = %b  product = %b change =%b ", DUT.present_state,coin_in,product,change);
     //end
	  coin(2'b10);
     $display(" present state = %b  din = %b  product = %b change =%b ", DUT.present_state,coin_in,product,change);
	  coin(2'b11);
     $display(" present state = %b  din = %b  product = %b change =%b ", DUT.present_state,coin_in,product,change);
	  coin(2'b11);
     $display(" present state = %b  din = %b  product = %b change =%b ", DUT.present_state,coin_in,product,change);
	  coin(2'b11);
     $display(" present state = %b  din = %b  product = %b change =%b ", DUT.present_state,coin_in,product,change);
	  coin(2'b11);
     $display(" present state = %b  din = %b  product = %b change =%b ", DUT.present_state,coin_in,product,change);
	  coin(2'b01);
	  coin(2'b00);
     $display(" present state = %b  din = %b  product = %b change =%b ", DUT.present_state,coin_in,product,change);
	  coin(2'b10);
     $display(" present state = %b  din = %b  product = %b change =%b ", DUT.present_state,coin_in,product,change);
	  coin(2'b10);
     $display(" present state = %b  din = %b  product = %b change =%b ", DUT.present_state,coin_in,product,change);
	  coin(2'b10);
     $display(" present state = %b  din = %b  product = %b change =%b ", DUT.present_state,coin_in,product,change);

	  coin(2'b00);
     $display(" present state = %b  din = %b  product = %b change =%b ", DUT.present_state,coin_in,product,change);
	  coin(2'b10);
     $display(" present state = %b  din = %b  product = %b change =%b ", DUT.present_state,coin_in,product,change);
	  coin(2'b10);
     $display(" present state = %b  din = %b  product = %b change =%b ", DUT.present_state,coin_in,product,change);
	  reset_data;
	  coin(2'b10);
     $display(" present state = %b  din = %b  product = %b change =%b ", DUT.present_state,coin_in,product,change);
	  
	  
     #10;
     $finish;
    end
 endmodule    

