

module random_five_real();

  real i;
  integer j;

  initial 
    begin
      for(j=0;j<10;j=j+1)
       begin
       i=(({$random}%10)/10.0)+1;
       $display(" numbers =%.3f ",i);
		 #10;
		 
       end
		 #100 $finish(2);
    end
endmodule    
