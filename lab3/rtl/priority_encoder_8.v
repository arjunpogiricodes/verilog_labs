

module priority_encoder_8_to_3(i,out,v);
// declaring te input and output ports

 input [7:0]i;
 output reg [2:0]out;
 output reg v;

// using behavioural model and if else codition (priority matters)

 always@(i)
    begin
      if(i[7] == 1'b1)
         begin     
         out = 3'b111;
         v=1'b1;
         end	 
      else if(i[6] == 1'b1)
	      begin      
         out = 3'b110;
         v=1'b1; 
         end	 
      else if(i[5] == 1'b1)
         begin     
         out = 3'b101;
         v=1'b1;
         end			
      else if(i[4] == 1'b1)
         begin
         out = 3'b100;
         v=1'b1;
         end	 
      else if(i[3] == 1'b1)
         begin	      
         out = 3'b011;	
	      v=1'b1;
	      end 
      else if(i[2] == 1'b1)
	      begin     
         out = 3'b010;
         v=1'b1;
         end	 
      else if(i[1] == 1'b1)
         begin
	      out = 3'b001;
	      v=1'b1;
         end
      else if(i[0] == 1'b1)
          begin    
	       out = 3'b000;
          v=1'b1;
          end
      else
          begin
	       out = 3'b000;
          v= 1'b0;
          end
 end
endmodule      
         	      
