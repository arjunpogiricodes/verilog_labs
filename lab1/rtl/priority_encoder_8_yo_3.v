


 module priority_encoder_8_to_3(i,y);

 // declaring the input and output ports
 
 input [7:0]i;
 output reg [2:0]y;

//using behavioural and case statements

 always@(i)
    begin
      casex({i})
		 8'b00000001:y=3'b000; 
		 8'b0000001x:y=3'b001; 
		 8'b000001xx:y=3'b010; 
		 8'b00001xxx:y=3'b011; 
		 8'b0001xxxx:y=3'b100; 
		 8'b001xxxxx:y=3'b101; 
		 8'b01xxxxxx:y=3'b110; 
		 8'b1xxxxxxx:y=3'b111;
       endcase
     end

  endmodule   
         	 
