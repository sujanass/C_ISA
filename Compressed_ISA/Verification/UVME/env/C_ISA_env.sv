class C_ISA_env extends uvm_env;

  //factory registration
  `uvm_component_utils(C_ISA_env)

  //creating agent handle
  C_ISA_agent agent;
  C_ISA_scoreboard scoreboard;
  C_ISA_coverage cb;

  //constructor
  function new(string name = "C_ISA_env",uvm_component parent=null);
    super.new(name,parent);
  endfunction

  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = C_ISA_agent::type_id::create("C_ISA_agent",this); 
    scoreboard = C_ISA_scoreboard::type_id::create("C_ISA_scoreboard",this);
    cb=C_ISA_coverage::type_id::("C_ISA_coverage",this);
  endfunction

  //connect phase
  function void connect_phase(uvm_phase phase);
  //connection between scoreboard and monitor
   agent.monitor.monitor_port.connect(scoreboard.scoreboard_port);
   agent.monitor.monitor_port.connect(cb.coverage_export);

  
  endfunction

 
  
endclass
