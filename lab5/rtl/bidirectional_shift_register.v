

module biderctional_shift_reg(clk,reset,shift,mode,din,dout);

    input clk,shift,din,mode,reset;
    output [3:0]dout;
     reg [3:0]temp;

   always@(posedge clk)
   begin
       if(reset)
	   temp <= 0;
       else if(shift && (!mode))
	   temp <= {din,temp[3:1]};
        else
	   temp <= {temp[2:0],din};
    end
   assign dout =temp;
endmodule  
	      


