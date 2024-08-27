

module siso(data_in,clk,reset,data_out);

// declaring the input and output ports

 input data_in;
 input clk,reset;
 output  data_out;

 reg [3:0]w;

// logic
// uising blocking assignment

 
  always@(posedge clk)
     begin
       if(reset)
          w=0;
        else
          begin
			   w[3]=data_in;
			   w[2]=w[3];
				w[1]=w[2];												
            w[0]=w[1];
           end
		end	  
      assign data_out=w[0];			  
 
/* always@(posedge clk)
     begin
        if(reset)
           w<=0;
         else
	       w<={w[2:0],data_in};
       end
  assign data_out=w[3];*/


/*   always@(posedge clk)
	    begin
		    if(reset)
			    w<=0;
			  else
             begin
                w[3]<=w[2];
                w[2]<=w[1];
                w[1]<=w[0];
                w[0]<=data_in;   					 
             end
	   end			 
    assign data_out=w[3];
*/	 
endmodule  

                                    
