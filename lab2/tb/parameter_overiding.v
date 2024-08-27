



module ram();

//declaraing the input reg  and output wirs ports

 parameter WIDTH = 8;
 parameter DEPTH = 256;
 integer i;

// creatin  the one dimenstional memory unit


 reg [(WIDTH-1):0]mem[(DEPTH-1):0];

// iniating 0 to all the locations

 initial
    begin
       for(i=0;i<DEPTH;i=i+1)
         begin
           mem[i]=255;
	   $display(" mem[%d]=%h " ,i,mem[i]);
         end
    end
 endmodule

// creating  new module for aasignment by order list for parametrize  

 module param1();

 // overriding width only

  ram #(16) mem1();
 
 // overriding both width and depth
 
  ram #(32,512) mem2();

 // overriding depth only
 
  ram #(8,256) mem3();
  ram u();
  defparam u.DEPTH=10;
  defparam u.WIDTH=64;
  	

 endmodule  


  

 
