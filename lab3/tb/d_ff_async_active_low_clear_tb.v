

module d_ff_async_active_low_clear_tb();
// declaring the regs and wires

   reg d,clock,clear,preset;
   wire q,qbar;
// using d ff instnace

	
	d_ff_async_activ_low_clr DUT(d,clear,preset,clock,q,qbar);



// creatng tasks for initil;izwe all inital valjues

  /*task initilize;
    begin
        {d}=0;
    end
  endtask*/
//  generating clock
   initial 
      begin
        clock=1'b0;
        forever
        #10 clock = ~clock;
       end	  

// creating task for input driving 

  task inputs(input m);
      begin
      	@(posedge clock)
         d=m;
       end
   endtask

// creating task for active low clear

 task clr(input n);
    begin
       //@(negedge clock)
        #5 clear = n;
	    /*@(negedge clock)
	     clear = ~n;*/
     end
   endtask  

// creating task for preset

  task presetting(input k);
       begin
          @(negedge clock)
          preset = k;
          /*@(posedge clock)
          preset = ~k;*/
       end
   endtask
// test cases 

  initial
    begin
     // initilize;
      clr(1'b0);
		clr(1'b1);
		$display(" d =%b clear = %b preset =%b output q=%b ",d,clear,preset,q);
      inputs(1);      
      inputs(0);      
      inputs(0);      
      inputs(1);      
      inputs(1);       
      inputs(0);      
      inputs(0);      
      inputs(0);
		$display($time," d =%b clear = %b preset =%b output q=%b ",d,clear,preset,q);
      presetting(1'b1);
	   presetting(1'b0);

		/*$display($time," d =%b clear = %b preset =%b output q=%b ",d,clear,preset,q);
      #10;
      $display($time," d =%b clear = %b preset =%b output q=%b ",d,clear,preset,q);      
      inputs(0);      
      inputs(1);
		$display($time," d =%b clear = %b preset =%b output q=%b ",d,clear,preset,q);
		clr(1'b0);
		$display($time," d =%b clear = %b preset =%b output q=%b ",d,clear,preset,q);
		inputs(0);
      presetting(1'b1);  
      $display($time," d =%b clear = %b preset =%b output q=%b ",d,clear,preset,q);		
      inputs(0);      
      inputs(1);      
      inputs(1);
		$display($time," d =%b clear = %b preset =%b output q=%b ",d,clear,preset,q);
      clr(1'b0);
		$display($time," d =%b clear = %b preset =%b output q=%b ",d,clear,preset,q);
       #10;      
      inputs(0);
		
		presetting(1'b1);
		$display($time," d =%b clear = %b preset =%b output q=%b ",d,clear,preset,q);
		inputs(0);
		presetting(1'b1);
		$display($time," d =%b clear = %b preset =%b output q=%b ",d,clear,preset,q);*/
		    		
     end	
initial #1000 $finish;
endmodule         
       
