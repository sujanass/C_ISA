 class C_ISA_test extends uvm_test;

  //factory registration
  `uvm_component_utils(C_ISA_test)

  //creating environment and sequence handle
  C_ISA_env env;
 // C_ISA_sequence seq_inst;
 int error_count;
 int fatal_count;
 string test_name;
  
  //constructor
  function new(string name = "C_ISA_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
 
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = C_ISA_env::type_id::create("env",this); 
 //   seq_inst = C_ISA_sequence::type_id::create("seq_inst"); 
  endfunction


//end of elaboration phase
	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction

task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    #100;
   `uvm_info(get_name(),$sformatf("inside the base test"),UVM_MEDIUM)
    phase.drop_objection(this);
  endtask

  function void report_phase(uvm_phase phase);
  super.report_phase (phase);
  error_count=uvm_report_server::get_server().get_severity_count(UVM_ERROR);
  fatal_count=uvm_report_server::get_server().get_severity_count(UVM_FATAL);
  test_name=get_type_name();
  $display("---------------------------------------------------------------------------------------------");
  if(!error_count&&!fatal_count) begin
  $display("[%s]STATUS: PASSED",test_name);
  end
  else begin
  $display("[%s]STATUS: FAILED",test_name);
  $display("ERRORS: %d, FATAL:%d",error_count,fatal_count);
  end
  $display("--------------------------------------------------------------------------------------------");
  
  endfunction:report_phase

endclass 

