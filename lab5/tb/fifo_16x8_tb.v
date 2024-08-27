


module fifo_16x8_tb();

// declaring the regs and wires
   
    reg clk,reset,read_en,write_en;
    reg  [7:0]data_in;
    wire full,empty;
    wire [7:0]data_out;
    integer j;

   
// instantiating
fifo_16x8  DUT(.clk(clk),.reset(reset),.data_in(data_in),.read_en(read_en),.write_en(write_en),.data_out(data_out),.full(full),.empty(empty));



//genrating the clk puls

 always #10 clk =~clk;

// creating the task for initialize the values

task initialize;
    begin
     {clk,read_en,write_en}=0;
    end
 endtask 

// creating the task for data driving

 task write(input [7:0]m);
  begin
   @(negedge clk)
   write_en =1'b1;

	data_in =m;  
	//@(negedge clk)
   //write_en =1'b0;
  end
 endtask
 
 
 task write_dis;
  begin
   @(negedge clk)
	 write_en=1'b0;
	end
 endtask	

// creating the task reading the data

 task read;
  begin	  
      @(negedge clk)
      read_en =1'b1;
  end
 endtask
 
 
  task read_dis;
    begin
	   @(negedge clk)
		 read_en =1'b0;
	  end
  endtask	  

//creating the task for reset

  task reset_data;
    begin
	     @(negedge clk)
		  reset =1'b0;
		  @(negedge clk)
		  reset =1'b1;
	 end
 endtask
  
 
// initializing the case tesets

  initial 
     begin
       initialize;
		 #10;
		 reset_data;
       //repeat(5)
        // begin
            for(j=0;j<16;j=j+1)
	         begin
	          write({$random}%256);
				 #10;
				 if(full)
				 write_dis;
				// end
				 //read;
				// #10;
				// read_dis;
	          $display($time," reset =%b write_en =%b read_en = %b  data_in =%b data_out =%b full = %b empty = %b ", reset,write_en,read_en,data_in,data_out,full,empty);
             end
				
				 //write_dis;  
           for(j=0;j<16;j=j+1)
	          begin
	          read;
	          $display($time," reset =%b write_en =%b read_en = %b  data_in =%b data_out =%b full = %b empty = %b ", reset,write_en,read_en,data_in,data_out,full,empty);
             end
				 read_dis;
         //end
       end
endmodule	  
     
   	 

      

	 
 
