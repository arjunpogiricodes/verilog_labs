


 module task_mux_8_to_1_tb();

// declaring the reg and wirs
 reg [7:0]i;
 reg [2:0]s;
 wire out;
 //integer j;
 //integer k;

// using mux 8to1 instance  

 task_mux_8_to_1 DUT(i,s,out);
// creating task for intilizing values 
  
 task initilize;
   begin
     {i,s}=0;
   end
 endtask
// creating task for taking  input values of i

 task input_i(input [7:0]m);
     begin
	   i=m;
     end
  endtask
// creating task for taking command input of selectoins lins s

 task selection_s(input [2:0]f);
      begin
        s=f;
      end
  endtask

// creating delay task reusing
 
 task delay;
    begin
      #10;
    end
  endtask
// using above tasks crating different test cases

 initial 
    begin
  //    for(j=256;j>0;j=j-1)
   //      begin
			//delay;
	//      for(k=8;k>0;k=k-1)
    //          begin
	           forever
				  begin
				  input_i({$random}%256);
		        selection_s({$random}%8);
		        delay;
              end				  
	          // end
        //  end
    end
// using monitor to monitor the values

 initial
  //begin
   $monitor("i=%b\ns=%b\nout=%b " ,i,s,out);
	//#1000$finish;
  //end	
endmodule	 
                     
      	      

 
