

module ifblock_vs_conditional();

  reg [1:0]y;
  wire [1:0]z;
  reg [3:0]w =4'b1100;
 initial
     begin
       if(w==4'b110x)
          y=2'b11;
			 
       else
      	 y=2'b10; 
		
     end
 assign z=(w==4'b110x)?(2'b11):(2'b10);
      initial
		 begin
       #10;
       $display("y=%b z = %b " ,y,z);
       end
 endmodule 
