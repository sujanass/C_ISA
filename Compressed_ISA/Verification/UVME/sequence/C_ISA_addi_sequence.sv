class C_ISA_addi_sequence extends C_ISA_sequence;
//factory registration
`uvm_object_utils(C_ISA_addi_sequence)

  //creating sequence item handle
C_ISA_seq_item seq_item;

int scenario;

//function new constructor
function new(string name="C_ISA_addi_sequence");
super.new(name);
endfunction

//build phase
function build_phase(uvm_phase, phase);
//super.new(phase);
endfunction

//task
task body();

seq_item = C_ISA_seq_item::type_id::create("seq_item");

`uvm_info (get_type_name(),"addition immediate sequence: inside body", UVM_LOW)
//reset scenario 1

	start_item(seq_item);
       	assert (seq_item.randomize() with {
        seq_item.risc_rst 		== 1'b0; 
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00010;	//nzimm
	seq_item.instruction[11:7]      == 5'b11111;	//rd//31
	seq_item.instruction[12]     	== 1'b1;	//sextimm	
	seq_item.instruction[15:13]     == 3'b000;	//funct3
	seq_item.data_mem_read_data_i   == 32'b0;	
          }) ;

       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item);

      // scenario 2
	start_item(seq_item);

       	assert (seq_item.randomize() with {

	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00011;	//nzimm//
	seq_item.instruction[11:7]      == 5'b00001;	//rd//1
	seq_item.instruction[12]     	== 1'b1;	//sextimm	
	seq_item.instruction[15:13]     == 3'b000;	//funct3
	seq_item.data_mem_read_data_i   == 32'b0;		
	});
	
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item); 

   //   scenario 3 
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00010;	//nzimm//0
	seq_item.instruction[11:7]      == 5'b11100;	//rd//0
	seq_item.instruction[12]     	== 1'b0;	//sextimm	
	seq_item.instruction[15:13]     == 3'b000;	//funct3
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item); 

   //   senario 4 
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b11111;	//nzimm
	seq_item.instruction[11:7]      == 5'b00000;	//rd//0
	seq_item.instruction[12]     	== 1'b0;	//sextimm	
	seq_item.instruction[15:13]     == 3'b000;	//funct3
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item); 

	//   scenario 5
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00000;	//nzimm
	seq_item.instruction[11:7]      == 5'b00101;	//rd//1
	seq_item.instruction[12]     	== 1'b0;	//sextimm	
	seq_item.instruction[15:13]     == 3'b000;	//funct3
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item); 

	//   scenario 6 
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00000;	//nzimm
	seq_item.instruction[11:7]      == 5'b00001;	//rd//1
	seq_item.instruction[12]     	== 1'b1;	//sextimm	
	seq_item.instruction[15:13]     == 3'b000;	//funct3
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item); 
	
	//   scenario 7 
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00100;	//nzimm
	seq_item.instruction[11:7]      == 5'b11111;	//rd//31
	seq_item.instruction[12]     	== 1'b0;	//sextimm	
	seq_item.instruction[15:13]     == 3'b000;	//funct3
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item); 

	   //   scenario 8 
	start_item(seq_item);

       	assert (seq_item.randomize() with {

  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
//	seq_item.instruction[6:2]       == 5'b00001;	//nzimm
//	seq_item.instruction[11:7]      == 5'b11011;	//rd//32
	seq_item.instruction[12]     	== 1'b0;	//sextimm	
	seq_item.instruction[15:13]     == 3'b000;	//funct3
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
       	$display("sequence reset=%b",seq_item.risc_rst);

     	finish_item(seq_item); 

endtask

endclass
