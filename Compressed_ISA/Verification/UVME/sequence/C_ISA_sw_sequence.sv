class C_ISA_sw_sequence extends C_ISA_sequence;
//factory registration
`uvm_object_utils(C_ISA_sw_sequence)

  //creating sequence item handle
C_ISA_seq_item seq_item;

int scenario;

//function new constructor
function new(string name="C_ISA_sw_sequence");
super.new(name);
endfunction

//build phase
function build_phase(uvm_phase, phase);
//super.new(phase);
endfunction

//task
task body();

seq_item = C_ISA_seq_item::type_id::create("seq_item");

`uvm_info (get_type_name(),"sw sequence: inside body", UVM_LOW)
	
	//reset scenario 1
	start_item(seq_item);
       	assert (seq_item.randomize() with {
        seq_item.risc_rst 		== 1'b0; 
	seq_item.instruction[1:0]       == 2'b00;	//opcode
	seq_item.instruction[4:2]       == 3'b000;	//rd'
	seq_item.instruction[6:5]       == 2'b00;	//imm[2|6]
	seq_item.instruction[9:7]       == 3'b000;	//rs'
	seq_item.instruction[12:10]     == 3'b000;	//imm[5:3]
	seq_item.instruction[15:13]     == 3'b000;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;	
          }) ;

       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item); 

       // scenario 2 
	start_item(seq_item);

       	assert (seq_item.randomize() with {

	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b00;	//opcode
	seq_item.instruction[4:2]       == 3'b001;	//rd'
	seq_item.instruction[6:5]       == 2'b10;	//imm[2|6]
	seq_item.instruction[9:7]       == 3'b010;	//rs'
	seq_item.instruction[12:10]     == 3'b000;	//imm[5:3]
	seq_item.instruction[15:13]     == 3'b110;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;		
	});
	
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item); 

   //    scenario 3
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b00;	//opcode
//	seq_item.instruction[4:2]       == 3'b000;	//rd'
//	seq_item.instruction[6:5]       == 2'b00;	//imm[2|6]
//	seq_item.instruction[9:7]       == 3'b000;	//rs'
//	seq_item.instruction[12:10]     == 3'b000;	//imm[5:3]
	seq_item.instruction[15:13]     == 3'b110;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item); 

   //   scenario 4 
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b00;	//opcode
	seq_item.instruction[4:2]       == 3'b000;	//rd'
	seq_item.instruction[6:5]       == 2'b00;	//imm[2|6]
	seq_item.instruction[9:7]       == 3'b000;	//rs'
	seq_item.instruction[12:10]     == 3'b000;	//imm[5:3]
	seq_item.instruction[15:13]     == 3'b110;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item); 

endtask

endclass
