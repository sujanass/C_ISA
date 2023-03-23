class C_ISA_scoreboard extends uvm_scoreboard;
  // Factory registration
  `uvm_component_utils(C_ISA_scoreboard)
  
  // Analysis port to receive transactions from monitor
  uvm_analysis_imp#(C_ISA_seq_item, C_ISA_scoreboard) scoreboard_port;
  virtual C_ISA_inf intf; 
  
	logic [31:0] sum;
	logic [31:0] difference;
	logic [31:0] or_logic;
	logic [31:0] xor_logic;
	logic [31:0] and_logic;
	logic signed [31:0] andi_logic;
	logic signed [31:0] addi_logic;
	logic signed [31:0] addi4sp_logic;
	logic signed [31:0] addi16sp_logic;
	logic [31:0] slli_logic;
	logic [31:0] srli_logic;
	logic signed [31:0] srai_logic;
	logic [31:0] mv_logic;
	logic [31:0] sw_logic;
	logic [31:0] lw_logic;
	logic [31:0] lui_logic;

  // Constructor
  function new(string name = "C_ISA_scoreboard", uvm_component parent = null);
    super.new(name, parent);
    `uvm_info("SCOREBOARD", "Constructor called", UVM_HIGH)
  endfunction : new
  
  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    scoreboard_port = new("scoreboard_port", this);
    if (!uvm_config_db#(virtual C_ISA_inf)::get(this, "*", "C_ISA_inf", intf)) begin
            `uvm_fatal(get_full_name(), "Error while getting read interface from scoreboard")
	    end

    `uvm_info("SCOREBOARD", "Build phase completed", UVM_HIGH)
  endfunction : build_phase

  // Write method - called when monitor sends a transaction

	function void write(C_ISA_seq_item item);

	`uvm_info("SCOREBOARD", $sformatf("Received Instruction = %b, opcode = %b, funct4 = %b, invalid_instruction_valid_o = %b, result = %h", item.instruction_r, item.opcode, item.func4, item.invalid_instruction_valid_o, item.add_result), UVM_LOW)
		
		if(item.risc_rst)begin
		`uvm_info("SCOREBOARD", $sformatf("RESET=%0d",item.risc_rst), UVM_MEDIUM)

			if(!item.invalid_instruction_valid_o)begin
				if(item.add_en)begin
					if(item.oper2!=0)begin
					sum=(item.oper1 + item.oper2);
					`uvm_info("SCOREBOARD", $sformatf("oper1=%0d and oper2=%0d, Sum computed: %0d",$signed(item.oper1), $signed(item.oper2), $signed(sum)), UVM_MEDIUM)
					
						if(sum==item.add_result)begin
     						`uvm_info("SCOREBOARD", $sformatf("addition operation oper1=%0d and oper2=%0d,Expected: %0d, Got: %0d Result Matched ",$signed(item.oper1), $signed(item.oper2), $signed(sum), $signed(item.add_result)), UVM_MEDIUM)	
						
						end
						else begin
      						`uvm_error("SCOREBOARD", $sformatf("add result mismatched - Expected: %0h, Got: %0h",sum, item.add_result))
						
						end

					end
					else if(item.imm_val!=0)begin
					addi_logic=(item.oper1 + item.imm_val);
					`uvm_info("SCOREBOARD", $sformatf("oper1=%0d and imm_val=%0d, ADD Immdiate computed: %0d",$signed(item.oper1), $signed(item.imm_val), $signed(addi_logic)), UVM_MEDIUM)
					
						if(addi_logic==item.add_result)begin
     						`uvm_info("SCOREBOARD", $sformatf("addition immediate operation oper1=%0d and oper2=%0d,Expected: %0d, Got: %0d Result Matched ",$signed(item.oper1), $signed(item.imm_val), $signed(addi_logic), $signed(item.add_result)), UVM_MEDIUM)	
						
						end
						else begin
      						`uvm_error("SCOREBOARD", $sformatf("ADD Immediate result mismatched - Expected: %0h, Got: %0h",addi_logic, item.add_result))
						
						end

					end
				end
				//EBREAK INSTRUCTION
				else if(item.ebreak_valid_o_r)begin
     				`uvm_info("SCOREBOARD", $sformatf("Ebreak Instruction"), UVM_MEDIUM)	
				end 
				//SUBTRACTION CHECKER
				else if(item.sub_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("SUBTRACTION Instruction=%b",item.sub_en), UVM_MEDIUM)	

				difference=(item.oper1 - item.oper2);
				`uvm_info("SCOREBOARD", $sformatf("oper1=%0h and oper2=%0h, difference computed: %h",item.oper1, item.oper2, difference), UVM_MEDIUM)

					if(difference==item.sub_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("sub oper1=%0h and oper2=%0h,Expected: %0h, Got: %0h Result Matched ",item.oper1, item.oper2, difference, item.sub_result), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("sub result mismatched - Expected: %0h, Got: %0h",difference, item.sub_result))
					end
				end
				//OR INSTRUCTION CHECKER
				else if(item.or_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("OR Instruction=%b",item.or_en), UVM_MEDIUM)	

				or_logic=(item.oper1 | item.oper2);
				`uvm_info("SCOREBOARD", $sformatf("oper1=%0h and oper2=%0h, OR logic computed: %h",item.oper1, item.oper2, or_logic), UVM_MEDIUM)

					if(or_logic==item.or_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("OR oper1=%0h and oper2=%0h,Expected: %0h, Got: %0h Result Matched ",item.oper1, item.oper2, or_logic, item.or_result), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("OR result mismatched - Expected: %0h, Got: %0h",or_logic, item.or_result))
					end
				end
				// XOR INSTRUCTION CHECKER
				else if(item.xor_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("XOR Instruction=%b",item.xor_en), UVM_MEDIUM)	

				xor_logic=(item.oper1 ^ item.oper2);
				`uvm_info("SCOREBOARD", $sformatf("oper1=%0h and oper2=%0h, XOR logic computed: %h",item.oper1, item.oper2, xor_logic), UVM_MEDIUM)

					if(xor_logic==item.xor_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("XOR oper1=%0h and oper2=%0h,Expected: %0h, Got: %0h Result Matched ",item.oper1, item.oper2, xor_logic, item.xor_result), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("XOR result mismatched - Expected: %0h, Got: %0h",xor_logic, item.xor_result))
					end
				end
				// AND INSTRUCTION CHECKER
				else if(item.and_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("AND Instruction=%b",item.and_en), UVM_MEDIUM)	

					if(item.oper2!=0)begin
					and_logic=(item.oper1 & item.oper2);
					`uvm_info("SCOREBOARD", $sformatf("oper1=%0h and oper2=%0h, AND logic computed: %h",item.oper1, item.oper2, and_logic), UVM_MEDIUM)

						if(and_logic==item.and_result)begin
     						`uvm_info("SCOREBOARD", $sformatf("AND oper1=%0h and oper2=%0h,Expected: %0h, Got: %0h Result Matched ",item.oper1, item.oper2, and_logic, item.and_result), UVM_MEDIUM)	
						end
						else begin
      						`uvm_error("SCOREBOARD", $sformatf("AND result mismatched - Expected: %0h, Got: %0h",and_logic, item.and_result))
						end
					end
					else if(item.imm_val!=0)begin
					andi_logic=(item.oper1 & item.imm_val);
					`uvm_info("SCOREBOARD", $sformatf("oper1=%0h and imm_val=%0h, AND IMMEDIATE logic computed: %h",item.oper1, item.imm_val, andi_logic), UVM_MEDIUM)

						if(andi_logic==item.and_result)begin
     						`uvm_info("SCOREBOARD", $sformatf("AND IMMEDIATE oper1=%0h and imm_val=%0h,Expected: %0h, Got: %0h Result Matched ",item.oper1, item.imm_val, andi_logic, item.and_result), UVM_MEDIUM)	
						end
						else begin
      						`uvm_error("SCOREBOARD", $sformatf("AND IMMEDIATE result mismatched - Expected: %0h, Got: %0h",andi_logic, item.and_result))
						end
					end
				end
				else if(item.slli_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("SLLI Instruction=%b",item.slli_en), UVM_MEDIUM)

				slli_logic=(item.oper1 << item.imm_val);
				`uvm_info("SCOREBOARD", $sformatf("oper1=%0h and oper2=%0h, SLLI is computed: %h",item.oper1, item.imm_val, slli_logic), UVM_MEDIUM)

					if(slli_logic==item.slli_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("SLLI_logic oper1=%0h and oper2=%0h,Expected: %0h, Got: %0h Result Matched ",item.oper1, item.imm_val, slli_logic, item.slli_result), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("SLLI_logic result mismatched - Expected: %0h, Got: %0h",slli_logic, item.slli_result))
					end
				end
				else if(item.srli_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("SRLI Instruction=%b",item.srli_en), UVM_MEDIUM)

				srli_logic=(item.oper1 >> item.imm_val);
				`uvm_info("SCOREBOARD", $sformatf("oper1=%0d and oper2=%0d, SRLI is computed: %0d",$signed(item.oper1), $signed(item.imm_val), $signed(srli_logic)), UVM_MEDIUM)

					if(srli_logic==item.srli_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("SRLI_logic oper1=%0d and oper2=%0d,Expected: %0d, Got: %0d Result Matched ",$signed(item.oper1), $signed(item.imm_val), $signed(srli_logic), $signed(item.srli_result)), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("SRLI_logic result mismatched - Expected: %0h, Got: %0h",srli_logic, item.srli_result))
					end
				end
				else if(item.srai_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("SRAI Instruction=%b",item.srai_en), UVM_MEDIUM)

				srai_logic=(item.oper1 >>> item.imm_val);
				`uvm_info("SCOREBOARD", $sformatf("oper1=%0d and imm_val=%0d, SRAI is computed: %0d",$signed(item.oper1), $signed(item.imm_val), $signed(srai_logic)), UVM_MEDIUM)

					if(srai_logic==item.srai_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("SRAI_logic oper1=%0d and oper2=%0d,Expected: %0d, Got: %0d Result Matched ",$signed(item.oper1), $signed(item.imm_val), $signed(srai_logic), $signed(item.srai_result)), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("SRAI_logic result mismatched - Expected: %0h, Got: %0h",srai_logic, item.srai_result))
					end
				end
				else if(item.mv_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("MV Instruction=%b",item.mv_en), UVM_MEDIUM)

				mv_logic=(item.oper2 );
				`uvm_info("SCOREBOARD", $sformatf("oper2=%0h, MV is computed: %h",item.oper2, mv_logic), UVM_MEDIUM)

					if(mv_logic==item.mv_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("MV_logic oper2=%0h,Expected: %0h, Got: %0h Result Matched ",item.oper2, mv_logic, item.mv_result), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("MV_logic result mismatched - Expected: %0h, Got: %0h",mv_logic, item.mv_result))
					end
				end
				else if(item.mv_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("MV Instruction=%b",item.mv_en), UVM_MEDIUM)

				mv_logic=(item.oper2 );
				`uvm_info("SCOREBOARD", $sformatf("oper2=%0h, MV is computed: %h",item.oper2, mv_logic), UVM_MEDIUM)

					if(mv_logic==item.mv_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("MV_logic oper2=%0h,Expected: %0h, Got: %0h Result Matched ",item.oper2, mv_logic, item.mv_result), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("MV_logic result mismatched - Expected: %0h, Got: %0h",mv_logic, item.mv_result))
					end
				end
				else if(item.sw_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("Store word Instruction=%b",item.sw_en), UVM_MEDIUM)

				sw_logic=(item.s_imm_val + item.s_reg_val );
				`uvm_info("SCOREBOARD", $sformatf("s_imm_val=%0h, s_reg_val=%0h, SW address is computed: %h",item.s_imm_val, item.s_reg_val, sw_logic), UVM_MEDIUM)

					if(sw_logic==item.s_addr_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("SW_logic s_imm_val=%0h, s_reg_val=%0h, Expected: %0h, Got: %0h Result Matched ",item.s_imm_val, item.s_reg_val, sw_logic, item.s_addr_result), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("SW_logic result mismatched - Expected: %0h, Got: %0h",sw_logic, item.s_addr_result))
					end
				end
				else if(item.lw_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("Load word Instruction=%b",item.lw_en), UVM_MEDIUM)

				lw_logic=(item.l_imm_val + item.l_reg_val );
				`uvm_info("SCOREBOARD", $sformatf("l_imm_val=%0h, l_reg_val=%0h, LW address is computed: %h",item.l_imm_val, item.l_reg_val, lw_logic), UVM_MEDIUM)

					if(lw_logic==item.l_addr_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("LW_logic l_imm_val=%0h, l_reg_val=%0h, Expected: %0h, Got: %0h Result Matched ",item.l_imm_val, item.l_reg_val, lw_logic, item.l_addr_result), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("LW_logic result mismatched - Expected: %0h, Got: %0h",lw_logic, item.l_addr_result))
					end
				end
				else if(item.lui_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("Load Immediate Instruction=%b",item.lui_en), UVM_MEDIUM)

				lui_logic=(item.load_imm_val);
				`uvm_info("SCOREBOARD", $sformatf("load_imm_val=%0h, Load Imediate value is computed: %h",item.load_imm_val, lui_logic), UVM_MEDIUM)

					if(lui_logic==item.lui_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("Load Immediate load_imm_val=%0h, Expected: %0h, Got: %0h Result Matched ",item.load_imm_val, lui_logic, item.lui_result), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("Load Immediate result mismatched - Expected: %0h, Got: %0h",lui_logic, item.lui_result))
					end
				end

			end

		end
		else begin
      		`uvm_info("SCOREBOARD", $sformatf("RISC_RST is activated: %0h",item.risc_rst),UVM_MEDIUM)

		end


	/*	if(item.risc_rst)begin
		`uvm_info("SCOREBOARD", $sformatf("RESET=%0d",item.risc_rst), UVM_MEDIUM)
	//	end

		 if(!item.invalid_instruction_valid_o)begin
		`uvm_info("SCOREBOARD", "VALID INSTRUCTION", UVM_MEDIUM)

		//ADDITION INSTRUCTION AND EBREAK INSTRUCTION CHECKER
			if(item.opcode==2 && item.func4==9 && item.func3==4)begin
			`uvm_info("SCOREBOARD", $sformatf("OPCODE=%0d and FUNCT=%0d",item.opcode, item.func4), UVM_MEDIUM)

				if(item.add_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("ADD Instruction=%b",item.add_en), UVM_MEDIUM)	

				sum=(item.oper1 + item.oper2);
				`uvm_info("SCOREBOARD", $sformatf("oper1=%0d and oper2=%0d, Sum computed: %0d",$signed(item.oper1), $signed(item.oper2), $signed(sum)), UVM_MEDIUM)

					if(sum==item.add_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("add oper1=%0d and oper2=%0d,Expected: %0d, Got: %0d Result Matched ",$signed(item.oper1), $signed(item.oper2), $signed(sum), $signed(item.add_result)), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("add result mismatched - Expected: %0h, Got: %0h",sum, item.add_result))
					end
				end
				//EBREAK INSTRUCTION
				else if(item.ebreak_valid_o_r)begin
     				`uvm_info("SCOREBOARD", $sformatf("Ebreak Instruction"), UVM_MEDIUM)	
				end 
				else if(item.invalid_instruction_valid_o)begin
     				`uvm_info("SCOREBOARD", $sformatf("INVALID INSTRUCTION=%b",item.invalid_instruction_valid_o), UVM_MEDIUM)	
				end
		
			end
			// SUBTRACTION, OR, XOR INSTRUCTION CHECKER
			else if(item.opcode==1 && item.func6==35)begin
			`uvm_info("SCOREBOARD", $sformatf("OPCODE=%0h and FUNCT=%0h",item.opcode, item.func6), UVM_MEDIUM)
				// SUBTRACTION CHEKER
				if(item.func2==0)begin
				if(item.sub_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("SUBTRACTION Instruction=%b",item.sub_en), UVM_MEDIUM)	

				difference=(item.oper1 - item.oper2);
				`uvm_info("SCOREBOARD", $sformatf("oper1=%0h and oper2=%0h, difference computed: %h",item.oper1, item.oper2, difference), UVM_MEDIUM)

					if(difference==item.sub_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("sub oper1=%0h and oper2=%0h,Expected: %0h, Got: %0h Result Matched ",item.oper1, item.oper2, difference, item.sub_result), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("sub result mismatched - Expected: %0h, Got: %0h",difference, item.sub_result))
					end
				end
				else if(item.invalid_instruction_valid_o)begin
     				`uvm_info("SCOREBOARD", $sformatf("INVALID INSTRUCTION=%b",item.invalid_instruction_valid_o), UVM_MEDIUM)	
				end
				end
				// OR INSTRUCTION CHECKER
				else if(item.func2==2)begin
				if(item.or_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("OR Instruction=%b",item.or_en), UVM_MEDIUM)	

				or_logic=(item.oper1 | item.oper2);
				`uvm_info("SCOREBOARD", $sformatf("oper1=%0h and oper2=%0h, OR logic computed: %h",item.oper1, item.oper2, or_logic), UVM_MEDIUM)

					if(or_logic==item.or_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("OR oper1=%0h and oper2=%0h,Expected: %0h, Got: %0h Result Matched ",item.oper1, item.oper2, or_logic, item.or_result), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("OR result mismatched - Expected: %0h, Got: %0h",or_logic, item.or_result))
					end
				end
				else if(item.invalid_instruction_valid_o)begin
     				`uvm_info("SCOREBOARD", $sformatf("INVALID INSTRUCTION=%b",item.invalid_instruction_valid_o), UVM_MEDIUM)	
				end
				end
				// XOR INSTRUCTION CHECKER
				else if(item.func2==1)begin
				if(item.xor_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("XOR Instruction=%b",item.xor_en), UVM_MEDIUM)	

				xor_logic=(item.oper1 ^ item.oper2);
				`uvm_info("SCOREBOARD", $sformatf("oper1=%0h and oper2=%0h, XOR logic computed: %h",item.oper1, item.oper2, xor_logic), UVM_MEDIUM)

					if(xor_logic==item.xor_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("XOR oper1=%0h and oper2=%0h,Expected: %0h, Got: %0h Result Matched ",item.oper1, item.oper2, xor_logic, item.xor_result), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("XOR result mismatched - Expected: %0h, Got: %0h",xor_logic, item.xor_result))
					end
				end
				else if(item.invalid_instruction_valid_o)begin
     				`uvm_info("SCOREBOARD", $sformatf("INVALID INSTRUCTION=%b",item.invalid_instruction_valid_o), UVM_MEDIUM)	
				end
				end
				// AND INSTRUCTION CHECKER
				else if(item.func2==3)begin
				if(item.and_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("AND Instruction=%b",item.and_en), UVM_MEDIUM)	

				and_logic=(item.oper1 & item.oper2);
				`uvm_info("SCOREBOARD", $sformatf("oper1=%0h and oper2=%0h, AND logic computed: %h",item.oper1, item.oper2, and_logic), UVM_MEDIUM)

					if(and_logic==item.and_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("AND oper1=%0h and oper2=%0h,Expected: %0h, Got: %0h Result Matched ",item.oper1, item.oper2, and_logic, item.and_result), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("AND result mismatched - Expected: %0h, Got: %0h",and_logic, item.and_result))
					end
				end
				else if(item.invalid_instruction_valid_o)begin
     				`uvm_info("SCOREBOARD", $sformatf("INVALID INSTRUCTION=%b",item.invalid_instruction_valid_o), UVM_MEDIUM)	
				end
				end

			end//end of SUBTRACTION, OR, XOR, AND INSTRUCTION CHECKER
			
			// AND IMMEDIATE INSTRUCTOR CHEKER
			else if(item.opcode==1 && item.func2==2 && item.func3==4)begin
			`uvm_info("SCOREBOARD", $sformatf("OPCODE=%0h and FUNC2=%0h and FUNC3=%0h",item.opcode, item.func2, item.func3), UVM_MEDIUM)

				if(item.and_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("AND IMMEDIATE Instruction=%b",item.and_en), UVM_MEDIUM)	

				andi_logic=(item.oper1 & item.imm_val);
				`uvm_info("SCOREBOARD", $sformatf("oper1=%0d and imm_val=%0d, and immediate is computed: %0d",$signed(item.oper1), $signed(item.imm_val), $signed(andi_logic)), UVM_LOW)

					if(andi_logic==item.and_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("andi_logic oper1=%0d and imm_val=%0d,Expected: %0d, Got: %0d Result Matched ",$signed(item.oper1), $signed(item.imm_val), $signed(andi_logic), $signed(item.and_result)), UVM_LOW)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("andi_logic result mismatched - Expected: %0h, Got: %0h",andi_logic, item.and_result))
					end
				end
				else if(item.invalid_instruction_valid_o)begin
     				`uvm_info("SCOREBOARD", $sformatf("INVALID INSTRUCTION=%b",item.invalid_instruction_valid_o), UVM_MEDIUM)	
				end
			end//AND IMMEDIATE INSTRUCTION

			// ADD IMMEDIATE INSTRUCTOR CHEKER
			else if(item.opcode==1 && item.func3==0 && item.func4==0)begin
			`uvm_info("SCOREBOARD", $sformatf("OPCODE=%0h and FUNC3=%0h",item.opcode, item.func3), UVM_MEDIUM)

				if(item.add_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("ADD IMMEDIATE Instruction=%b",item.add_en), UVM_MEDIUM)	

				addi_logic=(item.oper1 + item.imm_val);
				`uvm_info("SCOREBOARD", $sformatf("oper1=%0d and imm_val=%0d, ADD immediate is computed: %d",$signed(item.oper1), $signed(item.imm_val), $signed(addi_logic)), UVM_MEDIUM)

					if(addi_logic==item.add_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("ADDI_logic oper1=%0d and imm_val=%0d,Expected: %0d, Got: %0d Result Matched ",$signed(item.oper1), $signed(item.imm_val), $signed(addi_logic), $signed(item.add_result)), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("ADDI_logic result mismatched - Expected: %0h, Got: %0h",addi_logic, item.add_result))
					end
				end
				else if(item.invalid_instruction_valid_o)begin
     				`uvm_info("SCOREBOARD", $sformatf("INVALID INSTRUCTION=%b",item.invalid_instruction_valid_o), UVM_MEDIUM)	
				end
			end//ADD IMMEDIATE INSTRUCTION

			// ADD IMMEDIATE 4 SP INSTRUCTOR CHEKER
			else if(item.opcode==0 && item.func3==0)begin
			`uvm_info("SCOREBOARD", $sformatf("OPCODE=%0h and FUNC3=%0h",item.opcode, item.func3), UVM_MEDIUM)

				if(item.add_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("ADD IMMEDIATE 4 SP Instruction=%b",item.add_en), UVM_MEDIUM)	

				addi4sp_logic=(item.oper1 + item.imm_val);
				`uvm_info("SCOREBOARD", $sformatf("oper1=%0d and imm_val=%0d, ADD I 4 SP immediate is computed: %d",$signed(item.oper1), $signed(item.imm_val), $signed(addi4sp_logic)), UVM_MEDIUM)

					if(addi4sp_logic==item.add_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("ADDI4SP_logic oper1=%0d and imm_val=%0d,Expected: %0d, Got: %0d Result Matched ",$signed(item.oper1), $signed(item.imm_val), $signed(addi4sp_logic), $signed(item.add_result)), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("ADDI4SP_logic result mismatched - Expected: %0h, Got: %0h",addi4sp_logic, item.add_result))
					end
				end
				else if(item.invalid_instruction_valid_o)begin
     				`uvm_info("SCOREBOARD", $sformatf("INVALID INSTRUCTION=%b",item.invalid_instruction_valid_o), UVM_MEDIUM)	
				end
			end//ADD IMMEDIATE 4 SP INSTRUCTION

			// ADD IMMEDIATE 16 SP INSTRUCTOR CHEKER
			else if(item.opcode==1 && item.func3==3)begin
			`uvm_info("SCOREBOARD", $sformatf("OPCODE=%0h and FUNC3=%0h",item.opcode, item.func3), UVM_MEDIUM)

				if(item.add_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("ADD IMMEDIATE 16 SP Instruction=%b",item.add_en), UVM_MEDIUM)

				addi16sp_logic=(item.oper1 + item.imm_val);
				`uvm_info("SCOREBOARD", $sformatf("oper1=%0d and imm_val=%0d, ADDI 16 SP immediate is computed: %0d",$signed(item.oper1), $signed(item.imm_val), $signed(addi16sp_logic)), UVM_MEDIUM)

					if(addi16sp_logic==item.add_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("ADDI16SP_logic oper1=%0d and imm_val=%0d,Expected: %0d, Got: %0d Result Matched ",$signed(item.oper1), $signed(item.imm_val), $signed(addi16sp_logic), $signed(item.add_result)), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("ADDI16SP_logic result mismatched - Expected: %0h, Got: %0h",addi16sp_logic, item.add_result))
					end
				end
				else if(item.invalid_instruction_valid_o)begin
     				`uvm_info("SCOREBOARD", $sformatf("INVALID INSTRUCTION=%b",item.invalid_instruction_valid_o), UVM_MEDIUM)	
				end
			end//ADD IMMEDIATE 16 SP INSTRUCTION

			// MV INSTRUCTOR CHEKER
			else if(item.opcode==2 && item.func4==8)begin
			`uvm_info("SCOREBOARD", $sformatf("OPCODE=%0h and FUNC4=%0h",item.opcode, item.func4), UVM_MEDIUM)

				if(item.mv_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("MV Instruction=%b",item.mv_en), UVM_MEDIUM)

				mv_logic=(item.oper2 );
				`uvm_info("SCOREBOARD", $sformatf("oper2=%0h, MV is computed: %h",item.oper2, mv_logic), UVM_MEDIUM)

					if(mv_logic==item.mv_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("MV_logic oper2=%0h,Expected: %0h, Got: %0h Result Matched ",item.oper2, mv_logic, item.mv_result), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("MV_logic result mismatched - Expected: %0h, Got: %0h",mv_logic, item.mv_result))
					end
				end
				else if(item.invalid_instruction_valid_o)begin
     				`uvm_info("SCOREBOARD", $sformatf("INVALID INSTRUCTION=%b",item.invalid_instruction_valid_o), UVM_MEDIUM)	
				end
			end//MV INSTRUCTION
			
			// SLLI INSTRUCTOR CHEKER
			else if(item.opcode==2 && item.func3==0)begin
			`uvm_info("SCOREBOARD", $sformatf("OPCODE=%0h and FUNC3=%0h",item.opcode, item.func3), UVM_MEDIUM)

				if(item.slli_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("SLLI Instruction=%b",item.slli_en), UVM_MEDIUM)

				slli_logic=(item.oper1 << item.imm_val);
				`uvm_info("SCOREBOARD", $sformatf("oper1=%0h and oper2=%0h, SLLI is computed: %h",item.oper1, item.imm_val, slli_logic), UVM_MEDIUM)

					if(slli_logic==item.slli_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("SLLI_logic oper1=%0h and oper2=%0h,Expected: %0h, Got: %0h Result Matched ",item.oper1, item.imm_val, slli_logic, item.slli_result), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("SLLI_logic result mismatched - Expected: %0h, Got: %0h",slli_logic, item.slli_result))
					end
				end
				else if(item.invalid_instruction_valid_o)begin
     				`uvm_info("SCOREBOARD", $sformatf("INVALID INSTRUCTION=%b",item.invalid_instruction_valid_o), UVM_MEDIUM)	
				end
			end//SLLI INSTRUCTION
			
			// SRLI INSTRUCTOR CHEKER
			else if(item.opcode==1 && item.func3==4 && item.func2==0)begin
			`uvm_info("SCOREBOARD", $sformatf("OPCODE=%0d and FUNC3=%0d and FUNC2=%0d",item.opcode, item.func3, item.func2), UVM_MEDIUM)

				if(item.srli_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("SRLI Instruction=%b",item.srli_en), UVM_MEDIUM)

				srli_logic=(item.oper1 >> item.imm_val);
				`uvm_info("SCOREBOARD", $sformatf("oper1=%0d and oper2=%0d, SRLI is computed: %0d",$signed(item.oper1), $signed(item.imm_val), $signed(srli_logic)), UVM_MEDIUM)

					if(srli_logic==item.srli_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("SRLI_logic oper1=%0d and oper2=%0d,Expected: %0d, Got: %0d Result Matched ",$signed(item.oper1), $signed(item.imm_val), $signed(srli_logic), $signed(item.srli_result)), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("SRLI_logic result mismatched - Expected: %0h, Got: %0h",srli_logic, item.srli_result))
					end
				end
				else if(item.invalid_instruction_valid_o)begin
     				`uvm_info("SCOREBOARD", $sformatf("INVALID INSTRUCTION=%b",item.invalid_instruction_valid_o), UVM_MEDIUM)	
				end
			end//SRLI INSTRUCTION

			// SRAI INSTRUCTOR CHEKER
			else if(item.opcode==1 && item.func3==4 && item.func2==1)begin
			`uvm_info("SCOREBOARD", $sformatf("OPCODE=%0h and FUNC3=%0h and FUNC2=%0h",item.opcode, item.func3, item.func2), UVM_MEDIUM)

				if(item.srai_en)begin
     				`uvm_info("SCOREBOARD", $sformatf("SRAI Instruction=%b",item.srai_en), UVM_MEDIUM)

				srai_logic=(item.oper1 >>> item.imm_val);
				`uvm_info("SCOREBOARD", $sformatf("oper1=%0d and imm_val=%0d, SRAI is computed: %0d",$signed(item.oper1), $signed(item.imm_val), $signed(srai_logic)), UVM_MEDIUM)

					if(srai_logic==item.srai_result)begin
     					`uvm_info("SCOREBOARD", $sformatf("SRAI_logic oper1=%0d and oper2=%0d,Expected: %0d, Got: %0d Result Matched ",$signed(item.oper1), $signed(item.imm_val), $signed(srai_logic), $signed(item.srai_result)), UVM_MEDIUM)	
					end
					else begin
      					`uvm_error("SCOREBOARD", $sformatf("SRAI_logic result mismatched - Expected: %0h, Got: %0h",srai_logic, item.srai_result))
					end
				end
				else if(item.invalid_instruction_valid_o)begin
     				`uvm_info("SCOREBOARD", $sformatf("INVALID INSTRUCTION=%b",item.invalid_instruction_valid_o), UVM_MEDIUM)	
				end
			end//SRAI INSTRUCTION

			else begin 
			`uvm_info("SCOREBOARD", $sformatf("else OPCODE=%0h and FUNC2=%0h  FUNC3=%0h FUNC4=%0h FUNC6=%0h",item.opcode, item.func2, item.func3, item.func4, item.func6), UVM_MEDIUM)
			end
		end
		else begin
		`uvm_info("SCOREBOARD", $sformatf("INSTRUCTION_INVALID=%0h",item.invalid_instruction_valid_o), UVM_MEDIUM)	
		end
		end
		else begin
		`uvm_info("SCOREBOARD", $sformatf("RESET IS ACTIVATED RESET=%0h",item.risc_rst), UVM_MEDIUM)		
		end*/




	endfunction:write

endclass
