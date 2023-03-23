class C_ISA_ebreak_sequence extends C_ISA_sequence;
//factory registration
`uvm_object_utils(C_ISA_ebreak_sequence)

  //creating sequence item handle
C_ISA_seq_item seq_item;

int scenario;

//function new constructor
function new(string name="C_ISA_ebreak_sequence");
super.new(name);
endfunction

//build phase
function build_phase(uvm_phase, phase);
//super.new(phase);
seq_item = C_ISA_seq_item::type_id::create("seq_item");
endfunction

//task
task body();

//reset scenario
`uvm_info (get_type_name(),"Environmet break sequence: inside body", UVM_LOW)

 if (scenario == 1)
       // repeat(5) 
       begin
        `uvm_do_with(seq_item,{
	seq_item.risc_rst        	== 1'b0;
	seq_item.instruction[1:0]       == 2'b00;	//opcode(10)
	seq_item.instruction[11:2]      == 10'd0;	//rs1/rd
	seq_item.instruction[15:12]     == 4'b000;	//func3(000)
	seq_item.data_mem_read_data_i   == 32'b0;		
	});
	
	end

 if (scenario == 2)
     // repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b10;	//opcode(10)
	seq_item.instruction[11:2]      == 10'b0000000000;	//rs1/rd
	seq_item.instruction[15:12]     == 4'b1001;	//func4(1001)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

 if (scenario == 3)
     // repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b00;	//opcode(10)
	seq_item.instruction[11:2]      == 10'd0;	//rs1/rd
	seq_item.instruction[15:12]     == 4'b1001;	//func4(1001)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

 if (scenario == 4)
     // repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b10;	//opcode(10)
	seq_item.instruction[11:2]      == 10'd0;	//rs1/rd
	seq_item.instruction[15:12]     == 4'b1001;	//func4(1001)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

endtask

endclass
