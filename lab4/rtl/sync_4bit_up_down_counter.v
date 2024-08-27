
module sync_4bit_up_down_counter(clk,reset,load,mode,data_in,cout);
// declaring the input and output ports

 input clk,reset,load,mode;
 input [3:0] data_in;
 output reg [3:0]cout;

// always block

  always@(posedge clk)
     begin
	  if (~reset)
	    begin
	        cout<=4'b0000;
            end
         else if(load)
             begin
               cout<=data_in;
             end
         else 
	    begin
	      case(mode)
	        1'b0:cout<= cout+1'b1;
	        1'b1:cout<= cout-1'b1;
	      endcase
            end
    end
endmodule    
	  	 

