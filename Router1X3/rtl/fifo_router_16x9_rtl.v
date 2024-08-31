


module fifo_16x9_router(clk,reset,data_in,write_enb,read_enb,soft_reset,lfd_state,full,empty,data_out);

// declaring the input and ouput ports

     input clk,reset,write_enb,read_enb,lfd_state,soft_reset;
     input [7:0]data_in;
     output full,empty;
     output reg [7:0]data_out;

// declaring the internal write addr read addr memory and fifi down count reg 

     reg [5:0]write_addr,read_addr;
     reg [8:0]mem[0:15];
     reg [6:0]fifo_down_counter;
     reg lfd_state_temp;
     integer i;

/* delaying the lfd state bcuz its arriving at one clock  from the fsm mean
while data header comes at 2 clock pulses  from register so we synxc the
two things so we using d flip flop to genrate 1 clk delay for lfd state */

  
     always@(posedge clk)
       begin
	    if(!reset)       
           lfd_state_temp<=0;			  
        else
		     lfd_state_temp<=lfd_state;			  
       end
				
   // assign lfd_state = lfd_state_temp;
	
	 /*always@(posedge clk)
	  begin
	      if(write_enb && (!full))
			 mem[write_addr[3:0]][8] <= lfd_state_temp;
			 else
			  mem[write_addr[3:0]][8] <=  mem[write_addr[3:0]][8] ;
		end */

// increment the write and read address
  
   /*  always@(posedge clk)
       begin
	    if(!reset )
	           {read_addr,write_addr}<=0;
            else if(soft_reset)
	           {write_addr,read_addr}<=0;
            else 
				begin
				if(write_enb && (!full))

				if (read_enb && (!empty)) 
               read_addr <= read_addr +1;
             end   					
        end */
// increment the read address

    /*always@(posedge clk)
       begin
            if(!reset)
              read_addr<=0;
            else if(soft_reset)
              read_addr<=0;
            else if(read_enb && (!empty)) 
               read_addr <= read_addr +1;
        end
*/
// writing opearion	
	        
    always@(posedge clk)
         begin
	         if(!reset)
	           begin      
	             for(i=0;i<16;i=i+1)
					    begin
	                mem[i]<=0;
						 end
					write_addr<=0;
      	      end
	         else if(soft_reset)
	             begin      
	               for(i=0;i<16;i=i+1)
						  begin
	                   mem[i]<=0;
						  end
						  write_addr<=0;
      	      end	
	         else 
				if(write_enb && (!full))
             begin				
	          mem[write_addr[3:0]]<={lfd_state_temp,data_in};
				 write_addr <= write_addr+1;
				 //mem[write_addr[3:0]][8] <= lfd_state_temp;
				end 
				 
      end

// read opearion
 
     always@(posedge clk)
           begin
	       if(!reset) begin
		         data_out<=0;
					read_addr<=0; end
	       else if(soft_reset) begin
	            data_out<=8'bzzzz_zzzz;
					read_addr<=0; end
			 else if (fifo_down_counter ==0 && data_out !=0)
       			 data_out<=8'bzzzz_zzzz;
			  else 
			  if(read_enb && (!empty)) 
					begin
	   	    data_out<=mem[read_addr[3:0]];
				 read_addr <= read_addr +1;
				  end
           end
/* fifo down count logic when hear byte recived it check that 8 bt of the byt
 it is one then fifo counte load with playload data then after ti decremented every clk pulse*/   

   
     always@(posedge clk)
           begin
	             if(!reset)
	                fifo_down_counter<=0;
                else if(soft_reset)
	                fifo_down_counter<=0;
					 
                else  if(read_enb && !empty)
									begin
									if(mem[read_addr[3:0]][8]==1'b1)
	                fifo_down_counter<=mem[read_addr[3:0]][7:2]+1;
                else if(fifo_down_counter != 0)
	                fifo_down_counter<=fifo_down_counter-1;					  
            end
				end
// fifo full signal logic and empty signal logic

     assign full = ( (write_addr[3:0] == read_addr[3:0]) && (write_addr[4] != read_addr[4]))?1'b1:1'b0;
     assign empty =( (write_addr[3:0] == read_addr[3:0]) && (write_addr[4] == read_addr[4]))?1'b1:1'b0;

endmodule

	    

	        		
	           		

		      	
  

   
       

       		    
       	       




