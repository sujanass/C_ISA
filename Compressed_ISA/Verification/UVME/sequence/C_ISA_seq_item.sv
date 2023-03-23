class C_ISA_seq_item extends uvm_sequence_item;
	//inputs
rand logic risc_clk;
rand logic risc_rst;
rand logic [15:0] instruction;
rand logic [31:0] data_mem_read_data_i;
    
    // Outputs
rand    logic data_mem_write_en_o;
rand    logic [31:0] data_mem_write_data_o;
rand    logic [31:0] data_mem_write_addr_o;
rand    logic data_mem_read_en_o;
rand    logic [31:0] data_mem_read_addr_o;
rand    logic  id_ex_mem_rd_en;
rand 	logic ex_mem_mem_rd_en;
rand	logic stall_pipeline;
rand    logic ebreak_valid;
rand    logic carry;
rand    logic zero;
	bit [15:0] instruction_r;
	bit [1:0] opcode;
	bit [1:0] func2;
	bit [2:0] func3;
	bit [3:0] func4;
	bit [5:0] func6;
	bit [5:0] rs1;
	bit [5:0] rs2;

	bit  invalid_instruction_valid_o;
	bit signed [31:0] oper1;
	bit signed [31:0] oper2;
	bit add_en;
	bit sub_en;	
	bit or_en;	
	bit xor_en;	
	bit and_en;	
	bit mv_en;	
	bit slli_en;	
	bit srli_en;	
	bit srai_en;	
	bit [31:0] add_result;
	bit [31:0] sub_result;
	bit [31:0] or_result;
	bit [31:0] xor_result;
	bit [31:0] and_result;
	bit [31:0] mv_result;
	bit [31:0] slli_result;
	bit [31:0] srli_result;
	bit [31:0] srai_result;
	bit ebreak_valid_o_r;
	bit signed [31:0] imm_val;
	bit sw_en;
	bit signed [31:0] s_reg_val;
	bit signed [31:0] s_imm_val;
	bit signed [31:0] s_addr_result;
	bit lw_en;
	bit signed [31:0] l_reg_val;
	bit signed [31:0] l_imm_val;
	bit signed [31:0] l_addr_result;
	bit lui_en;
	bit signed [31:0] load_imm_val;
	bit signed [31:0] lui_result;
 
 //factory registration
 `uvm_object_utils_begin(C_ISA_seq_item)
 `uvm_field_int(risc_clk        		,UVM_ALL_ON)
 `uvm_field_int(risc_rst      		  	,UVM_ALL_ON) 
 `uvm_field_int(instruction       		,UVM_ALL_ON)
 `uvm_field_int(data_mem_read_data_i        	,UVM_ALL_ON)  
 `uvm_field_int(data_mem_write_en_o        	,UVM_ALL_ON)
 `uvm_field_int(data_mem_write_data_o        	,UVM_ALL_ON)
 `uvm_field_int(data_mem_write_addr_o        	,UVM_ALL_ON)
 `uvm_field_int(data_mem_read_en_o        	,UVM_ALL_ON)
 `uvm_field_int(data_mem_read_addr_o        	,UVM_ALL_ON)
 `uvm_field_int(id_ex_mem_rd_en        		,UVM_ALL_ON)
 `uvm_field_int(ex_mem_mem_rd_en        	,UVM_ALL_ON)
 `uvm_field_int(stall_pipeline	        	,UVM_ALL_ON)
 `uvm_field_int(ebreak_valid        		,UVM_ALL_ON)
 `uvm_field_int(carry        			,UVM_ALL_ON)
 `uvm_field_int(zero        			,UVM_ALL_ON)
 `uvm_field_int(instruction_r        		,UVM_ALL_ON)
 `uvm_field_int(opcode        			,UVM_ALL_ON)
 `uvm_field_int(func2        			,UVM_ALL_ON)
 `uvm_field_int(func3        			,UVM_ALL_ON)
 `uvm_field_int(func4        			,UVM_ALL_ON)
 `uvm_field_int(func6        			,UVM_ALL_ON)
 `uvm_field_int(invalid_instruction_valid_o     ,UVM_ALL_ON)
 `uvm_field_int(oper1        			,UVM_ALL_ON)
 `uvm_field_int(oper2        			,UVM_ALL_ON)
 `uvm_field_int(add_en        			,UVM_ALL_ON)
 `uvm_field_int(sub_en        			,UVM_ALL_ON) 
 `uvm_field_int(or_en        			,UVM_ALL_ON) 
 `uvm_field_int(xor_en        			,UVM_ALL_ON) 
 `uvm_field_int(and_en        			,UVM_ALL_ON) 
 `uvm_field_int(mv_en        			,UVM_ALL_ON) 
 `uvm_field_int(slli_en        			,UVM_ALL_ON) 
 `uvm_field_int(srli_en        			,UVM_ALL_ON) 
 `uvm_field_int(srai_en        			,UVM_ALL_ON) 
 `uvm_field_int(add_result        		,UVM_ALL_ON)
 `uvm_field_int(sub_result        		,UVM_ALL_ON)
 `uvm_field_int(or_result        		,UVM_ALL_ON)
 `uvm_field_int(xor_result        		,UVM_ALL_ON)
 `uvm_field_int(and_result        		,UVM_ALL_ON)
 `uvm_field_int(mv_result        		,UVM_ALL_ON)
 `uvm_field_int(slli_result        		,UVM_ALL_ON)
 `uvm_field_int(srli_result        		,UVM_ALL_ON)
 `uvm_field_int(srai_result        		,UVM_ALL_ON)
 `uvm_field_int(ebreak_valid_o_r        	,UVM_ALL_ON)
 `uvm_field_int(imm_val 		       	,UVM_ALL_ON)
 
 `uvm_field_int(lui_en	 		       	,UVM_ALL_ON)
 `uvm_field_int(load_imm_val 		       	,UVM_ALL_ON)
 `uvm_field_int(lui_result 		       	,UVM_ALL_ON)

`uvm_field_int(lw_en	 		       	,UVM_ALL_ON)
 `uvm_field_int(l_reg_val 		       	,UVM_ALL_ON)
 `uvm_field_int(l_imm_val 		       	,UVM_ALL_ON)
 `uvm_field_int(l_addr_result 		       	,UVM_ALL_ON)

`uvm_field_int(sw_en	 		       	,UVM_ALL_ON)
 `uvm_field_int(s_reg_val 		       	,UVM_ALL_ON)
 `uvm_field_int(s_imm_val 		       	,UVM_ALL_ON)
 `uvm_field_int(s_addr_result 		       	,UVM_ALL_ON)

 `uvm_object_utils_end


 //constructor
  function new(string name="C_ISA_seq_item");
   super.new(name);
  endfunction

endclass
