

 module bi_directional_buffer(a,b,c);

// declaring the input and output ports 
 
 inout a,b;
 input c;

// using tristate buffer premitives

 bufif1 TRISTATE1(b,a,c);
 bufif0 TRISTATE2(a,b,c);

 endmodule

