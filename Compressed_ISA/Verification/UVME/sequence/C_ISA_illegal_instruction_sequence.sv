class C_ISA_illegal_instruction_sequence extends C_ISA_sequence;
//factory registration
`uvm_object_utils(C_ISA_illegal_instruction_sequence)

  //creating sequence item handle
C_ISA_seq_item seq_item;

int scenario;

//function new constructor
function new(string name="C_ISA_illegal_instruction_sequence");
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
`uvm_info (get_type_name(),"illegal instruction operation logic sequence: inside body", UVM_LOW)

 if (scenario == 1)
       // repeat(5) 
       begin
        `uvm_do_with(seq_item,{
	seq_item.risc_rst        	== 1'b0;
	seq_item.instruction[1:0]       == 2'b00;	//opcode(01)
	seq_item.instruction[6:2]       == 5'b00000;	//imm[4:0]
	seq_item.instruction[11:7]      == 5'b00000;	//rs1/rd
	seq_item.instruction[12]        == 1'b0;	//imm[5]
	seq_item.instruction[15:13]     == 3'b000;	//func3(000)
	seq_item.data_mem_read_data_i   == 32'b0;		
	});
	
	end

 if (scenario == 2)
     // repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b00;	//opcode(01)
	seq_item.instruction[6:2]       == 5'b00000;	//imm[4:0]
	seq_item.instruction[11:7]      == 5'b00000;	//rs1/rd
	seq_item.instruction[12]        == 1'b0;	//imm[5]
	seq_item.instruction[15:13]     == 3'b000;	//func3(000)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

 if (scenario == 3)
     // repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b00;	//opcode(01)
	seq_item.instruction[6:2]       == 5'b01100;	//imm[4:0]
	seq_item.instruction[11:7]      == 5'b00000;	//rs1/rd
	seq_item.instruction[12]        == 1'b0;	//imm[5]
	seq_item.instruction[15:13]     == 3'b000;	//func3(000)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

 if (scenario == 4)
     // repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b00;	//opcode(01)
	seq_item.instruction[6:2]       == 5'b00000;	//imm[4:0]
	seq_item.instruction[11:7]      == 5'b00000;	//rs1/rd
	seq_item.instruction[12]        == 1'b0;	//imm[5]
	seq_item.instruction[15:13]     == 3'b000;	//func3(000)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

endtask

endclass
