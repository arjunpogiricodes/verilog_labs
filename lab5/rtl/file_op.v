
module file_opearation();


   /*  reg reset,clk;
     reg [1:0]coin_in;
     wire product,chan*/
     reg [12:0]data[3:0]; 
	  
	  reg a = 1;
	  reg [1:0]b = 2'b10;
	  reg [4:0]c= 5'b11100;
	  reg [3:0]f = 4'hf;

  integer channel_1,i;

//vending_machine DUT(.clk(clk),.reset(reset),.coin_in(coin_in),.product(product),.change(change));
  //vending_machine_tb DUU();

 initial
    begin
      channel_1 = $fopen("arjun_file_operations.txt");
      #30;
      //$fmonitor(channel_1,$time,"state = %b\tdin = %b  \np =%b\tcha =%b ", DUU.DUT.present_state,coin_in,product,change);
		//$fmonitor(channel_1,$time,"din = %b \np =%b\tcha =%b ",coin_in,product,change);
		$fmonitor(channel_1,$time,"a=%bb=%bc=%df=%h",a,b,c,f);
      #150;
      $fclose(channel_1);
     end
    
  initial
     begin
      #200;
		
      $readmemb("arjun_file_operations.txt " ,data);
		channel_1 =$fopen("data.out");
     // #100;
		$display("read data:");
		for(i=0;i<4;i=i+1)
		begin
 
	   $fdisplay(channel_1,"data[%d]=%b",i,data[i]);
		#100;
		$fclose(channel_1);
	  // #10;
      end	
     end
endmodule     
            
