

module mod12_up_counter(clk,reset,load,data_in,cout);
// declaring the input and output ports

 input clk,reset,load;
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
         else if(cout== 4'd11)
              begin
                cout <= 4'b0000;
              end
          else
              begin
		         cout<= cout+1'b1;
	          end
    end
endmodule    
	  	 
