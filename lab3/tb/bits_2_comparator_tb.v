

module bits_2_comparator_tb();

  reg [1:0]a,b;
  wire e,g,l;

bits_2_comparator  DUT(a,b,g,e,l);

 task initlize;
   begin
     {a,b}=0;
   end
 endtask

task inputs(input [1:0]m,n);
  begin
  a=m;
  b=n;
  end
endtask

initial
   begin
     initlize;
     repeat(30)
     begin	     
      inputs({$random}%4,{$random}%4);
      #10;
		$display("a=%b\nb=%b\ngreater(a>b) =%b  equal(a=b) =%b  lesser(a<b) =%b " ,a,b,g,e,l);
     end
   end
initial
 #1000 $finish;
endmodule	
