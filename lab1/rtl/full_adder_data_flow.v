
module data_flow_full_adder(a,b,c,sum,carry);

 // input and output declarations 
 
	input a,b,c;
	output sum,carry;
	wire x,y,z;
	
 // using data flow modedel to give code for sum ex-y=a&b
  
  assign sum=a^b^c;
  
 // we using wires for inter connections
	
	assign x=a&b;
	assign y=b&c;
	assign z=a&c;
	
 // code for carry input getting from wires
        
   assign carry=x|y|z;



endmodule
