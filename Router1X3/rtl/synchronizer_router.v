

module synchronizer_router(detect_add,data_in,write_enb_reg,clk,reset,vld_out_0,vld_out_1,vld_out_2,read_enb_0,read_enb_1,read_enb_2,write_enb,fifo_full,empty_0,empty_1,empty_2,soft_reset_0,soft_reset_1,soft_reset_2,full_0,full_1,full_2);

// declaring the input and output ports

   input detect_add,write_enb_reg,clk,reset,read_enb_0,read_enb_1,read_enb_2,empty_0,empty_1,empty_2,full_0,full_1,full_2;
   input [1:0]data_in;
   output vld_out_0,vld_out_1,vld_out_2;
   output reg [2:0]write_enb;
	output reg fifo_full;
	output reg soft_reset_0,soft_reset_1,soft_reset_2;

// creating the internal register

    reg [1:0]addr_data;
    reg [6:0]out_fifo_0_counter; 
	 reg [6:0]out_fifo_1_counter; 
	 reg [6:0]out_fifo_2_counter; 
// storng detecting the destination_address_signal

    always@(posedge clk)
       begin
	   if(!reset)
	      addr_data <=0;
      else if(detect_add)      
	      addr_data <= data_in;	
       end

// destinatoin addrss decodeing and sending write enb signal sending for
// respective fifo

    always@(*)
        begin
            if(!reset)
              write_enb=0;
            else
	      begin
			    if(write_enb_reg)
				  begin
	          case(addr_data)
	             2'b00:write_enb=3'b001;		  
	             2'b01:write_enb=3'b010;		  
	             2'b10:write_enb=3'b100;		  
	             default:write_enb=3'b000;
              endcase
				  end
				 else
                write_enb=3'b000;				 
              end		  
        end

// fifo full signal asserted based on full status of each fifo  	
	     
     always@(*)
	  begin
             if(!reset)
               fifo_full=0;
             else
	        begin
	            case(addr_data)
	              2'b00:fifo_full=full_0;
	              2'b01:fifo_full=full_1;
	              2'b10:fifo_full=full_2;
		      default:fifo_full=0;
	           endcase
	        end
	   end
// valid out signal genration

    assign vld_out_0=~empty_0;
    assign vld_out_1=~empty_1;
    assign vld_out_2=~empty_2;

// soft start signal generation foer each fifo 
// the respective     soft reset signal go high if read _ en  is not asserted
// with in colk cycle so we take colkc counter to counte clks 
// vld out being assrent being assreted and taking the reset condiotn also

wire count_0 = (out_fifo_0_counter == 6'd29) ? 1'b1:1'b0;
wire count_1 = (out_fifo_1_counter == 6'd29) ? 1'b1:1'b0;
wire count_2 = (out_fifo_2_counter == 6'd29) ? 1'b1:1'b0;

   always@(posedge clk)
	  begin
             if(!reset)
                  begin
                   soft_reset_0<=0;
		            out_fifo_0_counter<=0;
	           end
              else if(!vld_out_0)
	           begin    
                   soft_reset_0<=0;
		            out_fifo_0_counter<=0;
	           end
				  else if (read_enb_0)
				    begin
					   soft_reset_0<=0;
						out_fifo_0_counter <=0;
					  end	
              else if(count_0 )
	           begin   
	            out_fifo_0_counter <=0;
                    soft_reset_0<=1;	    
	           end
	          else 
	           begin   
	           out_fifo_0_counter <= out_fifo_0_counter+1;
	           soft_reset_0<=0;
		   end 
          end
			 
			  always@(posedge clk)
	  begin
             if(!reset)
                  begin
                   soft_reset_1<=0;
		            out_fifo_1_counter<=0;
	           end
              else if(!vld_out_1)
	           begin    
                   soft_reset_1<=0;
		            out_fifo_1_counter<=0;
	           end
				  else if (read_enb_1)
				    begin
					   soft_reset_1 <=0;
						out_fifo_1_counter <=0;
					  end	
              else if(count_1) 
	          begin   
	            out_fifo_1_counter <=0;
                    soft_reset_1<=1;	    
	           end
	          else 
	           begin   
	           out_fifo_1_counter <= out_fifo_1_counter+1;
	           soft_reset_1<=0;
		   end 
          end
			 
			  always@(posedge clk)
	  begin
             if(!reset)
                  begin
                   soft_reset_2<=0;
		            out_fifo_2_counter<=0;
	           end
              else if(!vld_out_2)
	           begin    
                   soft_reset_2<=0;
		            out_fifo_2_counter<=0;
	           end
				  else if (read_enb_2)
				    begin
					   soft_reset_2 <=0;
						out_fifo_2_counter <=0;
					  end	
              else if(count_2)
	          begin   
	            out_fifo_2_counter <=0;
                    soft_reset_2<=1;	    
	           end
	          else 
	           begin   
	           out_fifo_2_counter <= out_fifo_2_counter+1;
	           soft_reset_2<=0;
		   end 
          end
 endmodule	  
