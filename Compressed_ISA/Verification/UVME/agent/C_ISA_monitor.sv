class C_ISA_monitor extends uvm_monitor;

    // Factory registration
    `uvm_component_utils(C_ISA_monitor)

    // Creating interface and sequence item handle
    C_ISA_seq_item seq_item;
    virtual C_ISA_inf intf; 

    // Analysis port to send transactions to the scoreboard
    uvm_analysis_port #(C_ISA_seq_item) monitor_port;

    // Constructor
    function new(string name = "C_ISA_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
	if (!uvm_config_db#(virtual C_ISA_inf)::get(this, "*", "C_ISA_inf", intf)) begin
            `uvm_fatal(get_full_name(), "Error while getting read interface from top monitor")
        end
        monitor_port = new("monitor_port", this); // Initialize analysis port
    endfunction

    // Run phase (Captures transactions)
    task run_phase(uvm_phase phase);
         super.run_phase(phase);

	 	seq_item = C_ISA_seq_item::type_id::create("seq_item",this);
	
	forever begin
        `uvm_info(get_full_name,$sformatf("Monitor start"),UVM_MEDIUM)
      
        `uvm_info(get_full_name,$sformatf("Inside Monitor run phase"),UVM_MEDIUM)
              
            @(intf.monitor_cb);
	//output signals
	seq_item.risc_rst = intf.monitor_cb.risc_rst;
	seq_item.instruction = intf.monitor_cb.instruction;
	seq_item.data_mem_write_en_o = intf.monitor_cb.data_mem_write_en_o;
	seq_item.data_mem_write_data_o = intf.monitor_cb.data_mem_write_data_o;
	seq_item.data_mem_write_addr_o = intf.monitor_cb.data_mem_write_addr_o;
	seq_item.data_mem_read_en_o = intf.monitor_cb.data_mem_read_en_o;
	seq_item.data_mem_read_addr_o = intf.monitor_cb.data_mem_read_addr_o;
	seq_item.id_ex_mem_rd_en = intf.monitor_cb.id_ex_mem_rd_en;
	seq_item.data_mem_read_data_i = intf.monitor_cb.data_mem_read_data_i;
	seq_item.stall_pipeline = intf.monitor_cb.stall_pipeline;
	seq_item.ebreak_valid = intf.monitor_cb.ebreak_valid;
	seq_item.carry = intf.monitor_cb.carry;
	seq_item.zero = intf.monitor_cb.zero;

      void'(uvm_hdl_read("C_ISA_top.dut.instr_decoder.instruction_r[15:0]", seq_item.instruction_r)); 
      void'(uvm_hdl_read("C_ISA_top.dut.instr_decoder.invalid_instruction_valid_o", seq_item.invalid_instruction_valid_o)); 
      void'(uvm_hdl_read("C_ISA_top.dut.instr_decoder.opcode[1:0]", seq_item.opcode)); 
      void'(uvm_hdl_read("C_ISA_top.dut.instr_decoder.func2[1:0]", seq_item.func2)); 
      void'(uvm_hdl_read("C_ISA_top.dut.instr_decoder.func3[2:0]", seq_item.func3)); 
      void'(uvm_hdl_read("C_ISA_top.dut.instr_decoder.func4[3:0]", seq_item.func4));       
      void'(uvm_hdl_read("C_ISA_top.dut.instr_decoder.func6[5:0]", seq_item.func6)); 
      void'(uvm_hdl_read("C_ISA_top.dut.instr_decoder.func6[5:0]", seq_item.func6)); 
      void'(uvm_hdl_read("C_ISA_top.dut.instr_decoder.rs1[4:0]", seq_item.rs1)); 
      void'(uvm_hdl_read("C_ISA_top.dut.instr_decoder.rs2[4:0]", seq_item.rs2)); 

      void'(uvm_hdl_read("C_ISA_top.dut.fwd_inst.alu_data_in_1[31:0]", seq_item.oper1)); 
      void'(uvm_hdl_read("C_ISA_top.dut.fwd_inst.alu_data_in_2[31:0]", seq_item.oper2)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.add_en", seq_item.add_en)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.sub_en", seq_item.sub_en)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.or_en", seq_item.or_en)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.xor_en", seq_item.xor_en)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.and_en", seq_item.and_en)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.mvi_en", seq_item.mv_en)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.sll_en", seq_item.slli_en)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.srl_en", seq_item.srli_en)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.sra_en", seq_item.srai_en)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.add_inst.rslt[31:0]", seq_item.add_result)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.sub_inst.rslt[31:0]", seq_item.sub_result)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.or_inst.rslt[31:0]", seq_item.or_result)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.xor_inst.rslt[31:0]", seq_item.xor_result)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.and_inst.rslt[31:0]", seq_item.and_result)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.mvi_inst.result[31:0]", seq_item.mv_result)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.sll_inst.rslt[31:0]", seq_item.slli_result)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.srl_inst.rslt[31:0]", seq_item.srli_result)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.sra_inst.result[31:0]", seq_item.srai_result)); 
      void'(uvm_hdl_read("C_ISA_top.dut.instr_decoder.ebreak_valid_o_r", seq_item.ebreak_valid_o_r)); 
      void'(uvm_hdl_read("C_ISA_top.dut.instr_decoder.imm_val[31:0]", seq_item.imm_val)); 

      //load immediate
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.lui_en", seq_item.lui_en)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.lui_inst.oper2[31:0]", seq_item.load_imm_val)); 
      void'(uvm_hdl_read("C_ISA_top.dut.alu_inst.lui_inst.lui_out[31:0]", seq_item.lui_result)); 
	

      //load
      void'(uvm_hdl_read("C_ISA_top.dut.addr_gen_inst.ld_valid_o", seq_item.lw_en)); 
      void'(uvm_hdl_read("C_ISA_top.dut.addr_gen_inst.oper1[31:0]", seq_item.l_reg_val)); 
      void'(uvm_hdl_read("C_ISA_top.dut.addr_gen_inst.oper2[31:0]", seq_item.l_imm_val)); 
      void'(uvm_hdl_read("C_ISA_top.dut.addr_gen_inst.addr_temp[31:0]", seq_item.l_addr_result)); 

	//store
      void'(uvm_hdl_read("C_ISA_top.dut.addr_gen_inst.sd_valid_o", seq_item.sw_en)); 
      void'(uvm_hdl_read("C_ISA_top.dut.addr_gen_inst.oper1[31:0]", seq_item.s_reg_val)); 
      void'(uvm_hdl_read("C_ISA_top.dut.addr_gen_inst.imm_val[31:0]", seq_item.s_imm_val)); 
      void'(uvm_hdl_read("C_ISA_top.dut.addr_gen_inst.addr_temp[31:0]", seq_item.s_addr_result)); 


      $display("Monitor instruction_r=%0b", seq_item.instruction_r);
      $display("Monitor invalid_instruction_valid_o=%0b", seq_item.invalid_instruction_valid_o);
      $display("Monitor opcode=%0b", seq_item.opcode);
      $display("Monitor func2=%0b", seq_item.func2);
      $display("Monitor func3=%0b", seq_item.func3);
      $display("Monitor func4=%0b", seq_item.func4);
      $display("Monitor func6=%0b", seq_item.func6);
      $display("Monitor rs1=%0b", seq_item.rs1);
      $display("Monitor rs2=%0b", seq_item.rs2);

      $display("Monitor oper1=%0h", seq_item.oper1);
      $display("Monitor oper2=%0h", seq_item.oper2);
      $display("Monitor imm_val=%0h", seq_item.imm_val);
      $display("Monitor add_en=%0b", seq_item.add_en);
      $display("Monitor sub_en=%0b", seq_item.sub_en);
      $display("Monitor or_en=%0b", seq_item.or_en);
      $display("Monitor xor_en=%0b", seq_item.xor_en);
      $display("Monitor and_en=%0b", seq_item.and_en);
      $display("Monitor mv_en=%0b", seq_item.mv_en);
      $display("Monitor slli_en=%0b", seq_item.slli_en);
      $display("Monitor srli_en=%0b", seq_item.srli_en);
      $display("Monitor srai_en=%0b", seq_item.srai_en);
      $display("Monitor add_result=%0h", seq_item.add_result);
      $display("Monitor sub_result=%0h", seq_item.sub_result);
      $display("Monitor or_result=%0h", seq_item.or_result);
      $display("Monitor xor_result=%0h", seq_item.xor_result);
      $display("Monitor and_result=%0h", seq_item.and_result);
      $display("Monitor mv_result=%0h", seq_item.mv_result);
      $display("Monitor slli_result=%0h", seq_item.slli_result);
      $display("Monitor srli_result=%0h", seq_item.srli_result);
      $display("Monitor srai_result=%0h", seq_item.srai_result);
      $display("Monitor ebreak_valid_o_r=%0b", seq_item.ebreak_valid_o_r);
      
      $display("Monitor lui_en=%0b", seq_item.lui_en);
      $display("Monitor load_imm_val=%0b", seq_item.load_imm_val);
      $display("Monitor lui_result=%0b", seq_item.lui_result);

      $display("Monitor lw_en=%0b", seq_item.lw_en);
      $display("Monitor l_reg_val=%0b", seq_item.l_reg_val);
      $display("Monitor l_imm_val=%0b", seq_item.l_imm_val);
      $display("Monitor l_addr_result=%0b", seq_item.l_addr_result);
      
      $display("Monitor sw_en=%0b", seq_item.sw_en);
      $display("Monitor s_reg_val=%0b", seq_item.s_reg_val);
      $display("Monitor s_imm_val=%0b", seq_item.s_imm_val);
      $display("Monitor s_addr_result=%0b", seq_item.s_addr_result);
      

`uvm_info("C_ISA_monitor", $sformatf(
                    "Time: %0t | risc_rst: %0b, instruction: %0b, data_mem_write_en_o: %0h, data_mem_write_data_o: %0h, data_mem_write_addr_o: %0d, data_mem_read_en_o: %0b, data_mem_read_addr_o: %0d, id_ex_mem_rd_en:%0b, data_mem_read_data_i: %0h, stall_pipeline: %0b, ebreak_valid: %0b, carry: %0b, zero: %0b",
                    $realtime, seq_item.risc_rst, seq_item.instruction, seq_item.data_mem_write_en_o, seq_item.data_mem_write_data_o,seq_item.data_mem_write_addr_o, seq_item.data_mem_read_en_o, seq_item.data_mem_read_addr_o, seq_item.id_ex_mem_rd_en, seq_item.data_mem_read_data_i, seq_item.stall_pipeline, seq_item.ebreak_valid, seq_item.carry, seq_item.zero), UVM_LOW);
          
             `uvm_info(get_full_name,$sformatf("End of Monitor"),UVM_MEDIUM)
             monitor_port.write(seq_item);

		end 
    endtask

endclass
