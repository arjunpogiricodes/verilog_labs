


 module binary_to_gray_tb();

// declaring regs and wires
 
 reg a,b,c,d;
 wire g0,g1,g2,g3;
// integer i;

 binary_to_gray DUT(a,b,c,d,g0,g1,g2,g3);

// initial vlaues of inputs at time=0

 initial
    begin
      {a,b,c,d}=4'b0000;
    end
// give random values

 always #5 a=~a;
 always #10 b=~b;
 always #20 c=~c;
 always #30 d=~d;        
// monitor thr values

 initial
      
        $monitor("dcba=%b%b%b%b  g3g2g1g0 = %b%b%b%b",d,c,b,a,g3,g2,g1,g0);
endmodule     	

