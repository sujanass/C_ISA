package C_ISA_pkg;

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    `include "./../UVME/sequence/C_ISA_seq_item.sv"
    `include "./../UVME/sequence/C_ISA_sequence.sv"

    `include "./../UVME/sequence/C_ISA_reset_sequence.sv"
    `include "./../UVME/sequence/C_ISA_add_sequence.sv"
    `include "./../UVME/sequence/C_ISA_sub_sequence.sv"
    `include "./../UVME/sequence/C_ISA_and_sequence.sv"
    `include "./../UVME/sequence/C_ISA_or_sequence.sv"
    `include "./../UVME/sequence/C_ISA_xor_sequence.sv"
    `include "./../UVME/sequence/C_ISA_mv_sequence.sv"
    `include "./../UVME/sequence/C_ISA_srli_sequence.sv"
    `include "./../UVME/sequence/C_ISA_slli_sequence.sv"    
    `include "./../UVME/sequence/C_ISA_srai_sequence.sv"
    `include "./../UVME/sequence/C_ISA_andi_sequence.sv"
    `include "./../UVME/sequence/C_ISA_lwsp_sequence.sv"
    `include "./../UVME/sequence/C_ISA_addi_sequence.sv"
    `include "./../UVME/sequence/C_ISA_swsp_sequence.sv"
    `include "./../UVME/sequence/C_ISA_lw_sequence.sv"
    `include "./../UVME/sequence/C_ISA_sw_sequence.sv"
    `include "./../UVME/sequence/C_ISA_li_sequence.sv"
    `include "./../UVME/sequence/C_ISA_lui_sequence.sv"
    `include "./../UVME/sequence/C_ISA_addi4sp_sequence.sv"
    `include "./../UVME/sequence/C_ISA_addi16sp_sequence.sv"
    `include "./../UVME/sequence/C_ISA_nop_sequence.sv"
    `include "./../UVME/sequence/C_ISA_ebreak_sequence.sv"
    `include "./../UVME/sequence/C_ISA_illegal_instruction_sequence.sv"
    `include "./../UVME/sequence/C_ISA_all_sequence.sv"
    


    `include "./../UVME/agent/C_ISA_driver.sv"
    `include "./../UVME/agent/C_ISA_monitor.sv"
    `include "./../UVME/agent/C_ISA_sequencer.sv"
    `include "./../UVME/agent/C_ISA_agent.sv"
    
    `include "./../UVME/env/C_ISA_coverage.sv"
    `include "./../UVME/env/C_ISA_scoreboard.sv"
    `include "./../UVME/env/C_ISA_env.sv"

    `include "./../UVME/test/C_ISA_test.sv"
    `include "./../UVME/test/C_ISA_reset_test.sv"
    `include "./../UVME/test/C_ISA_add_test.sv"
    `include "./../UVME/test/C_ISA_sub_test.sv"
    `include "./../UVME/test/C_ISA_and_test.sv"
    `include "./../UVME/test/C_ISA_or_test.sv"
    `include "./../UVME/test/C_ISA_xor_test.sv"
    `include "./../UVME/test/C_ISA_mv_test.sv"
    `include "./../UVME/test/C_ISA_srli_test.sv"
    `include "./../UVME/test/C_ISA_slli_test.sv"    
    `include "./../UVME/test/C_ISA_srai_test.sv"
    `include "./../UVME/test/C_ISA_andi_test.sv"
    `include "./../UVME/test/C_ISA_lwsp_test.sv"
    `include "./../UVME/test/C_ISA_addi_test.sv"
    `include "./../UVME/test/C_ISA_swsp_test.sv"
    `include "./../UVME/test/C_ISA_lw_test.sv"
    `include "./../UVME/test/C_ISA_sw_test.sv"
    `include "./../UVME/test/C_ISA_li_test.sv"
    `include "./../UVME/test/C_ISA_lui_test.sv"
    `include "./../UVME/test/C_ISA_addi4sp_test.sv"
    `include "./../UVME/test/C_ISA_addi16sp_test.sv"
    `include "./../UVME/test/C_ISA_nop_test.sv"
    `include "./../UVME/test/C_ISA_ebreak_test.sv"
    `include "./../UVME/test/C_ISA_illegal_instruction_test.sv"
    `include "./../UVME/test/C_ISA_all_test.sv"
    
    
    
endpackage
