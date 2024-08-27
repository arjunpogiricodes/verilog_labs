


 
 module arithmetic_operator_tb();
// declaring the regs and wires

 reg [3:0]a,b,c;
 reg [3:0]d;
 reg [1:0]sel;
 wire [7:0]x,z;
 wire signed [7:0]y,s;

// using arithmatic instance

 arithmetic_operator DUT(a,b,c,d,sel,x,y,z,s);

// creating tasks for initlizing and taking input from user

 task initilize;
   begin
     {a,b,c,d,sel}=0;
    end
 endtask

 task operation_Sel(input [1:0]m);
	 begin
           sel=m;
         end
 endtask

 task inputs(input [3:0]n,o,p);
  begin
    a=n;
    b=o;
    c=p;
  end
 endtask
 
 task input_sign(input [3:0]q);
    begin
     d=q;
    end
 endtask

task delay;
  begin
   #10;
   end
 endtask

// generating test cases 

 initial
   begin 
     initilize;	   
     repeat(20) 
       begin
	    inputs({$random}%16,{$random}%16,{$random}%16);
	    input_sign($random%16);
       operation_Sel({$random}%4);
	    delay;
		 if      (sel == 00)
		 $display("a=%0d b=%0d \n x(a+b)=%0d ",a,b,x);
		 else if (sel == 01)
		 $display("a=%0d b=%0d \n y(b-a)=%0d ",a,b,y);
		 else if (sel == 10)
		 $display("a=%0d c=%0d \n z(c*a)=%0d ",a,c,z);
		 else
		 $display("c=%0d d=%0d \n s(c-d)=%0d ",c,d,s);
       end
   end 
// monitor the values

 //initial
   //$monitor("a=%0d b=%0d c=%0d d=%0d \n x(a+b)=%0d y(b-a)=%0d  z(c*a)=%0d s(c-d)=%0d ",a,b,c,d,x,y,z,s);
 endmodule	 
        	

 
 
 
		 
