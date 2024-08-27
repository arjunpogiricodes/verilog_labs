

module jkff_tb();

// declaring the reg and wires

  reg clk,reset,preset,j,k;
  wire q,qbar;
 // parameter NC=2'b00, RESET=2'b01 , SET=2'b10 , TOGGLE = 2'b11;

// Instantiate the design
 
  jkff  DUT(j,k,clk,reset,preset,q,qbar);
// inilize the values

  task initilize;
    begin
	 {j,k} = 2'b00;
	 clk = 1'b0;
	 end
	 endtask
// generating the clock

 always #5 clk = ~clk;
// creating task for driving j k  inputs

  task jk_inputs(input m,n);
     begin
	    @(negedge clk)
       j=m;
	    k=n;
      end
  endtask

// creating task  driving inputs for reset  
 
  task rst_input;
     begin    
      @(negedge clk)
       reset = 1'b1;
      @(negedge clk)
       reset = 1'b0;
      end
  endtask
// creating task for driving inputs for preset

  task pre_input;
     begin
      @(negedge clk)
       preset =1'b1;
      @(negedge clk)
        preset = 1'b0;
      end
   endtask
// using procedural block

  initial
      begin
         initilize;
  	 repeat(20)
         begin
           rst_input;
           jk_inputs({$random}%2,{$random}%2);
	   $display($time," j,k =%b%b reset =%b preset =%b \n\tq=%b qbar =%b " , j,k,reset,preset,q,qbar);
	   jk_inputs({$random}%2,{$random}%2);
	   pre_input;
           $display($time," j,k =%b%b reset =%b preset =%b \n\tq=%b qbar =%b " , j,k,reset,preset,q,qbar);
           jk_inputs({$random}%2,{$random}%2);
          jk_inputs({$random}%2,{$random}%2);
          pre_input;
	  jk_inputs({$random}%2,{$random}%2);
	  jk_inputs({$random}%2,{$random}%2);	     
          rst_input;
	  $display($time," j,k =%b%b reset =%b preset =%b \n\tq=%b qbar =%b " , j,k,reset,preset,q,qbar);
          jk_inputs({$random}%2,{$random}%2);
          jk_inputs({$random}%2,{$random}%2);
	  $display($time," j,k =%b%b reset =%b preset =%b \n\tq=%b qbar =%b " , j,k,reset,preset,q,qbar);

        end
     end
	  
	  
  
endmodule    

        	


