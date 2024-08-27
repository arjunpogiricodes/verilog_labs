

module dual_port_sync_16x8_ram(clk,reset,re,we,r_add,w_add,data_in,data_out);

// declaring the input and output ports

   input clk,reset,re,we;
   input [7:0]data_in;
   input [3:0]r_add,w_add;
   output  reg[7:0]data_out;
   reg [7:0]mem[15:0]; 
   integer i;
// using algorithem

  always@(posedge clk)
     begin
       if(reset)
          begin
            for(i=0;i<15;i=i+1)
              begin
		          mem[i]<=0;
	           end
	          //data_out<=0;   
           end
			  end
      	else
            begin
               if(we)
                  mem[w_add]<=data_in;
	            if(re)
		           data_out <=mem[r_add];     
             end
       end
endmodule       
               		 
