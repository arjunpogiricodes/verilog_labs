




module jkff(j,k,clk,reset,preset,q,qbar);
// delcaring the input and output ports 
 
   input j,k,reset,clk,preset;
   output reg q;
   output qbar;
// declaring the paramaeter for nc reset set toggle
 parameter NC=2'b00, RESET=2'b01 , SET=2'b10 , TOGGLE = 2'b11;

// declaring the behavioural abstraction fot jk

  always@(posedge clk)
      begin
        if(reset)
            begin
                q<=1'b0;
            end
	 else if ( preset == 1'b1)
            begin
                q<=1'b1;
            end				 
        else
            begin
              case({j,k})
                 NC    : q<=q;
                 RESET : q<=1'b0;
                 SET   : q<=1'b1;
                 TOGGLE:q<=~q;
              endcase
            end
        end  
  assign qbar =~q;
endmodule  
