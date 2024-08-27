module decoder_2_to_4_tb();
// input reg and output wire  declarations
 
 reg a,b;
 wire [0:3]y;

// creating integer for loop condition checking all cases 

 integer i;

// instance the decoder_2_to_4 dut file
 
 decoder DUT(a,b,y);

// assign stating values of inuout at time=0
 
 initial
    begin
	 {a,b}=2'b00;
  end

// using forloop for different possible input cases

 initial 
    begin
      for(i=0;i<4;i=i+1)
	     begin
	     {a,b}=i;
	     #50;
        end
    end     

// moniter the values

 initial
    $monitor(" a=%b , y=%b ",a,y);
endmodule
