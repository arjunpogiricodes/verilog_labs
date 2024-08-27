

module dual_port_async_8x16_ram(reset,data_in,w_clk,w_addr,we,re,r_addr,data_out);

// declarin the input and output ports
 
  input reset,we,re,w_clk;
  input [2:0]w_addr,r_addr;
  input [15:0]data_in;
  output reg [15:0]data_out;
  integer i,j;
// creating memory


  reg [15:0]mem[7:0];

// asynchronous ram logic

   always@(posedge w_clk or negedge reset)
      begin
         if(~reset)
             begin
              for(i=0;i<8;i=i+1)
                 mem[i]<=0;		         
                data_out<=0; 
             end   			 
         else
            begin
              if(we&&(~re))
  		          mem[w_addr]<=data_in;
				  if((~we)&&re)
  		          data_out<=mem[r_addr];	 
           end
		end	  
		  
 endmodule       
