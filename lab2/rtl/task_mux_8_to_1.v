



 module task_mux_8_to_1(i,s,out);
// declaring the output and inptut ports 

 input [7:0]i;
 input [2:0]s;
 output reg out;

//using behavioural modal (always block because each input same priority)

 always@(i,s)
      begin
         case(s)  		 
           3'b000:out=i[0];		 
           3'b001:out=i[1];		 
           3'b010:out=i[2];		 
           3'b011:out=i[3];		 
           3'b100:out=i[4];		 
           3'b101:out=i[5];		 
           3'b110:out=i[6];		 
           3'b111:out=i[7];
          endcase
       end
  endmodule

