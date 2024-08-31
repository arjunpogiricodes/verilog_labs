

module synchronizer_router_tb();

// declaring the input and output ports

   reg detect_destin_addr,write_enb_reg,clk,reset,read_enb_0,read_enb_1,read_enb_2,empty_0,empty_1,empty_2,full_0,full_1,full_2;
   reg [1:0]data_in;
   wire vld_out_0,vld_out_1,vld_out_2;
   wire [2:0]write_enb;
   wire fifo_full;
   wire soft_reset_0,soft_reset_1,soft_reset_2;
   integer i;

// instantiating of synchronize rtl file

  synchronizer_router  DUT(.detect_add(detect_destin_addr),.data_in(data_in),.write_enb_reg(write_enb_reg),.clk(clk),.reset(reset),.vld_out_0(vld_out_0),.vld_out_1(vld_out_1),.vld_out_2(vld_out_2),.read_enb_0(read_enb_0),.read_enb_1(read_enb_1),.read_enb_2(read_enb_2),.write_enb(write_enb),.fifo_full(fifo_full),.empty_0(empty_0),.empty_1(empty_1),.empty_2(empty_2),.soft_reset_0(soft_reset_0),.soft_reset_1(soft_reset_1),.soft_reset_2(soft_reset_2),.full_0(full_0),.full_1(full_1),.full_2(full_2));

// task iniitlize 

   task initialize;
     begin
        {clk,empty_0,empty_1,empty_2,full_0,full_1,full_2,read_enb_0,read_enb_1,read_enb_2,detect_destin_addr,write_enb_reg}=0;
     end
   endtask

// generating clk

  always #5 clk=~clk;

// creating task for reaset data

  task reset_n;
      begin
       @(negedge clk)
        reset =1'b0;
       @(negedge clk)
         reset =1'b1;
      end
   endtask

// creating task for data_in

   task data_input;
       begin
        detect_destin_addr = 1;
        data_in =2'b00;
      end
    endtask

// implementing  all task for adress    
  
    initial
       begin
         initialize;
         reset_n;
			write_enb_reg=1'b1;
         data_input;
         #30
         @(negedge clk)	 
	      full_0=1'b1;   
         #10
	      @(negedge  clk)
	      full_0=1'b0;
	      #20;
	     @(negedge clk)
	     empty_0= 1'b1;
         #10;
	       @(negedge clk)
         empty_0= 1'b0;
	      #30;
	      @(negedge clk)
	     read_enb_0 =1'b1;
	     #10;
	     @(negedge clk)
	     read_enb_0=1'b1;
         #10;
	     @(negedge clk)
	     read_enb_0 =1'b0;
	     #30;
        end
 initial
   $monitor("",);
endmodule	 

