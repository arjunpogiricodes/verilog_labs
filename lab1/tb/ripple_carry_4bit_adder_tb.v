

 module ripple_carry_4bit_adder_tb();

 // declaringn regs nad wires
 
 reg [3:0]a,b;
 reg cin;
 wire [3:0]s;
 wire cout;

 integer i;

// instance the ripple carry adder dut 
 
 ripple_carry_4bit_adder DUT(a,b,cin,s,cout);

// initail valuesa at time 0

  initial 
    begin 
      {a,b,cin}=0;
    end

//possible test cases
  
   initial 
      begin
	a=4'b1001;
        b=4'b1100;
       #50;

	a=4'b0010;
        b=4'b1000;
       #50;
	a=4'b1111;
        b=4'b1111;
       #50;
	a=4'b1100;
        b=4'b0011;
       #50;
	a=4'b1001;
        b=4'b0000;
       #50;
	a=4'b0001;
        b=4'b1101;
       #50;
	a=4'b1011;
        b=4'b1000;
       #50;
       end
// moniter the values 
  
 initial
    $monitor("a =%b , b= %b , s=%b , cout=%b ",a,b,s,cout);
endmodule	 
