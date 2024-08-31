


module fifo_16x9_router_tb();

// declaring the reg and wires

   reg clk,reset,write_en,read_en,soft_reset,lfd_state;
   reg [7:0]data_in;
   wire full,empty;
   wire [7:0]data_out;
   integer j;
 
// instantiating the rtl file   
 
   fifo_16x9_router DUT(.clk(clk),.reset(reset),.data_in(data_in),.write_enb(write_en),.read_enb(read_en),.soft_reset(soft_reset),.lfd_state(lfd_state),.full(full),.empty(empty),.data_out(data_out));

// creating task for initialize

  task initialize;
        begin
            {clk,write_en,read_en,soft_reset,lfd_state}=0;
        end
   endtask

// genertating the clock pulse 

   always #5 clk=~clk;

// creating task for reset  

   task reset_n;
       begin
        @(negedge clk)
          reset=1'b0;
        @(negedge clk)
          reset=1'b1;
       end
    endtask       
// creating the task soft_reset

   task soft_reset_p;
        begin
         @(negedge clk)
           soft_reset =1'b1;
         @(negedge clk)
           soft_reset =1'b0;
        end
   endtask

// writing some packets to fifo 
/* packet having the header byte and playload and finally pairt byte all the
things we createg */   

   task writing_pkt1;
       begin:B
	    reg [7:0]playload_data,parity,header;
	    reg [5:0]playload_len;
	    reg [1:0]destin_addr;
	    @(negedge clk)
	    lfd_state =1'b1;
	    write_en=1'b1;
	    destin_addr = 2'b01;
	    playload_len= 6'd10;
	    header = {playload_len,destin_addr};
	    data_in = header;
	   // lfd_state = 1'b0;
	    for(j=0;j<playload_len;j=j+1)
	        begin
	             @(negedge  clk)
                     lfd_state = 1'b0;		     
           	     playload_data = {$random}%256;
		           data_in = playload_data;
                end
   	    @(negedge clk)	
       	    parity = 8'd64;
	    data_in = parity;
	    @(negedge clk)
	    write_en = 1'b0;
        end
   endtask

  
   task writing_pkt2;
       begin:B
	    reg [7:0]playload_data,parity,header;
	    reg [5:0]playload_len;
	    reg [1:0]destin_addr;
	    @(negedge clk)
	    lfd_state =1'b1;
	    write_en=1'b1;
	    destin_addr = 2'd2;
	    playload_len= 6'd6;
	    header = {playload_len,destin_addr};
	    data_in = header;
	    
	    for(j=0;j<playload_len;j=j+1)
	        begin
	             @(negedge  clk)
                     lfd_state = 1'b0;		     
           	     playload_data = {$random}%256;
		     data_in = playload_data;
                end
   	    @(negedge clk)	
       	    parity = 8'd32;
	    data_in = parity;
	    @(negedge clk)
	    write_en = 1'b0;
        end
   endtask	   
	    
// reading the packets

   task reading_pkts;
        begin
	    @(negedge clk)	
              read_en=1'b1;
        end
    endtask	

// all the tasks forming at one logic

    initial
	 begin
	     initialize;
             reset_n;
             writing_pkt1;
				 
             reading_pkts;
				 #10;
				 //soft_reset_p;
				 writing_pkt2;
         end
    initial
     $monitor($time," fifo_down_counter =%d lfd state=%b data_in = %b  we =%b re = %b ",DUT.fifo_down_counter,DUT.lfd_state_temp,data_in ,write_en ,read_en);
endmodule	    
	          
 






