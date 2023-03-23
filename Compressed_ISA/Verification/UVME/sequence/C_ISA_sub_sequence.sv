class C_ISA_sub_sequence extends C_ISA_sequence;
//factory registration
`uvm_object_utils(C_ISA_sub_sequence)

  //creating sequence item handle
C_ISA_seq_item seq_item;

int scenario;

//function new constructor
function new(string name="C_ISA_sub_sequence");
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
`uvm_info (get_type_name(),"subtraction sequence: inside body", UVM_LOW)

 if (scenario == 1)
       // repeat(5) 
       begin
        `uvm_do_with(seq_item,{
	seq_item.risc_rst        	== 1'b0;
	seq_item.instruction[1:0]       == 2'b00;	//opcode(01)
	seq_item.instruction[4:2]       == 3'b000;	//rs2
	seq_item.instruction[6:5]       == 2'b00;	//funct2(00)
	seq_item.instruction[9:7]       == 3'b000;	//rs1/rd
	seq_item.instruction[15:10]       == 6'b000000;	//funct6(100011)
	seq_item.data_mem_read_data_i   == 32'b0;		
	});
	
	end

 if (scenario == 2)
      repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode(01)
	seq_item.instruction[4:2]       == 3'b111;	//rs2
	seq_item.instruction[6:5]       == 2'b00;	//funct2(00)
	seq_item.instruction[9:7]       == 3'b011;	//rs1/rd
	seq_item.instruction[15:10]       == 6'b100011;	//funct6(100011)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

 if (scenario == 3)
      repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode(01)
//	seq_item.instruction[4:2]       == 3'b111;	//rs2
	seq_item.instruction[6:5]       == 2'b00;	//funct2(00)
//	seq_item.instruction[9:7]       == 3'b011;	//rs1/rd
	seq_item.instruction[15:10]     == 6'b100011;	//funct6(100011)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

  if (scenario == 4)
      repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode(01)
	seq_item.instruction[4:2]       == 3'b000;	//rs2
	seq_item.instruction[6:5]       == 2'b00;	//funct2(00)
	seq_item.instruction[9:7]       == 3'b011;	//rs1/rd
	seq_item.instruction[15:10]     == 6'b100011;	//funct6(100011)
	seq_item.data_mem_read_data_i   == 32'b1;	
	});
	end

  if (scenario == 5)
      repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode(01)
//	seq_item.instruction[4:2]       == 3'b111;	//rs2
	seq_item.instruction[6:5]       == 2'b00;	//funct2(00)
	seq_item.instruction[9:7]       == 3'b011;	//rs1/rd
	seq_item.instruction[15:10]       == 6'b100011;	//funct6(100011)
	seq_item.data_mem_read_data_i   == 32'b1;	
	});
	end

if (scenario == 6)
      repeat(10) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode(01)
	seq_item.instruction[4:2]       == 3'b111;	//rs2
	seq_item.instruction[6:5]       == 2'b00;	//funct2(00)
//	seq_item.instruction[9:7]       == 3'b011;	//rs1/rd
	seq_item.instruction[15:10]       == 6'b100011;	//funct6(100011)
	seq_item.data_mem_read_data_i   == 32'b1;	
	});
	end

if (scenario == 7)
      repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode(01)
	seq_item.instruction[4:2]       == 3'b111;	//rs2
	seq_item.instruction[6:5]       == 2'b00;	//funct2(00)
	seq_item.instruction[9:7]       == 3'b111;	//rs1/rd
	seq_item.instruction[15:10]       == 6'b100011;	//funct6(100011)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

endtask

endclass
