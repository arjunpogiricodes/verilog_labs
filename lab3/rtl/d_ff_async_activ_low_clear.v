

module d_ff_async_activ_low_clr(d,clear,preset,clk,q,qbar);

// declaring the input and output ports 

  input d;
  input clk;
  input clear,preset;
  output reg q;
  output qbar;

// using behavioural model

 always@(posedge clk or negedge clear or posedge preset)
   begin
      if( clear == 0 )
        begin
     	  q<=0;
		  end
      else if( preset == 1)
        begin
          q<=1;
        end
      else
        begin
        q<=d;
        end	
		  
   end
	
  assign qbar = ~q;
endmodule 
