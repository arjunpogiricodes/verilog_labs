

module fsm_router_controller_tb();


// declaring the reg and wires
    reg clk,reset,pkt_valid,parity_done,soft_reset_0,soft_reset_1,soft_reset_2,fifo_full,low_pkt_valid,fifo_empty_0,fifo_empty_1,fifo_empty_2;
    reg [1:0]data_in;
    wire detect_add,ld_state,laf_state,full_state,rst_int_reg,lfd_state;
    wire busy,write_enb_reg;	 
// parameter and internal next_state,present state regs declarations

    //parameter DECODE_ADDRESS=3'b000,LOAD_FIRST_DATA=3'b001,WAIT_TILL_EMPTY=3'b010,LOAD_DATA=3'b011,FIFO_FULL_STATE=3'b100,LOAD_AFTER_FULL=3'b101,LOAD_PARITY=3'b110,CHECK_PARITY_ERROR=3'B111;
    //reg [1:0]adrr_data;
    //reg [2:0]ps,ns;

// instantiating of fsm
//
   //fsm_router_controller DUT(.clk(clk),.(reset)reset,.(pkt_valid)pkt_valid,.(busy)busy,.(parity_done)parity_done,.(data_in)data_in,.(soft_reset_0)soft_reset_0,.(soft_reset_1)soft_reset_1,.(soft_reset_2)soft_reset_2,.(fifo_full)fifo_full,.(low_pkt_valid)low_pkt_valid,.(fifo_empty_0)fifo_empty_0,.(fifo_empty_1)fifo_empty_1,.(fifo_empty_2)fifo_empty_2,.(detect_add)detect_add,.(ld_state)ld_state,.(laf_state)laf_state,.(full_state)full_state,.(write_enb_reg)write_enb_reg,.(rst_int_reg)rst_int_reg,.(lfd_state)lfd_state);

   fsm_router_controller DUT(clk,reset,pkt_valid,busy,parity_done,data_in,soft_reset_0,soft_reset_1,soft_reset_2,fifo_full,low_pkt_valid,fifo_empty_0,fifo_empty_1,fifo_empty_2,detect_add,ld_state,laf_state,full_state,write_enb_reg,rst_int_reg,lfd_state); 

// reset_task

  task reset_n;
    begin
        @(negedge clk)
        reset =1'b0;
        @(negedge clk)
        reset=1'b1;
     end
  endtask

// task for initial all the input  values

  task initialize;
     begin
	  {clk,pkt_valid}=0;
      end
  endtask

// clk generating

  always #5 clk=~clk;

// input driving to fsm cheking differnt states
 
  task inputs;
     begin
      @(negedge clk)      
       pkt_valid =1'b1;
       data_in=2'd3;
		 @(negedge clk)
       fifo_empty_0=1'b1;
       fifo_empty_1=1'b1;
       fifo_empty_2=1'b1;
      end
   endtask
task fifoempty;
    begin
    @(negedge clk)
	    fifo_empty_0=1'b1;
       fifo_empty_1=1'b1;
       fifo_empty_2=1'b1;
     end
  endtask
 	  
	task waittask;
	  begin
	   @(negedge clk)
		 pkt_valid =1'b1;
		//@(negedge clk)
       data_in=2'd1;
      //@(negedge clk)
        fifo_empty_1=1'b0;
     end 
     endtask
	  
 task input1;
     begin
	    @(negedge clk)
       @(negedge clk)      
         //pkt_valid =1'b1;
         data_in=2'd2;	 

     end
   endtask  
 task input2;
      begin
		@(negedge clk)
       @(negedge clk)
        fifo_full =1'b1;
      end
   endtask

 task input3;
      begin
		@(negedge clk)
        @(negedge clk)
         fifo_full=1'b0;
       end
  endtask
  
 task input4;
      begin
		@(negedge clk)
          @(negedge  clk)
           pkt_valid=1'b0;
      end
   endtask
	
  task pari;
      begin
		@(negedge clk)
		 @(negedge clk)
		  parity_done=1'b1;
		 end 
   endtask		 
		  
 	

