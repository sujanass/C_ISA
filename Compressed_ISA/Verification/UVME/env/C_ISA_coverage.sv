class C_ISA_coverage extends uvm_subscriber#(C_ISA_seq_item);
    `uvm_component_utils(C_ISA_coverage)
    
    C_ISA_seq_item seq_item;

     // Analysis export to receive transactions
    uvm_analysis_imp#(C_ISA_seq_item, C_ISA_coverage)coverage_export;     
 
    covergroup C_ISA_cover_group;
        option.name = "C_ISA_cover_group";
        option.comment = "Coverage for C_ISA";
        option.per_instance = 1;
        
        //Instructions 

        OPCODE: coverpoint seq_item.opcode {
            bins opcode_00 = {2'b00};
            bins opcode_01 = {2'b01};
            bins opcode_10 = {2'b10};
            bins opcode_11 = {2'b11};
        }

	FUNC2: coverpoint seq_item.func2 {
            bins func2_00 = {2'b00};
            bins func2_01 = {2'b01};
            bins func2_10 = {2'b10};
            bins func2_11 = {2'b11};
        }

	FUNC3: coverpoint seq_item.func3 {
            bins func3_000 = {3'b000};
            bins func3_010 = {3'b010};
            bins func3_011 = {3'b011};
            bins func3_100 = {3'b100};
            bins func3_110 = {3'b110};
            bins func3_011 = {3'b011};
        }

	FUNC4: coverpoint seq_item.func4 {
            bins func4_0000 = {4'b0000};
            bins func4_1000 = {4'b1000};
            bins func4_1001 = {4'b1001};
        }

	FUNC6: coverpoint seq_item.func6 {
            bins func6_000000 = {6'b000000};
            bins func6_100011 = {6'b100011};
        }
	
	RS1: coverpoint seq_item.rs1 {
            bins rs1_00 = {5'b00000};
            bins rs1_01 = {5'b00001};
            bins rs1_10 = {5'b00010};
            bins rs1_11 = {[5'b00011:5'b11111]};
        }

	RS2: coverpoint seq_item.rs2 {
            bins rs2_00 = {5'b00000};
            bins rs2_01 = {5'b00001};
            bins rs2_10 = {5'b00010};
            bins rs1_11 = {[5'b00011:5'b11111]};
	    
        }

	//cross OPCODE, FUNC2, FUNC3, FUNC4,FUNC6
                
        // Cross Coverage
        R_TYPE: cross OPCODE, FUNC4 {
        bins ADD = binsof(OPCODE.opcode_10) && 
	binsof(FUNC4.func4_1001);
        bins MV = binsof(OPCODE.opcode_10) && 
	binsof(FUNC4.func4_1000);}
        
        INOP_TYPE: cross OPCODE, FUNC4, {
        bins NOP = binsof(OPCODE.opcode_01) && binsof(FUNC4.func4_0000);
        bins EBREAK = binsof(OPCODE.opcode_10) && binsof(FUNC4.func4_1001);
	}

        I_TYPE: cross OPCODE, FUNC3 {
        bins ADDI = binsof(OPCODE.opcode_01) && binsof(FUNC3.func3_000);
        bins ADDI4SP = binsof(OPCODE.opcode_00) && binsof(FUNC3.func3_000);
        bins ADDI16SP = binsof(OPCODE.opcode_01) && binsof(FUNC3.func3_011);
        bins LI = binsof(OPCODE.opcode_01) && binsof(FUNC3.func3_101);
        bins LUI = binsof(OPCODE.opcode_01) && binsof(FUNC3.func3_011);
        bins LWSP = binsof(OPCODE.opcode_10) && binsof(FUNC3.func3_010);
        bins SLLI = binsof(OPCODE.opcode_10) && binsof(FUNC3.func3_000);
	}

        S_TYPE: cross OPCODE, FUNC2, FUNC6 {
        bins SUB = binsof(OPCODE.opcode_01) && binsof(FUNC2.func2_00) && binsof(FUNC6.func6_100011);
        bins AND = binsof(OPCODE.opcode_01) && binsof(FUNC2.func2_01) && binsof(FUNC6.func6_100011);
        bins OR = binsof(OPCODE.opcode_01) && binsof(FUNC2.func2_10) && binsof(FUNC6.func6_100011);
        bins XOR = binsof(OPCODE.opcode_01) && binsof(FUNC2.func2_01) && binsof(FUNC6.func6_100011);
	}

	SSL_TYPE: cross OPCODE, FUNC3 {
        bins LW = binsof(OPCODE.opcode_00) && binsof(FUNC3.func3_010);	
        bins SW = binsof(OPCODE.opcode_00) && binsof(FUNC3.func3_110);
        bins SWSP = binsof(OPCODE.opcode_10) && binsof(FUNC3.func3_110);
	}

	B_TYPE: cross OPCODE, FUNC2,FUNC3 {
        bins ANDI = binsof(OPCODE.opcode_01) && binsof(FUNC2.func2_10) && binsof(FUNC3.func3_100);
        bins SRLI = binsof(OPCODE.opcode_01) && binsof(FUNC2.func2_00) && binsof(FUNC3.func3_100);
        bins SRAI = binsof(OPCODE.opcode_01) && binsof(FUNC2.func2_01) && binsof(FUNC3.func3_100);
	}
        

        // RESET
        
        RST: coverpoint seq_item.risc_rst {
            bins risc_rst_0 = {1'b0};
            bins risc_rst_1 = {1'b1};
        }
        
	//ENABLE
        VALID_EN: coverpoint seq_item.invalid_instruction_valid_o {
            bins invalid_instruction_valid_o_0 = {1'b0};
            bins invalid_instruction_valid_o_1 = {1'b1};
        }
        
        ADD_EN: coverpoint seq_item.add_en {
            bins add_en_0 = {1'b0};
            bins add_en_1 = {1'b1};
        }

        SUB_EN: coverpoint seq_item.sub_en {
            bins sub_en_0 = {1'b0};
            bins sub_en_1 = {1'b1};
        }

        OR_EN: coverpoint seq_item.or_en {
            bins or_en_0 = {1'b0};
            bins or_en_1 = {1'b1};
        }

        XOR_EN: coverpoint seq_item.xor_en {
            bins xor_en_0 = {1'b0};
            bins xor_en_1 = {1'b1};
        }

        AND_EN: coverpoint seq_item.and_en {
            bins and_en_0 = {1'b0};
            bins and_en_1 = {1'b1};
        }

        MV_EN: coverpoint seq_item.mv_en {
            bins mv_en_0 = {1'b0};
            bins mv_en_1 = {1'b1};
        }

        SLLI_EN: coverpoint seq_item.slli_en {
            bins slli_en_0 = {1'b0};
            bins slli_en_1 = {1'b1};
        }

        SRLI_EN: coverpoint seq_item.srli_en {
            bins srli_en_0 = {1'b0};
            bins srli_en_1 = {1'b1};
        }

        SRAI_EN: coverpoint seq_item.srai_en {
            bins srai_en_0 = {1'b0};
            bins srai_en_1 = {1'b1};
        }

        LUI_EN: coverpoint seq_item.lui_en {
            bins lui_en_0 = {1'b0};
            bins lui_en_1 = {1'b1};
        }
	
        LW_EN: coverpoint seq_item.lw_en {
            bins lw_en_0 = {1'b0};
            bins lw_en_1 = {1'b1};
        }

        SW_EN: coverpoint seq_item.sw_en {
            bins sw_en_0 = {1'b0};
            bins sw_en_1 = {1'b1};
        }
	
        //INPUTS
        ALU_DATA_1: coverpoint seq_item.oper1 {
            option.auto_bin_max = 32;

        }
	
	ALU_DATA_2: coverpoint seq_item.oper2 {
            option.auto_bin_max = 32;

        }

	IMM_DATA: coverpoint seq_item.imm_val {
            option.auto_bin_max = 32;

        }

	LOAD_IMM_DATA: coverpoint seq_item.load_imm_val {
            option.auto_bin_max = 32;

        }

        //OUTPUTS / RESULT
        ADD_RESULT: coverpoint seq_item.add_result {
            option.auto_bin_max = 32;

        }

	SUB_RESULT: coverpoint seq_item.sub_result {
            option.auto_bin_max = 32;

        }

	OR_RESULT: coverpoint seq_item.or_result {
            option.auto_bin_max = 32;

        }

	XOR_RESULT: coverpoint seq_item.xor_result {
            option.auto_bin_max = 32;

        }

	AND_RESULT: coverpoint seq_item.and_result {
            option.auto_bin_max = 32;

        }
	
	MV_RESULT: coverpoint seq_item.mv_result {
            option.auto_bin_max = 32;

        }

	SLLI_RESULT: coverpoint seq_item.and_result {
            option.auto_bin_max = 32;

        }

	SRLI_RESULT: coverpoint seq_item.and_result {
            option.auto_bin_max = 32;

        }

	SRAI_RESULT: coverpoint seq_item.and_result {
            option.auto_bin_max = 32;

        }

	LUI_RESULT: coverpoint seq_item.and_result {
            option.auto_bin_max = 32;

        }

	L_ADDR_RESULT: coverpoint seq_item.and_result {
            option.auto_bin_max = 32;

        }

	S_ADDR_RESULT: coverpoint seq_item.and_result {
            option.auto_bin_max = 32;

        }
	
         
    endgroup
    
    function new(string name = "C_ISA_coverage", uvm_component parent);
        super.new(name, parent);
        C_ISA_cover_group = new();
	coverage_export = new("coverage_export",this);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction
      
    function void write(input C_ISA_seq_item t);
        seq_item = new();
        $cast(seq_item, t);
        C_ISA_cover_group.sample();
    endfunction
endclass
