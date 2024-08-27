

module dual_port_async_8x16_ram_tb();

// declarin the reg and wires

    reg w_clk,reset,re,we;
    reg [15:0]data_in;
    reg [2:0]r_add,w_add;
    wire [15:0]out;
	
// using instantiating

 //dual_port_sync_16x8_ram  DUT(.clk(clk),.reset(reset),.re(re),.we(we),.r_add(r_add),.w_add(w_add),.data_in(data),.data_out(out));

 
dual_port_async_8x16_ram DUT(.reset(reset),.data_in(data_in),.w_clk(w_clk),.w_addr(w_add),.we(we),.re(re),.r_addr(r_add),.data_out(out));
// initilize the values

 task initilize;
    begin
      {w_clk} =0;
    end
  endtask

// generating infinte clk

 always #10 w_clk =~w_clk;

 //always #10 r_clk =~r_clk;


// creating the task for  reset

   task reset_en;
       begin
           
	       #5 reset = 1'b0;

	       #10 reset = 1'b1;
       end
   endtask
// creating the task for write enable  
  task write_enable;
        begin
         @(negedge w_clk)
             we =1'b1;
	       #5 re =1'b0;
         end
    endtask	 
//  creating the task for write some data driving

  task write(input [15:0]m);
      begin
        // @(negedge w_clk)
        if(we)
        data_in=m;
      end
   endtask
// creating task for write adddr
    
   task write_addr(input [2:0]n);
         begin
	  @(negedge w_clk)	
           if(we)
	        w_add=n;
        end
  endtask
// creating the task for read enable

  task read_enable;
      begin
         @(negedge w_clk)
	     we =1'b0;
          #5 re =1'b1;			

       end
  endtask		 
// creating the task for read the data from the addres

  task read_addr(input [2:0]p);
      begin
		   @(negedge w_clk) 
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

       write_addr(3'b000);
       write(16'haaab);
		  $display(" write addr = %d  data =%b ",w_add,data_in);
       write_addr(2'b001);
       write(16'h1279);
		  $display(" write addr = %d  data =%b ",w_add,data_in);
       write_addr(3'b110);
       write(16'b1111_0011_1111_0000);
		  $display(" write addr = %d  data =%b ",w_add,data_in);
       write_addr(3'b011);
       write(16'd9999);
		  $display(" write addr = %d  data =%b ",w_add,data_in);
       write_addr(3'b111);
       write(16'b0000_1111_0101_0101);
		  $display(" write addr = %d  data =%b ",w_add,data_in);
       write_addr(3'b101);
       write(16'hcd12);
       $display(" write addr = %d  data =%b ",w_add,data_in);		 
       read_enable;       
       read_addr(3'b000);
       $display(" read addr = %d  data_out =%b ",r_add,out);
       read_addr(3'b001);
       $display(" read addr = %d  data_out =%b ",r_add,out);
       read_addr(3'b110);
       $display(" read addr = %d  data_out =%b ",r_add,out);
       read_addr(3'b011);
        $display(" read addr = %d  data_out =%b ",r_add,out);
       read_addr(3'b111);
       $display(" read addr = %d  data_out =%b ",r_add,out);
       read_addr(3'b101);
       $display(" read addr = %d  data_out =%b ",r_add,out);		 
	 
     end
endmodule     
       	       

 
             
            
    