// iniitlia all the test cases

  initial
    begin
	initialize;
        reset_n;
        $display($time," ps = %b  fifo full state = %b write_enb_reg =%b busy = %b  detect_add = %b ld_state = %b laf_state =%b rst_int_reg =%b lfd_state =%b " ,DUT.present,full_state,write_enb_reg,busy, detect_add,ld_state,laf_state,rst_int_reg,lfd_state);
	inputs;
	  $display($time," ps = %b  fifo full state= %b write_enb_reg =%b busy = %b  detect_add = %b ld_state = %b laf_state =%b rst_int_reg =%b lfd_state =%b " ,DUT.present,full_state,write_enb_reg,busy, detect_add,ld_state,laf_state,rst_int_reg,lfd_state);

        input1;
	  $display($time," ps = %b  fifo full state= %b write_enb_reg =%b busy = %b  detect_add = %b ld_state = %b laf_state =%b rst_int_reg =%b lfd_state =%b " ,DUT.present,full_state,write_enb_reg,busy, detect_add,ld_state,laf_state,rst_int_reg,lfd_state);
    #10;
        input2;
	  $display($time," ps = %b  fifo full state= %b write_enb_reg =%b busy = %b  detect_add = %b ld_state = %b laf_state =%b rst_int_reg =%b lfd_state =%b " ,DUT.present,full_state,write_enb_reg,busy, detect_add,ld_state,laf_state,rst_int_reg,lfd_state);

        input3;
	  $display($time," ps = %b  fifo full state = %b write_enb_reg =%b busy = %b  detect_add = %b ld_state = %b laf_state =%b rst_int_reg =%b lfd_state =%b " ,DUT.present,full_state,write_enb_reg,busy, detect_add,ld_state,laf_state,rst_int_reg,lfd_state);
         input4;
	$display($time," ps = %b  fifo full state = %b write_enb_reg =%b busy = %b  detect_add = %b ld_state = %b laf_state =%b rst_int_reg =%b lfd_state =%b " ,DUT.present,full_state,write_enb_reg,busy, detect_add,ld_state,laf_state,rst_int_reg,lfd_state);
	      input2;
		   #10;
        input3;		
		$display($time," ps = %b  fifo full state = %b write_enb_reg =%b busy = %b  detect_add = %b ld_state = %b laf_state =%b rst_int_reg =%b lfd_state =%b " ,DUT.present,full_state,write_enb_reg,busy, detect_add,ld_state,laf_state,rst_int_reg,lfd_state);
		pari;
		$display($time," ps = %b  fifo full state = %b write_enb_reg =%b busy = %b  detect_add = %b ld_state = %b laf_state =%b rst_int_reg =%b lfd_state =%b " ,DUT.present,full_state,write_enb_reg,busy, detect_add,ld_state,laf_state,rst_int_reg,lfd_state);
		waittask;
		//#10;
		//$display($time," ps = %b  fifo full state = %b write_enb_reg =%b busy = %b  detect_add = %b ld_state = %b laf_state =%b rst_int_reg =%b lfd_state =%b " ,DUT.present,full_state,write_enb_reg,busy, detect_add,ld_state,laf_state,rst_int_reg,lfd_state);
		//waittask;
		#10;
		$display($time," ps = %b  fifo full state = %b write_enb_reg =%b busy = %b  detect_add = %b ld_state = %b laf_state =%b rst_int_reg =%b lfd_state =%b " ,DUT.present,full_state,write_enb_reg,busy, detect_add,ld_state,laf_state,rst_int_reg,lfd_state);
		fifoempty;
		$display($time," ps = %b  fifo full state = %b write_enb_reg =%b busy = %b  detect_add = %b ld_state = %b laf_state =%b rst_int_reg =%b lfd_state =%b " ,DUT.present,full_state,write_enb_reg,busy, detect_add,ld_state,laf_state,rst_int_reg,lfd_state);
	  // fifoempty;
     // $display(" ps = %b  fifo full state = %b write_enb_reg =%b busy = %b  detect_add = %b ld_state = %b laf_state =%b rst_int_reg =%b lfd_state =%b " ,DUT.present,full_state,write_enb_reg,busy, detect_add,ld_state,laf_state,rst_int_reg,lfd_state);
		
	
	
    end
   
//initial
 //begin


endmodule  

     	     


