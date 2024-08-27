


module vending_machine(clk,reset,coin_in,product,change);

// declaring the input and output poerts
  
    input clk,reset;
    input [1:0]coin_in;
    output reg product,change;

// declaring the parameter for states and reg for next state and present state
// no coin = 0x 1 rupee coin = 10 for 2 rupee coin = 11
// we are taking mealy fsm    
   parameter s0=2'b00,s1=2'b01,s2=2'b10;
    reg [1:0]next_state,present_state;
 
// sequntial logic for present state 

   always@(posedge clk)
       begin
          if(reset)
            present_state <= s0;
          else
	    present_state <= next_state;      	   
       end
// combinational logic for next state output

  always@(*)
     begin
      case(present_state)
          s0 : if(coin_in == 2'b10)
                  next_state <= s1;
               else if (coin_in == 2'b11)
	              next_state <= s2;
	            else 
		           next_state <= s0;     
          s1:  if(coin_in == 2'b10)
                  next_state <= s2;
               else if(coin_in == 2'b11)
	               next_state <= s0;
               else
	              next_state <= s1;
          s2:   if(coin_in == 2'b10)
                   next_state <= s0;
                else if (coin_in == 2'b11)
	                next_state <= s0;
                else
	               next_state <= s2;
          default: next_state <= s0;
      endcase
    end
// regestered output logic

  always@( posedge clk )
    begin
        case(present_state)
         
         s1:  if(coin_in  == 2'b10)
	      begin	       
              product <= 1'b0;
              change  <= 1'b0;
	      end 
	      else if ( coin_in == 2'b11)
	      begin
	       product <= 1'b1;
               change  <= 1'b0;
              end
             else
	       begin	     
               product <= 1'b0;
               change  <= 1'b0;
               end
   	   s2: if( coin_in == 2'b10)
               begin
               product <= 1'b1;
               change  <= 1'b0;      
               end
           else if (coin_in == 2'b11)
	       begin
	       product <= 1'b1;
               change  <= 1'b1;
               end
	    else
	       begin
	      	product <= 1'b0;
                change  <= 1'b0;
	       end
           default:
	        begin	   
		   product <= 1'b0;
                   change  <= 1'b0;
	         end 
	  endcase	  
   end

endmodule   
