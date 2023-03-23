class C_ISA_andi_sequence extends C_ISA_sequence;
//factory registration
`uvm_object_utils(C_ISA_andi_sequence)

  //creating sequence item handle
C_ISA_seq_item seq_item;

int scenario;

//function new constructor
function new(string name="C_ISA_andi_sequence");
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
`uvm_info (get_type_name(),"andi logic sequence: inside body", UVM_LOW)

 if (scenario == 1)
       // repeat(5) 
       begin
        `uvm_do_with(seq_item,{
	seq_item.risc_rst        	== 1'b0;
	seq_item.instruction[1:0]       == 2'b01;	//opcode(01)
	seq_item.instruction[6:2]       == 5'b00111;	//imm[5:0]constant value
	seq_item.instruction[9:7]       == 3'b011;	//rd/rs
	seq_item.instruction[11:10]     == 2'b10;	//funct2(10)
	seq_item.instruction[12]        == 1'b1;	//signedimm[6], 0 for +ve and 1 for -ve	
	seq_item.instruction[15:13]     == 3'b100;	//funct3(100)
	seq_item.data_mem_read_data_i   == 32'b0;		
	});
	
	end

 if (scenario == 2)
      repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode(01)
	seq_item.instruction[6:2]       == 5'b00111;	//imm[5:0]constant value
	seq_item.instruction[9:7]       == 3'b011;	//rd/rs
	seq_item.instruction[11:10]     == 2'b10;	//funct2(10)
	seq_item.instruction[12]        == 1'b1;	//signedimm[6], 0 for +ve and 1 for -ve	
	seq_item.instruction[15:13]     == 3'b100;	//funct3(100)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

 if (scenario == 3)
      repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode(01)
	seq_item.instruction[6:2]       == 5'b10111;	//imm[5:0]constant value
	seq_item.instruction[9:7]       == 3'b011;	//rd/rs
	seq_item.instruction[11:10]     == 2'b10;	//funct2(10)
	seq_item.instruction[12]        == 1'b1;	//signedimm[6]	
	seq_item.instruction[15:13]     == 3'b100;	//funct3(100)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

  if (scenario == 4)
      repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode(01)
	seq_item.instruction[6:2]       == 5'b11111;	//imm[5:0]constant value
	seq_item.instruction[9:7]       == 3'b011;	//rd/rs
	seq_item.instruction[11:10]     == 2'b10;	//funct2(10)
	seq_item.instruction[12]        == 1'b1;	//signedimm[6], 0 for +ve and 1 for -ve	
	seq_item.instruction[15:13]     == 3'b100;	//funct3(100)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

  if (scenario == 5)
      repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode(01)
//	seq_item.instruction[6:2]       == 5'b00111;	//imm[5:0]constant value
	seq_item.instruction[9:7]       == 3'b011;	//rd/rs
	seq_item.instruction[11:10]     == 2'b10;	//funct2(10)
	seq_item.instruction[12]        == 1'b1;	//signedimm[6], 0 for +ve and 1 for -ve	
	seq_item.instruction[15:13]     == 3'b100;	//funct3(100)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

if (scenario == 6)
      repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode(01)
//	seq_item.instruction[6:2]       == 5'b00111;	//imm[5:0]constant value
	seq_item.instruction[9:7]       == 3'b011;	//rd/rs
	seq_item.instruction[11:10]     == 2'b10;	//funct2(10)
	seq_item.instruction[12]        == 1'b0;	//signedimm[6], 0 for +ve and 1 for -ve	
	seq_item.instruction[15:13]     == 3'b100;	//funct3(100)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

if (scenario == 7)
      repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode(01)
//	seq_item.instruction[6:2]       == 5'b00111;	//imm[5:0]constant value
//	seq_item.instruction[9:7]       == 3'b011;	//rd/rs
	seq_item.instruction[11:10]     == 2'b10;	//funct2(10)
//	seq_item.instruction[12]        == 1'b1;	//signedimm[6], 0 for +ve and 1 for -ve
	seq_item.instruction[15:13]     == 3'b100;	//funct3(100)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});

	end

endtask

endclass
