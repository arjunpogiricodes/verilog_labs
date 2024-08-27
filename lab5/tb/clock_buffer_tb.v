
module clock_bufffer_tb();


// declaring the regs and ports

  reg master_clk;
  wire slave_clk;

  time t1,t2,t3,t4,t5,t6;
// instantiating 
  
  clock_buffer DUT(.master_clk(master_clk),.slave_clk(slave_clk));

 task initialize;
   begin
    master_clk = 0;
   end
 endtask
// generating clk

 always #5 master_clk = ~master_clk;

// measure the master clock 
  task measure_master_clk;
     begin
       @(posedge master_clk)
        t1=$time;
       @(posedge master_clk)	
        t3=$time;
     end
	  endtask
 

// mesure the slave clock 
 
    task measure_slave_clk;

     begin
       @(posedge slave_clk)
        t2=$time;
       @(posedge slave_clk)	
        t4=$time;
     end
	  endtask
 


// using procedurral blok for checking the 


  initial
      begin
		initialize;

		fork
	   measure_master_clk;
	   measure_slave_clk;
		join
		
		t5 = t3 - t1;
		t6 = t4 - t2;
	   if((t2==t1) && (t4==t3))
      $display(" master and slave have same phases");
      else
      $display(" master and slave have different phases");
		 
       if(t5==t6)
	    $display(" master and slave have same frequncy ");
       else
	    $display(" master and slave have different frequancy	");
      end
endmodule        







	      
