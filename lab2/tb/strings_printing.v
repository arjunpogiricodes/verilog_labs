 



 module strings_printing();

  reg [8*13:1]string_reg;

  initial
    begin
       string_reg="maven silicon";
       $display(" institute name is -> %s ",string_reg);
		 #10;
       $display(" institute initial name -> %s", string_reg[65:1]);
    end
 endmodule

