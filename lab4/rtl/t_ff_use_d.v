

module t_ff_use_d_ff(t,clk,cleart,qt,qbart);

// declaraing the input and output ports

 input t,clk,cleart;
 output qt;
 output qbart;
 wire x;

 assign x=t^qt;

 d_ff D(x,clk,cleart,qt,qbart);
 
 endmodule

// creating new module for d ff

module d_ff(d,clk,cleard,qd,qbard);
// declaring thr ports;

 input d,clk,cleard;
 output reg qd;
 output qbard;

 always@(posedge clk)
    begin
	  if(cleard)
	   qd<=1'b0;
	  else	
      qd<=d;
    end
  assign qbard=~qd;
endmodule  
