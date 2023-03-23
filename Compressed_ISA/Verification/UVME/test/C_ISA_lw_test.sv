class C_ISA_lw_test extends uvm_test;

  //factory registration
  `uvm_component_utils(C_ISA_lw_test)

  //creating environment and sequence handle
  C_ISA_env env;
  C_ISA_lw_sequence lw_seq;
  
  //constructor
  function new(string name = "C_ISA_lw_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
 
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = C_ISA_env::type_id::create("env",this); 
    lw_seq = C_ISA_lw_sequence::type_id::create("lw_seq"); 
  endfunction


//end of elaboration phase
	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction

task run_phase(uvm_phase phase);
	begin
    phase.raise_objection(this);
   
   `uvm_info(get_name(),$sformatf("inside the lw_test"),UVM_MEDIUM)
  	
		lw_seq.start(env.agent.sequencer);
        	uvm_report_info("C_ISA_sequence", "run_phase, Sequence started on the sequencer");

    phase.drop_objection(this);

	phase.phase_done.set_drain_time(this,50);
	end

   
  endtask

endclass 

