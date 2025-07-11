class C_ISA_andi_test extends uvm_test;

  //factory registration
  `uvm_component_utils(C_ISA_andi_test)

  //creating environment and sequence handle
  C_ISA_env env;
  C_ISA_andi_sequence andi_seq;
  
  //constructor
  function new(string name = "C_ISA_andi_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
 
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = C_ISA_env::type_id::create("env",this); 
    andi_seq = C_ISA_andi_sequence::type_id::create("andi_seq"); 
  endfunction


//end of elaboration phase
	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction

task run_phase(uvm_phase phase);
    phase.raise_objection(this);
  //  #100;
   `uvm_info(get_name(),$sformatf("inside the base andi_test"),UVM_MEDIUM)

   begin
andi_seq.scenario = 1;
andi_seq.start(env.agent.sequencer);
`uvm_info(get_type_name(),$sformatf("andi_test scenario 1 is completed"),UVM_MEDIUM)
end

begin
andi_seq.scenario = 2;
andi_seq.start(env.agent.sequencer);
`uvm_info(get_type_name(),$sformatf("andi_test scenario 2 is completed"),UVM_MEDIUM)
end

begin
andi_seq.scenario = 3;
andi_seq.start(env.agent.sequencer);
`uvm_info(get_type_name(),$sformatf("andi_test scenario 3 is completed"),UVM_MEDIUM)
end 

begin
andi_seq.scenario = 4;
andi_seq.start(env.agent.sequencer);
`uvm_info(get_type_name(),$sformatf("andi_test scenario 4 is completed"),UVM_MEDIUM)
end 

begin
andi_seq.scenario = 5;
andi_seq.start(env.agent.sequencer);
`uvm_info(get_type_name(),$sformatf("andi_test scenario 5 is completed"),UVM_MEDIUM)
end 

begin
andi_seq.scenario = 6;
andi_seq.start(env.agent.sequencer);
`uvm_info(get_type_name(),$sformatf("andi_test scenario 6 is completed"),UVM_MEDIUM)
end 

begin
andi_seq.scenario = 7;
andi_seq.start(env.agent.sequencer);
`uvm_info(get_type_name(),$sformatf("andi_test scenario 7 is completed"),UVM_MEDIUM)
end 

    phase.drop_objection(this);

	phase.phase_done.set_drain_time(this,100);
   
  endtask

endclass 

