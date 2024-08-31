

// test bench for top

module router_top_tb();

//(clk,reset,read_enb_0,read_enb_1,read_enb_2,data_in,pkt_valid,data_out_0,data_out_1,data_out_2,valid_out_0,valid_out_1,valid_out_2,error,busy);

// input and output declaration
    reg clk,reset,read_enb_0,read_enb_1,read_enb_2,pkt_valid;
    reg [7:0]data_in;
    wire [7:0]data_out_0,data_out_1,data_out_2;
    wire valid_out_0,valid_out_1,valid_out_2,error,busy;
    integer i;
// instantiatin
   router_top DUT(clk,reset,read_enb_0,read_enb_1,read_enb_2,data_in,pkt_valid,data_out_0,data_out_1,data_out_2,valid_out_0,valid_out_1,valid_out_2,error,busy);

/*
top module

module router_top(clk,reset,read_enb_0,read_enb_1,read_enb_2,data_in,pkt_valid,data_out_0,data_out_1,data_out_2,valid_out_0,valid_out_1,valid_out_2,error,busy);
*/

// initialize all the values

  task initialize;
       begin
           clk=0;
       end
  endtask
// generating clk

 always #10 clk=~clk;

// reset task
 
   task reset_n;
      begin
          @(negedge clk)
           reset=1'b0;
          @(negedge clk)
           reset=1'b1;
      end
    endtask

// packet sending

  task packet1;
     reg [7:0]header,payload,parity;
	  reg [5:0]lenth;
	  reg [1:0]addr;
     begin
	  wait(!busy)
	  @(negedge clk)
     pkt_valid =1'b1;
	 // @(negedge clk)
	  lenth = 6'b000110;
	  addr  = 2'b01;
	  header ={lenth,addr};
	  data_in=header;
     parity = 8'b0^header;
	  #10;
       @(negedge clk)
        wait(!busy)		 
          for(i=0;i<lenth;i=i+1)
            begin
				 wait(!busy)
				 @(negedge clk)
             payload = {$random}%256;
				 data_in=payload;
				 parity = parity ^ payload;
           end
     @(negedge clk)
	  wait(!busy)
	  pkt_valid =1'b0;
     //parity = parity;
     data_in = parity;	  
	 end
   endtask
	
	
   task packet2;
     reg [7:0]header,payload,parity;
	  reg [5:0]lenth;
	  reg [1:0]addr;
     begin
     @(negedge clk)
	  wait(!busy)
     pkt_valid =1'b1;
	  lenth = 6'b000111;
	  addr  = 2'b00;
	  header ={lenth,addr};
	  data_in=header;
     parity = 0^header;    	  
       @(negedge clk)
        wait(!busy)		 
          for(i=0;i<lenth;i=i+1)
            begin
				 wait(!busy)
				 @(negedge clk)
             payload = 100+{$random}%50;
				 data_in=payload;
				 parity = parity ^ payload;
           end
     @(negedge clk)
	  wait(!busy)
	  pkt_valid =1'b0;
	  @(negedge clk)
     parity = parity;
     data_in = parity;	  
	 end
   endtask

// including all the tasks

   initial
       begin
         initialize;
         reset_n;
	        
          packet1;
			  #10;
			//read_enb_0=1'b1;
			 read_enb_1=1'b1;
			//read_enb_2 =1'b1;
			//#5;

       end
 initial
 $monitor("present = %b write_enb_reg =%b data_in =%b  data_out_0 =%b data_out_1 =%b data_out_2 =%b  " ,DUT.FSM.present,DUT.FSM.write_enb_reg,data_in,data_out_0,data_out_1,data_out_2);
endmodule 	 

    

