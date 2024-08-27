

module seed_parameter();

 reg [31:0]a;
 integer i=3;

 initial
    begin
      repeat(5)
        begin
	  a=$random(i);
	  $display(" random numbers a = %d " ,a);
          #10;
        end
    end
 initial
     begin
	    #60;
       i=3;
      repeat(5)
       begin
	 a=$random(i);
         $display(" random numbers a = %d " ,a);
         #10;
       end
      end
  initial
     #1000 $finish; 	  
 endmodule      
