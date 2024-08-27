

module sr_latch(s,r,q,qbar);
// declaring the input and output ports

   input s,r;
   inout q,qbar;

// using gate level so use nand gate premitive
  
  nor NO1(q,r,qbar);
  nor NO2(qbar,q,s);
 endmodule   
