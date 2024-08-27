

module forloop();

  reg clk;
  integer i;


 initial
   begin
   clk=1'b0;
   end

 initial
 begin
   for(i=16;i>0 ;i=i-1)
	begin
	 i=i+1;
    #20 clk =~clk;
	 //$display(" i=%d " ,i);
	end
  end
  endmodule  


