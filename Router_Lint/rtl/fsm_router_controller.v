


module fsm_router_controller(clk,reset,pkt_valid,busy,parity_done,data_in,soft_reset_0,soft_reset_1,soft_reset_2,fifo_full,low_pkt_valid,fifo_empty_0,fifo_empty_1,fifo_empty_2,detect_add,ld_state,laf_state,full_state,write_enb_reg,rst_int_reg,lfd_state);

// declaring the input and output ports

    input clk,reset,pkt_valid,parity_done,soft_reset_0,soft_reset_1,soft_reset_2,fifo_full,low_pkt_valid,fifo_empty_0,fifo_empty_1,fifo_empty_2;
    input [1:0]data_in;
    output detect_add,ld_state,laf_state,full_state,rst_int_reg,lfd_state;
    output busy,write_enb_reg;	 
// parameter and internal next_state,present state regs declarations

    parameter DECODE_ADDRESS=3'b000,LOAD_FIRST_DATA=3'b001,WAIT_TILL_EMPTY=3'b010,LOAD_DATA=3'b011,FIFO_FULL_STATE=3'b100,LOAD_AFTER_FULL=3'b101,LOAD_PARITY=3'b110,CHECK_PARITY_ERROR=3'B111;
    reg [1:0]addr_data;
    reg [2:0]present,next;

// storng detecting the destination_address_signal

    always@(*)
       begin
	   if(!reset)
	      addr_data<=0;
      else 
	   	begin
		     if(detect_add)      
	          addr_data <= data_in;
		     end
		
       end

// sequntial logic for present state 

    always@(posedge clk)
        begin
             if(!reset)
               present<=DECODE_ADDRESS;
				 else if(soft_reset_0 || soft_reset_1 || soft_reset_2)
               present<=DECODE_ADDRESS;				 
             else
	       present<=next;
        end

// combinational logic for next state 	

    always@(*)
	      begin
	      	    case(present)
		        DECODE_ADDRESS: 
		                       if((pkt_valid && addr_data == 2'd0 && fifo_empty_0) || (pkt_valid && addr_data== 2'd1 && fifo_empty_1) || (pkt_valid && addr_data == 2'd2 && fifo_empty_2))
				          begin     
			                     next=LOAD_FIRST_DATA;
				          end   
				       else if((pkt_valid && addr_data == 2'd0 && (!fifo_empty_0)) || (pkt_valid && addr_data == 2'd1 && (!fifo_empty_1)) || (pkt_valid && addr_data == 2 && (!fifo_empty_2)))		                                                          
						 begin
					     next=WAIT_TILL_EMPTY;
				           end  
				       else
				   	   begin
					     next=DECODE_ADDRESS;
				     end
		        WAIT_TILL_EMPTY: 
                                       if((addr_data == 2'd0 && fifo_empty_0) || (addr_data == 2'd1 && fifo_empty_1) || (addr_data == 2'd2 && fifo_empty_2))
				          begin     
			                     next=LOAD_FIRST_DATA;
				          end
	                               else
	                                   begin
	                                     next=WAIT_TILL_EMPTY;
                                           end
                       LOAD_FIRST_DATA:
                                            next=LOAD_DATA;
                       LOAD_DATA      :
                                       if(fifo_full)
		                         begin
		                            next=FIFO_FULL_STATE;
				          end
                                       else if ((!fifo_full) && (!pkt_valid))
				          begin
				             next=LOAD_PARITY;		  
                                          end
					else
					   begin
					     next=LOAD_DATA;
				           end
                     FIFO_FULL_STATE :
			              if(!fifo_full)
				         begin    
                                            next=LOAD_AFTER_FULL;
				         end
				      else
                                         begin
				            next=FIFO_FULL_STATE;
				         end
	             LOAD_AFTER_FULL:
                                     if((!parity_done) && (!low_pkt_valid))
		           	        begin
			                   next=LOAD_DATA;
		                        end
	                             else if((!parity_done) && low_pkt_valid)
	                                begin
	                                   next=LOAD_PARITY;
                                        end
				     else if(parity_done)
				        begin
				           next=DECODE_ADDRESS;
			                end
		      LOAD_PARITY  :
		                    next=CHECK_PARITY_ERROR;
	         CHECK_PARITY_ERROR:
                                    if(fifo_full)
		                      begin
		                        next=FIFO_FULL_STATE;
	                              end
                                    else
                                      begin
            			        next=DECODE_ADDRESS;
		                      end
	                        default:next=DECODE_ADDRESS;
            endcase
    
   end
 
// combinational logic for output

// busy is going to low at decode state and load stae other states  it was
// high bcaz it is  not
// allowing new data from the sourece
   assign  busy = (present == DECODE_ADDRESS || present == LOAD_DATA)?1'b0:1'b1;


   assign detect_add =(present == DECODE_ADDRESS)?1'b1:1'b0;
   assign ld_state   =(present == LOAD_DATA)?1'b1:1'b0;
   assign laf_state  =(present == LOAD_AFTER_FULL)? 1'b1:1'b0;
   assign full_state =(present == FIFO_FULL_STATE)?1'b1:1'b0;
   assign lfd_state  =(present == LOAD_FIRST_DATA)?1'b1:1'b0;
   assign rst_int_reg=(present == CHECK_PARITY_ERROR)?1'b1:1'b0;

// write enb reg going tp high only in these state bcaz , these stae have
// capabul for sending payload and parity data to fifo when write enb reg is
// high then only we know which fifo destinastion.neccasary to send the data
// at he particluar stae 
//

  assign write_enb_reg = (present == LOAD_DATA || present == LOAD_PARITY || present == LOAD_AFTER_FULL)? 1'b1:1'b0;

endmodule
		                        			    
