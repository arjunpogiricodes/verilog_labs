

 module bi_directional_buffer_tb();

// ddeclaring reg and wires
 
  reg ctrl;
  wire a,b;
  //integer i;
  reg temp1,temp2;

// uisng biderctional buffer  

 bi_directional_buffer DUT(a,b,ctrl);

// initiating values at time=0

 assign a =ctrl?temp1:1'bz;
 assign b =ctrl?1'bz:temp2;


initial 
  begin
  {temp1,temp2,ctrl}=3'b000;
  end

// giving different test cases

 always #5 ctrl=~ctrl; 
 always #10 temp1=~temp1;
 always #20 temp2=~temp2;
// moniter the values

 initial
    $monitor(" ctrl=%b a=%b b=%b ",ctrl,a,b);
endmodule	 
