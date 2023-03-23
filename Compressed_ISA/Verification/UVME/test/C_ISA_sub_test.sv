 class C_ISA_sub_test extends uvm_test;

  //factory registration
  `uvm_component_utils(C_ISA_sub_test)

  //creating environment and sequence handle
  C_ISA_env env;
  C_ISA_sub_sequence sub_seq;
  
  //constructor
  function new(string name = "C_ISA_sub_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
 
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = C_ISA_env::type_id::create("env",this); 
    sub_seq = C_ISA_sub_sequence::type_id::create("sub_seq"); 
  endfunction


//end of elaboration phase
	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction

task run_phase(uvm_phase phase);
    phase.raise_objection(this);
  //  #100;
   `uvm_info(get_name(),$sformatf("inside the base sub_test"),UVM_MEDIUM)

   begin
sub_seq.scenario = 1;
sub_seq.start(env.agent.sequencer);
`uvm_info(get_type_name(),$sformatf("subtraction scenario 1 is completed"),UVM_MEDIUM)
end

begin
sub_seq.scenario = 2;
sub_seq.start(env.agent.sequencer);
`uvm_info(get_type_name(),$sformatf("subtraction scenario 2 is completed"),UVM_MEDIUM)
end

begin
sub_seq.scenario = 3;
sub_seq.start(env.agent.sequencer);
`uvm_info(get_type_name(),$sformatf("subtraction scenario 3 is completed"),UVM_MEDIUM)
end 

begin
sub_seq.scenario = 4;
sub_seq.start(env.agent.sequencer);
`uvm_info(get_type_name(),$sformatf("subtraction scenario 4 is completed"),UVM_MEDIUM)
end 

begin
sub_seq.scenario = 5;
sub_seq.start(env.agent.sequencer);
`uvm_info(get_type_name(),$sformatf("subtraction scenario 5 is completed"),UVM_MEDIUM)
end 

begin
sub_seq.scenario = 6;
sub_seq.start(env.agent.sequencer);
`uvm_info(get_type_name(),$sformatf("subtraction scenario 6 is completed"),UVM_MEDIUM)
end 

begin
sub_seq.scenario = 7;
sub_seq.start(env.agent.sequencer);
`uvm_info(get_type_name(),$sformatf("subtraction scenario 7 is completed"),UVM_MEDIUM)
end 

    phase.drop_objection(this);

	phase.phase_done.set_drain_time(this,100);
   
  endtask

endclass 

