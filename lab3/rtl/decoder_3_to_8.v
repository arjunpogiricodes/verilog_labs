


module decoder_3_to_8(i,out);
// declaring the input and output ports 

  input [2:0]i;
  output reg[7:0]out;
// declaring the paramerters for inputs cases

  parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,s6=3'b110,s7=3'b111
  ,y0=8'b00000001,y1=8'b00000010,y2=8'b00000100,y3=8'b00001000,y4=8'b00010000,y5=8'b00100000,y6=8'b01000000,y7=8'b10000000;
// using behavioural model and case state ments (each have same priority)

  always@(*)
      begin
        case(i)
	  s0:out=y0;	
	  s1:out=y1;	
	  s2:out=y2;	
	  s3:out=y3;	
	  s4:out=y4;	
	  s5:out=y5;	
	  s6:out=y6;	
	  s7:out=y7;	
	  
         endcase
     end
endmodule     


