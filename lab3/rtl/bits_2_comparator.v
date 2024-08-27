

module bits_1_comparator(a,b,g,e,l);

  input a,b;
  output reg g,e,l;
  always@(a,b)
    begin
      case({a,b})
      2'b00:{g,e,l}=3'b010;	      
      2'b01:{g,e,l}=3'b001;	      
      2'b10:{g,e,l}=3'b100;	      
      2'b11:{g,e,l}=3'b010;
    endcase
  end
endmodule

// top module

module bits_2_comparator(a,b,great,equi,less);
    input [1:0]a,b;
    output great,equi,less;
    wire [1:0]m,n,p;

    bits_1_comparator BITM(a[1],b[1],m[1],n[1],p[1]);
    bits_1_comparator BITL(a[0],b[0],m[0],n[0],p[0]);

    assign great=(m[1]&(~p[1]))|(n[1]&m[0]&(~p[0]));
    assign less =((~m[1])&p[1])|(n[1]&(~m[0])&p[0]);
    assign equi =n[1]&n[0];
endmodule   

