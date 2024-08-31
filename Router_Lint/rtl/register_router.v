

 module register_router(clk,reset,pkt_valid,data_in,fifo_full,rst_int_reg,detect_add,ld_state,laf_state,full_state,lfd_state,parity_done,low_pkt_valid,error,dout);

// declaring the regs and wires 

      input clk,reset,pkt_valid,fifo_full,rst_int_reg,detect_add,ld_state,laf_state,full_state,lfd_state;
      input [7:0]data_in;
      output reg error,low_pkt_valid,parity_done;
      output reg [7:0]dout;

// creating 4 internal register for header byt storing,internal parity
// byte,packet parity byte,fifio full state byte each are 8 bits bcz all are bytes

     reg [7:0]header_byte,internal_parity_byte,packet_parity_byte,fifo_full_state_byte;

//  writing logic for header byte sstoring
//  header store add detect address and presetn state at load fikrst data and
//  pkt valid is high and corect address destination

   always@(posedge clk)
        begin
             if(!reset)
                begin
                     header_byte<=0;
                end
             else 
				 if(pkt_valid && detect_add && (data_in[1:0] != 2'd3))
                begin
                     header_byte <=data_in;
                end

	end
// logic for fifo sull state byte	
// stroing the data in after full state	
	
	always@(posedge clk)
	    begin
		                if(!reset)
 				   fifo_full_state_byte <= 0;
                                else if(ld_state && fifo_full)
		  		   fifo_full_state_byte <= data_in;
				else if(detect_add)
				   fifo_full_state_byte <= 0;
				else
                                   fifo_full_state_byte <=  fifo_full_state_byte ;				
  				
		  end		
				
 
// writing logic for dout 
// data out is works only at  play load data in header data writhout error 

   always@(posedge clk)
	   begin
		if(!reset)
	 	   begin
		  	dout<=0;
	    	   end
	       else if(detect_add && pkt_valid && (data_in[1:0] != 2'd3))
		   begin
		       dout <=dout;
	           end
               else if(lfd_state)
                   begin
                      dout<=header_byte;
                   end
               else if(ld_state &&(!fifo_full))
	          begin
                      dout <=data_in;
	          end
	       else if(full_state)
	          begin
	            dout <= dout;
	          end
               else if(laf_state)
                  begin
                     dout<=fifo_full_state_byte;
                  end
               else
                   begin
                     dout <=dout;
                   end
         end

// writing logic for internal parity 
// first it is ex or opeartion with header byte and then after contious ex or
// wuith each pay load data stored into internal parity


    always@(posedge clk)
           begin
		if(!reset)
		   begin
		       internal_parity_byte<=0;
	           end
                else if(detect_add)
                   begin
                      internal_parity_byte<=0;
                   end
                else if(lfd_state)
	            begin
	               internal_parity_byte <= internal_parity_byte ^ header_byte;
                    end
                else if(ld_state && !fifo_full)
                     begin
                       internal_parity_byte <= internal_parity_byte ^ data_in;
                     end
                else 
                     begin
			 internal_parity_byte <= internal_parity_byte;
	             end
	   end 	 

// writing logic for packet parity
// packet parity check wheather state uis parity_data only in this state
// only we are getting parity of packets

    always@(posedge clk)
	    begin
		  if(!reset)
		     begin
		        packet_parity_byte <= 0;
	             end
                  else if(detect_add)
                     begin
                       packet_parity_byte <=0;
                     end
                  else if(ld_state && (!pkt_valid) && (!fifo_full))
		      begin
		        packet_parity_byte <=data_in;
	              end
		  else if(!pkt_valid && rst_int_reg)
		      begin
			   packet_parity_byte<=0;
		      end
                 else
                     begin
                        packet_parity_byte <= packet_parity_byte;
                     end
           end

//parity done logic


   always@(posedge clk)
	    begin
		 if(!reset)
		     begin
		       parity_done <= 1'b0;
	             end
                else if(ld_state && (!pkt_valid) && (!fifo_full))
                     begin
                       parity_done <=1'b1;
                     end
                else if(laf_state && (!parity_done) && low_pkt_valid)
                     begin
                       parity_done <=1'b1;
                     end
                else                    
		     	parity_done <=1'b0;         
	       end


// error logic

   always@(posedge clk)
	   begin
	        if(!reset)
	             error <=1'b0;
                else if((packet_parity_byte != internal_parity_byte) && parity_done)
	             error <=1'b1;
                else if((packet_parity_byte == internal_parity_byte) && parity_done)
                     error <=1'b0;  			  
       	        else		     
		       	error <= 0;
	       
		   
            end

// low_packet_valid logic this means if ther is no packets packet goes low so
// this is negation of pkt valid 	    
     			  
   always@(*)
          begin
               if(!reset)
		    low_pkt_valid <=0;
	       else if(parity_done)
		    low_pkt_valid <=1'b1;
	       else if(!pkt_valid)    
                    low_pkt_valid <=1'b1;
	       else
		    low_pkt_valid <=0;   
                 
	   end
endmodule	   
	       


                    

		
		 
     
