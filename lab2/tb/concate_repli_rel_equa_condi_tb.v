


 module con_rep_rel_equ_condi_tb();
//declaring the regs and wires

 reg [3:0]a,b,c,d,e;
 reg [9:0]v,w,x,y,z;

// initlizing the values by using tasks

 task inputs(input [3:0]m,n,o,p,q); 
    begin
      {a,b,c,d,e}= {m,n,o,p,q};
    end
  endtask
 
task assigning1;
  begin
    v={a,3'b10x,c};
    w={{2{e}},b};
    x=a>b;
    y=c===e;
    z=e?a:c;
  end
 endtask

 task assigning2;
  begin
    v={a,e,c};
    w={3{b}};
    x=a<=b;
    y=4'b01zx === 4'b01zx;
    z=a?e:d;
  end
 endtask

// giving test cases for cheking deiffrent conditions

 initial
     begin
       repeat(30)
         begin
         inputs({$random}%16,{$random}%16,{$random}%16,{$random}%16,{$random}%16);
         assigning1;
	 $display("a=%b b=%b c=%b d=%b e=%b \n v({a,3'b10x,c})=%b  w({{2{e},b})=%b  x(a>b)=%0b  y(c===e)=%0b  z(e?a:c)=%b " ,a,b,c,d,e,v,w,x,y,z);
         assigning2;
	  $display("a=%b b=%b c=%b d=%b e=%b \n v({a,e,c};)=%b  w({3{b}})=%b  x(a=<b)=%0b  y(4'b01zx !== 4'b01zx)=%0b  z(a?e:d)=%b " ,a,b,c,d,e,v,w,x,y,z);

         #10;
         end
      end
 endmodule      


        	 

