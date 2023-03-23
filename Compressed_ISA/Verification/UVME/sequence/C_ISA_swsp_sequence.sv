class C_ISA_swsp_sequence extends C_ISA_sequence;
//factory registration
`uvm_object_utils(C_ISA_swsp_sequence)

  //creating sequence item handle
C_ISA_seq_item seq_item;

int scenario;

//function new constructor
function new(string name="C_ISA_swsp_sequence");
super.new(name);
endfunction

//build phase
function build_phase(uvm_phase, phase);
//super.new(phase);
endfunction

//task
task body();

seq_item = C_ISA_seq_item::type_id::create("seq_item");

//reset scenario
`uvm_info (get_type_name(),"swsp sequence: inside body", UVM_LOW)
	start_item(seq_item);
       	assert (seq_item.randomize() with {
        seq_item.risc_rst 		== 1'b0; 
	seq_item.instruction[1:0]       == 2'b0;	//opcode
	seq_item.instruction[6:2]       == 5'b00000;	//rs
	seq_item.instruction[12:7]      == 5'b00000;	//imm
	seq_item.instruction[15:13]     == 3'b000;	//funct3
	seq_item.data_mem_read_data_i   == 32'b0;	
          }) ;

       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item); 
//#2;
       // repeat(5) 
	start_item(seq_item);

       	assert (seq_item.randomize() with {

	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b10;	//opcode
	seq_item.instruction[6:2]       == 5'b00010;	//rs
	seq_item.instruction[12:7]      == 6'b111111;	//imm
	seq_item.instruction[15:13]     == 3'b110;	//funct3
	seq_item.data_mem_read_data_i   == 32'b0;		
	});
	
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item); 

//#2;
   //   repeat(2) 
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b10;	//opcode
	seq_item.instruction[6:2]       == 5'b00000;	//rs
	seq_item.instruction[12:7]      == 6'b111001;	//imm
	seq_item.instruction[15:13]     == 3'b110;	//funct3
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item); 

//	#2;
   //   repeat(2) 
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b10;	//opcode
//	seq_item.instruction[6:2]       == 5'b00010;	//rs
//	seq_item.instruction[12:7]      == 6'b100111;	//imm
	seq_item.instruction[15:13]     == 3'b110;	//funct3
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item); 

endtask

endclass
