/*******************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 
 
All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

It is not to be shared with or used by any third parties who have not enrolled for our paid training 

courses or received any written authorization from Maven Silicon.


Webpage     :      www.maven-silicon.com

Filename    :	   mux4_1_tb.v   

Description :      Mux 4:1 Testbench

Author Name :      Susmita

Version     :      1.0
*********************************************************************************************/

module mux4_1_tb();

   //Step1 : Write down the variables required for testbench		
   reg [3:0]i;
   reg [1:0]s;
   wire out;   
   //Step2 : Instantiate the Design 
   mux4_1 DUT(i,s,out);
   //Step3 : Declare a task to initialize inputs of DUT to 0 
  task initilize;
    begin
      {i,s}=0;
    end
  endtask    
   //Step4 : Declare  tasks with arguments for driving stimulus to DUT 
   task inputs(input [3:0]m,input [1:0] n);
	   begin
             i=m;
             s=n;
            end
     endtask	    
   //Step5 : Call the tasks from procedural process 
   initial
      begin
        initilize;
        repeat(30)
        begin
	  inputs({$random}%16,{$random}%4);
          #10;
         end
       end

   //Step6 : Use $monitor task to display inputs and outputs
   initial
     $monitor(" input =%b  selection line =%0d  oputput = %b " , i,s,out);
  	   

   //Step7 : Use $finish task to terminate the simulation at 100ns
  
endmodule

