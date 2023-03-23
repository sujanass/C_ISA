interface C_ISA_inf(input bit risc_clk);
    // Inputs
    logic risc_rst;
    logic [15:0] instruction;
    
    // Outputs
    logic data_mem_write_en_o;
    logic [31:0] data_mem_write_data_o;
    logic [31:0] data_mem_write_addr_o;
    logic data_mem_read_en_o;
    logic [31:0] data_mem_read_addr_o;
    logic        id_ex_mem_rd_en;
    logic [31:0] data_mem_read_data_i;    //input  
    logic ex_mem_mem_rd_en;
    logic stall_pipeline;
    logic ebreak_valid;
    logic carry;
    logic zero;
    
    clocking driver_cb @(negedge risc_clk);
        output risc_rst;
        output instruction;
        input data_mem_write_en_o;
        input data_mem_write_data_o;
        input data_mem_write_addr_o;
        input data_mem_read_en_o;
        input data_mem_read_addr_o;
        input id_ex_mem_rd_en;
	output data_mem_read_data_i; //output	
	input stall_pipeline;
	input ebreak_valid;
	input carry;
        input zero;
    endclocking

 clocking monitor_cb @ (posedge risc_clk);

  default input #0 output #0;

  input risc_rst, instruction, data_mem_write_en_o, data_mem_write_data_o, data_mem_write_addr_o, data_mem_read_en_o, data_mem_read_addr_o, id_ex_mem_rd_en, data_mem_read_data_i, stall_pipeline, ebreak_valid, carry, zero;
  
  endclocking

modport driver(clocking driver_cb);
modport monitor(clocking monitor_cb);

endinterface
