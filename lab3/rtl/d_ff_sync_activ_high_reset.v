


module d_ff_sync_activ_high_reset(d,clk,reset,q,qbar);

// declarin the input and output ports

 input d,clk,reset;
 output reg q;
 output qbar;

// behavioural modal

 always@(posedge clk)
    begin
       if( reset == 1'b1)
         begin
	          q<=0;
          end
       else
          begin
            q<=d;
           end
     end
  assign qbar =~q;
endmodule

