

module clock_buffer(input master_clk,output slave_clk);

// declaring the input and output ports 
// completed in mdoule declaration

//using buf premitive

 buf B(slave_clk,master_clk);

 endmodule 
