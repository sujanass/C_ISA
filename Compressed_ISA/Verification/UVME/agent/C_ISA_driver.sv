class C_ISA_driver extends uvm_driver #(C_ISA_seq_item);

  //factory registration
  `uvm_component_utils(C_ISA_driver)

  //creating interface and sequence item handle
  C_ISA_seq_item seq_item;
  virtual C_ISA_inf intf;

  //constructor
  function new(string name = "C_ISA_driver", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

  seq_item = C_ISA_seq_item::type_id::create("seq_item");
  if(!uvm_config_db#(virtual C_ISA_inf)::get(this,"","C_ISA_inf",intf))
  begin
 `uvm_fatal(get_full_name(),"unable to get interface in read driver")
  end
  endfunction

  //run phase
  virtual task run_phase(uvm_phase phase);
  super.run_phase(phase);

  forever
  begin
  seq_item_port.get_next_item(seq_item);
      drive_data(seq_item);
  
seq_item_port.item_done();
   end

  endtask

    task drive_data(C_ISA_seq_item seq_item);
    @(intf.driver_cb);
    intf.driver_cb.risc_rst <= seq_item.risc_rst;
    intf.driver_cb.instruction <= seq_item.instruction;
    endtask

endclass
