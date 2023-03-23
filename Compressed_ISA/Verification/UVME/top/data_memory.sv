module data_memory (
    input  bit          data_mem_clk,
    input  bit          data_mem_write_en_o,
    input  bit 		id_ex_mem_rd_en,
//    input  bit 		id_ex_mem_wr_en,
    input  bit [31:0] data_mem_write_addr_o,
    input  bit [31:0] data_mem_write_data_o, 
    input  bit          data_mem_read_en,
    input  bit [31:0] data_mem_read_addr,
    output reg [31:0] data_mem_read_data_i
    );

   bit [31:0] mem_data;


    //-> 512 KB memory (32-bit words)
    bit [31:0] mem [0:16383];  

    //-> Load memory with data from a hex file
    initial begin
        $display("Loading instruction memory from data.hex");
        $readmemh("data.hex", mem);
    end


  //-> Write bit
 
      always_ff@(posedge data_mem_clk) begin
        if (data_mem_write_en_o) 
            mem[data_mem_write_addr_o] <= data_mem_write_data_o;
    
    end

 //-> Read bit
       
   always_ff @(posedge data_mem_clk) begin
    if (data_mem_read_en) begin
    data_mem_read_data_i <= mem[data_mem_read_addr];  
  end
   else begin
     data_mem_read_data_i <= 32'd0;
  end
  end

endmodule
