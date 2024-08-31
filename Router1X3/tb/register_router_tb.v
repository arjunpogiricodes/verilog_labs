

module register_router_tb();

// declaring the regs and wires 

      reg clk,reset,pkt_valid,fifo_full,rst_int_reg,detect_add,ld_state,laf_state,full_state,lfd_state;
      reg [7:0]data_in;
      wire error,low_pkt_valid,parity_done;
      wire [7:0]dout;
      integer z;

// instantiating

    register_router  DUT(clk,reset,pkt_valid,data_in,fifo_full,rst_int_reg,detect_add,ld_state,laf_state,full_state,lfd_state,parity_done,low_pkt_valid,error,dout);
  //register_router(clk,reset,pkt_valid,data_in,fifo_full,rst_int_reg,detect_add,ld_state,laf_state,full_state,lfd_state,parity_done,low_pkt_valid,error,dout);

// initialize the values in task

   task initialize;
         begin
           {clk,fifo_full,rst_int_reg,detect_add,laf_state,full_state,lfd_state}=0;
         end
    endtask

// generating clk

   always #5 clk=~clk;

// reset task

   task reset_n;
	begin
	    @(negedge clk)
             reset=1'b0;
            @(negedge clk)
             reset=1'b1;
       end
   endtask

// driving some data to register 

   task packet1;
			 reg [7:0]payload_data,parity,header;
          reg [5:0]lenth;
          reg [1:0]address;
	      begin   		   
	  @(negedge clk)
	  lenth = 6'd10;
	  pkt_valid =1'b1;
	  detect_add =1'b1;
	  address=2'd1;
	  header = {lenth,address};
	  data_in =header;
     @(negedge clk)
	  fifo_full =1'b0;
	  full_state=1'b0;
	  lfd_state =1'b1;
	  detect_add=1'b0;
	  laf_state =1'b0;
           for(z=0;z<lenth;z=z+1)
	         begin
            @(negedge clk)
             lfd_state =1'b0;
             ld_state =1'b1; 				
	          payload_data={$random}%256;
				 data_in=payload_data;
            end
           @(negedge clk)
			  //ld_state=1'b0;  
           pkt_valid=1'b0;
			  data_in = {$random}%256;
			  @(negedge clk)
			  ld_state=1'b0;
			  
       end
  endtask
  

   task packet2;
			 reg [7:0]payload_data,parity,header;
          reg [5:0]lenth;
          reg [1:0]address;
	      begin   		   
	  @(negedge clk)
	  lenth = 6'd5;
	  pkt_valid =1'b1;
	  detect_add =1'b1;
	  address=2'd2;
	  header = {lenth,address};
	  data_in =header;
	  parity=header^0;
     @(negedge clk)
	  fifo_full =1'b0;
	  full_state=1'b0;
	  lfd_state =1'b1;
	  detect_add=1'b0;
	  laf_state =1'b0;
           for(z=0;z<lenth;z=z+1)
	         begin
            @(negedge clk)
             lfd_state =1'b0;
             ld_state =1'b1; 				
	          payload_data={$random}%256;
				 data_in=payload_data;
				 parity=parity^data_in;
            end
           @(negedge clk)
			  //ld_state=1'b0;  
           pkt_valid=1'b0;
			  data_in = parity;
			  @(negedge clk)
			  ld_state=1'b0;
			  
       end
  endtask  
// including all the tasks 

   initial
         begin
	      $monitor($time," error = %b data_out =%b low_pkt_valid = %b parity done =%b packet_parity_byte = %b intenal_parity_byte = %b header_byte = %b ",error,dout,low_pkt_valid,parity_done,DUT.packet_parity_byte,DUT.internal_parity_byte,DUT.header_byte);	      
              initialize;
	      reset_n;
	      #10;
	      packet1;
	      
	      #20;
	       packet2;

        end
endmodule     	






