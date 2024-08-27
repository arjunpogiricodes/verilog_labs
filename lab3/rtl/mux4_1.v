/********************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 
 
All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

It is not to be shared with or used by any third parties who have not enrolled for our paid training 

courses or received any written authorization from Maven Silicon.


Webpage     :      www.maven-silicon.com

Filename    :	   mux4_1.v   

Description :      Mux 4:1 design

Author Name :      Susmita

Version     :      1.0
*********************************************************************************************/
 
module mux4_1(i,sel,out);

   //Step1 : Define the port directions with proper size & datatypes 

   input [3:0]i;
   input [1:0]sel;
   output reg out; 
   //Step2 : Write the MUX behaviour as a parallel logic using "case" 
   parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
   
   always@(i,sel)
      begin
        case(sel)
            s0:out=i[0];
            s1:out=i[1];
            s2:out=i[2];
            s3:out=i[3];
         endcase 
       end
         
   	    

endmodule
		
