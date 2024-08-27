


 module priority_encoder_8_to_3_tb();

 // declaring the inputs reg and outpu wire
 
 reg [7:0]i;
 wire [2:0]y;
 wire idle;
 integer j;

 // using instance of encoder
 
 priority_encoder_top  DUT(i,y,idle);
 
 // at time = 0 input values
 
 initial
    begin
       i=0;
    end
// giving diffrent test conditions using for loop

 initial
     begin
	 for(j=0;j<128;j=j+1)
	   begin
	     i=j;
	     #10;
            end
     end
 // monitor the values
  
 initial
     $monitor("input i=%b y=%b",i,y);
endmodule	 

	   	 

