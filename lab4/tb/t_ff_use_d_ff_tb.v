

module t_ff_use_d_ff_tb();

// reg anf wires declaration

 reg t,clk,clear;
 wire q,qbar;

//instantiating

 t_ff_use_d_ff  DUT(.t(t),.clk(clk),.cleart(clear),.qt(q),.qbart(qbar));

// clock generation

 initial
   begin
    clk=1'b0;
    forever
     #5 clk=~clk;
   end
// task for initlize

 task initilize;
     begin
      t=0;
     end
 endtask
 // task creating for clear
  task clear_in;
  begin
   @(negedge clk)
	 clear =1'b1;
   @(negedge clk)
    clear =1'b0;	
	 end
	 endtask

// task for input driving for t 

 task t_inputs(input m);
   begin
   @(negedge clk)
   t=m;
  end
 endtask

// using procedural block

 initial
    begin
      initilize;
      repeat(20)
       begin
		   clear_in;
         t_inputs({$random}%2);
	      $display(" t=%b q =%b qbar =%b ",t,q,qbar);	
         t_inputs({$random}%2); 
         $display(" t=%b q =%b qbar =%b ",t,q,qbar);	 
         t_inputs({$random}%2);
			#10;
         $display(" t=%b q =%b qbar =%b ",t,q,qbar);		 
         t_inputs({$random}%2);  
         $display(" t=%b q =%b qbar =%b ",t,q,qbar);		 
         t_inputs({$random}%2);
			#10
         $display(" t=%b q =%b qbar =%b ",t,q,qbar);		 
         t_inputs({$random}%2);    
	      $display(" t=%b q =%b qbar =%b ",t,q,qbar);
         #10;			
       end
    end    
endmodule
   
