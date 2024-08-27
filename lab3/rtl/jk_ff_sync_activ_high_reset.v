

module jk_ff_sync_active_high_reset(j,k,clk,reset,q,qbar);

// declaring the input and output ports

  input j,k,reset,clk;
  output reg q;
  output qbar;
// using behavioural model

  always@(negedge clk)
    begin
      if ( reset == 1'b1)
         begin
          q<=0;
         end
      else
        begin	      
         case({j,k})
          2'b00:q<=q;
          2'b01:q<=0;
          2'b10:q<=1;
          2'b11:q<=~q;
          endcase
         end
     end
	  assign qbar =~q;
endmodule     


          	  
