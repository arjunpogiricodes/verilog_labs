

module dual_port_sync_16x8_ram_tb();

// declarin the reg and wires

    reg clk,reset,re,we;
    reg [7:0]data;
    reg [3:0]r_add,w_add;
    wire [7:0]out;
    //integer j,k;
	 //reg [7:0]temp;
// using instantiating

 dual_port_sync_16x8_ram  DUT(.clk(clk),.reset(reset),.re(re),.we(we),.r_add(r_add),.w_add(w_add),.data_in(data),.data_out(out));
// using conditional oparetor 
 
  //assign out=(re)?data:8'hzz;
// initilize the values

 task initilize;
    begin
      {clk,reset,re,we,data,r_add,w_add} =0;
    end
  endtask

// generating infinte clk

 always #10 clk =~clk;

// creating the task for  reset

   task reset_en;
       begin
         @(negedge clk)
	       reset = 1'b1;
	      @(negedge clk)
	       reset = 1'b0;
       end
   endtask
// creating the task for write enable  
  task write_enable;
        begin
         @(negedge clk)
          we =1'b1;
			 #5 re =1'b0;
         end
    endtask	 
//  creating the task for write some data driving

  task write(input [7:0]m);
      begin
		 // @(negedge clk)
        if(we)
        data=m;
      end
   endtask
// creating task for write adddr
    
   task write_addr(input [3:0]n);
         begin
			  @(negedge clk)	
           if(we)
	          w_add=n;
        end
  endtask
// creating the task for read enable

  task read_enable;
      begin
         @(negedge clk)
			 we =1'b0;
          #5 re =1'b1;			

       end
  endtask		 
// creating the task for read the data from the addres

  task read_addr(input [3:0]p);
      begin
		   @(negedge clk) 
         if(re)
         r_add=p;
      end
   endtask   
       	       
// creating the task procedural block driving some test cases

  initial
     begin
       initilize;
       reset_en;
       write_enable;
      /* repeat(20)
       begin
       write_addr({$random}%16);
       write({$random}%256);
       $display(" write addr = %d  data =%b ",w_add,data);
       end
       read_enable;
       repeat(20)
       begin
       read_addr({$random}%16);	
       $display(" read addr = %d  data_out =%b ",r_add,out);
       end */

       write_addr(4'b0000);
       write(8'haa);
		  $display(" write addr = %d  data =%b ",w_add,data);
       write_addr(4'b0001);
       write(8'h12);
		  $display(" write addr = %d  data =%b ",w_add,data);
       write_addr(4'b1100);
       write(8'b11110011);
		  $display(" write addr = %d  data =%b ",w_add,data);
       write_addr(4'b0011);
       write(8'd99);
		  $display(" write addr = %d  data =%b ",w_add,data);
       write_addr(4'b1111);
       write(8'b01010101);
		  $display(" write addr = %d  data =%b ",w_add,data);
       write_addr(4'b1001);
       write(8'hcd);
       $display(" write addr = %d  data =%b ",w_add,data);		 
       read_enable;       
       read_addr(4'b0000);
       $display(" read addr = %d  data_out =%b ",r_add,out);
       read_addr(4'b0001);
       $display(" read addr = %d  data_out =%b ",r_add,out);
       read_addr(4'b1100);
       $display(" read addr = %d  data_out =%b ",r_add,out);
       read_addr(4'b0011);
        $display(" read addr = %d  data_out =%b ",r_add,out);
       read_addr(4'b1111);
       $display(" read addr = %d  data_out =%b ",r_add,out);
       read_addr(4'b1001);
       $display(" read addr = %d  data_out =%b ",r_add,out);		 
	 
     end
endmodule     
       	       

 
             
            
    

