


module fifo_16x8(clk,reset,data_in,read_en,write_en,data_out,full,empty);

// declaraing the input and output ports

   input clk,read_en,write_en,reset;
   input [7:0]data_in;
   output reg [7:0]data_out;
   output full,empty;
// declaring the memory and regs for addres of read and write operation

  reg [4:0]r_add,w_add;
  reg [7:0]mem[0:15];
  integer i;

//usingn always block for logic

  always@(posedge clk)
      begin
        if(~reset)	 
          begin
            for(i=0;i<16;i=i+1)
              begin 
         	    mem[i]<=0;
              end
                w_add <=0;
            end
         else
            begin
               if(write_en && (!full))
                  begin
                     mem[w_add] <= data_in;
                     w_add <= w_add + 1;
                   end
            end
      end
  always@(posedge clk)
      begin
        if(~reset)
          begin
            data_out <=0;
	         r_add <=0;
           end
        else
           begin
	       if(read_en && (!empty))
             begin  			 
              data_out<=mem[r_add];
              r_add <= r_add + 1;
				  //w_add <= w_add -1;

            end	      
         end
			end
// cheking the fifo is full or empty by using conditional operator 
  assign full = (w_add[3:0] == r_add[3:0] && w_add[4] == !(r_add[4]))? 1'b1:1'b0;
  assign empty =  (w_add[3:0] == r_add[3:0] && w_add[4] == (r_add[4]))? 1'b1:1'b0;
endmodule  
  
