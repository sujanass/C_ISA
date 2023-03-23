class C_ISA_lui_sequence extends C_ISA_sequence;
//factory registration
`uvm_object_utils(C_ISA_lui_sequence)

  //creating sequence item handle
C_ISA_seq_item seq_item;

int scenario;

//function new constructor
function new(string name="C_ISA_lui_sequence");
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
`uvm_info (get_type_name(),"lui sequence: inside body", UVM_LOW)
	//senario 1
	start_item(seq_item);
       	assert (seq_item.randomize() with {
        seq_item.risc_rst 		== 1'b0; 
	seq_item.instruction[1:0]       == 2'b00;	//opcode
	seq_item.instruction[6:2]       == 5'b00000;	//imm[16:12<<12]
	seq_item.instruction[11:7]      == 5'b00000;	//rd(!=0,2)
	seq_item.instruction[12]     	== 1'b0;	//imm[17]signbit
	seq_item.instruction[15:13]     == 3'b000;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;	
          }) ;

       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item); 

	//senario 2
	start_item(seq_item);

       	assert (seq_item.randomize() with {

	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00011;	//imm[16:12<<12]
	seq_item.instruction[11:7]      == 5'b00110;	//rd(!=0,2)//6
	seq_item.instruction[12]     	== 1'b0;	//imm[17]signbit
	seq_item.instruction[15:13]     == 3'b011;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;		
	});
	
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item);

	//scenario 3
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00011;	//imm[16:12<<12]
	seq_item.instruction[11:7]      == 5'b00011;	//rd(!=0,2)//3
	seq_item.instruction[12]     	== 1'b1;	//imm[17]signbit
	seq_item.instruction[15:13]     == 3'b011;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item); 

	//scenario 4
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00110;	//imm[16:12<<12]
	seq_item.instruction[11:7]      == 5'b00001;	//rd(!=0,2)//1
	seq_item.instruction[12]     	== 1'b0;	//imm[17]signbit
	seq_item.instruction[15:13]     == 3'b011;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item); 

	//scenario 5
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00000;	//imm[16:12<<12]
	seq_item.instruction[11:7]      == 5'b00000;	//rd(!=0,2)//0
	seq_item.instruction[12]     	== 1'b0;	//imm[17]signbit
	seq_item.instruction[15:13]     == 3'b011;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item);

	//scenario 6
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00000;	//imm[16:12<<12]
	seq_item.instruction[11:7]      == 5'b00010;	//rd(!=0,2)//2
	seq_item.instruction[12]     	== 1'b0;	//imm[17]signbit
	seq_item.instruction[15:13]     == 3'b011;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item);

	//scenario 7
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00111;	//imm[16:12<<12]
	seq_item.instruction[11:7]      == 5'b00011;	//rd(!=0,2)//3
	seq_item.instruction[12]     	== 1'b1;	//imm[17]signbit
	seq_item.instruction[15:13]     == 3'b011;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item); 

	//scenario 8
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00000;	//imm[16:12<<12]
	seq_item.instruction[11:7]      == 5'b00010;	//rd(!=0,2)//0
	seq_item.instruction[12]     	== 1'b0;	//imm[17]signbit
	seq_item.instruction[15:13]     == 3'b011;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item);

	//scenario 9
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00010;	//imm[16:12<<12]
	seq_item.instruction[11:7]      == 5'b00010;	//rd(!=0,2)//0
	seq_item.instruction[12]     	== 1'b0;	//imm[17]signbit
	seq_item.instruction[15:13]     == 3'b011;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item);

	//scenario 10
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00001;	//imm[16:12<<12]
	seq_item.instruction[11:7]      == 5'b00011;	//rd(!=0,2)//0
	seq_item.instruction[12]     	== 1'b0;	//imm[17]signbit
	seq_item.instruction[15:13]     == 3'b011;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item);	
	
	//scenario 11
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
//	seq_item.instruction[6:2]       == 5'b00001;	//imm[16:12<<12]
//	seq_item.instruction[11:7]      == 5'b00011;	//rd(!=0,2)//0
	seq_item.instruction[12]     	== 1'b0;	//imm[17]signbit
	seq_item.instruction[15:13]     == 3'b011;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item);
	
	//scenario 12
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00001;	//imm[16:12<<12]
//	seq_item.instruction[11:7]      == 5'b00011;	//rd(!=0,2)//0
	seq_item.instruction[12]     	== 1'b0;	//imm[17]signbit
	seq_item.instruction[15:13]     == 3'b011;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item);	
	
	//scenario 13
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00001;	//imm[16:12<<12]
	seq_item.instruction[11:7]      == 5'b00011;	//rd(!=0,2)//0
	seq_item.instruction[12]     	== 1'b1;	//imm[17]signbit
	seq_item.instruction[15:13]     == 3'b011;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item);

	//scenario 14
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00001;	//imm[16:12<<12]
//	seq_item.instruction[11:7]      == 5'b00011;	//rd(!=0,2)//0
	seq_item.instruction[12]     	== 1'b1;	//imm[17]signbit
	seq_item.instruction[15:13]     == 3'b011;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item);

	//scenario 15
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00001;	//imm[16:12<<12]
//	seq_item.instruction[11:7]      == 5'b00011;	//rd(!=0,2)//0
	seq_item.instruction[12]     	== 1'b1;	//imm[17]signbit
	seq_item.instruction[15:13]     == 3'b011;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item);


endtask

endclass
