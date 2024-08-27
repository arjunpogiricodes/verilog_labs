


module load_4bit_sync_up_counter(clk,reset,load,data_in,count);
// declaring the input and output ports

  input clk,reset,load;
  input [3:0] data_in;
  output reg [3:0] count;
// using always block

  always@(posedge clk)
     begin
      if (~reset)
        begin
          count<=0;
        end
      else if(load)
        begin
          count<= data_in;
        end
      else
         begin
	   count<= count+1'b1;
         end
     end
endmodule     
