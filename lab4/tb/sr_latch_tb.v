
module sr_latch_tb();
// declarin the regs and wires

  reg s,r;
  wire q,qbar;
  //reg stemp,rtemp;

// instantiating sr latch

 sr_latch DUT(.s(s),.r(r),.q(q),.qbar(qbar));
 //sr_latch(s,r,q,qbar);

// creating task for initlizing values
   
  task initilize;
      begin
        {s,r}=2'b00;
      end
   endtask
// creating task for driving inputs

  task sr_inputs(input [1:0]m);
    begin
       {s,r}=m;     
     end
  endtask

// using procedural block
  initial 
    begin   
    initilize;
	  #10;
   repeat(20)
    begin
	sr_inputs(2'b01);
	  #10;
	sr_inputs(2'b10);
	  #10;
	sr_inputs(2'b00);
	  #10;
	sr_inputs(2'b11);
	  #10;
	sr_inputs(2'b00);
	  #10;
	sr_inputs(2'b00);
	  #10;
	sr_inputs(2'b00);
	  #10;
	sr_inputs(2'b00);
	  #10;
	sr_inputs(2'b00);
	  #10;
	sr_inputs(2'b01);
	  #10;
	sr_inputs(2'b10);
	  #10;
	$display("sr = %b%b q= %b qbar =%b ", s,r,q,qbar);
	  #10;
	  end
     end
endmodule    




