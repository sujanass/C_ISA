class C_ISA_srai_sequence extends C_ISA_sequence;
//factory registration
`uvm_object_utils(C_ISA_srai_sequence)

  //creating sequence item handle
C_ISA_seq_item seq_item;

int scenario;

//function new constructor
function new(string name="C_ISA_srai_sequence");
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
`uvm_info (get_type_name(),"srai sequence: inside body", UVM_LOW)

 if (scenario == 1)
       // repeat(5) 
       begin
        `uvm_do_with(seq_item,{
	seq_item.risc_rst        	== 1'b0;
	seq_item.instruction[1:0]       == 2'b01;   //opcode
	seq_item.instruction[6:2]       == 5'b111;  //shamt(shift amount)
	seq_item.instruction[9:7]       == 3'b011;  //source or destination register
	seq_item.instruction[11:10]     == 2'b00;   //func2
	seq_item.instruction[12]        == 1'b1;    //(shamt) RVC32 Must be 0
	seq_item.instruction[15:13]     == 3'b100;   //func3	
	seq_item.data_mem_read_data_i   == 32'b0;		
	});
	
	end

 if (scenario == 2)
    //  repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;   //opcode 01
	seq_item.instruction[6:2]       == 5'b00010;  //shamt(shift amount)
	seq_item.instruction[9:7]       == 3'b101;  //source or destination register
	seq_item.instruction[11:10]     == 2'b01;   //func2
	seq_item.instruction[12]        == 1'b0;    //(shamt) RVC32 Must be 0
	seq_item.instruction[15:13]     == 3'b100;   //func3	
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

 if (scenario == 3)
      repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;   //opcode 01
	seq_item.instruction[6:2]       == 5'd1;   //shamt(shift amount)
	seq_item.instruction[9:7]       == 3'd5;    //source or destination register
	seq_item.instruction[11:10]     == 2'b01;   //func2
	seq_item.instruction[12]        == 1'b1;    //(shamt) RVC32 Must be 0
	seq_item.instruction[15:13]     == 3'b100;   //func3	
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

  if (scenario == 4)
   //   repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;   //opcode
	seq_item.instruction[6:2]       == 5'b00111;  //shamt(shift amount)
	seq_item.instruction[9:7]       == 3'b011;  //source or destination register
	seq_item.instruction[11:10]     == 2'b01;   //func2
	seq_item.instruction[12]        == 1'b0;    //(shamt) RVC32 Must be 0
	seq_item.instruction[15:13]     == 3'b100;   //func3	
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

  if (scenario == 5)
      repeat(30) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;   //opcode
//	seq_item.instruction[6:2]       == 5'b100;  //shamt(shift amount)
//	seq_item.instruction[9:7]       == 3'b110;  //source or destination register
	seq_item.instruction[11:10]     == 2'b01;   //func2
	seq_item.instruction[12]        == 1'b0;    //(shamt) RVC32 Must be 0
	seq_item.instruction[15:13]     == 3'b100;   //func3	
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

if (scenario == 6)
      repeat(20) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;   //opcode
//	seq_item.instruction[6:2]       == 5'b111;  //shamt(shift amount)
	seq_item.instruction[9:7]       == 3'b011;  //source or destination register
	seq_item.instruction[11:10]     == 2'b01;   //func2
	seq_item.instruction[12]        == 1'b0;    //(shamt) RVC32 Must be 0
	seq_item.instruction[15:13]     == 3'b100;   //func3	
	seq_item.data_mem_read_data_i   == 32'b1;	
	});
	end

if (scenario == 7)
  //    repeat(2) 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;   //opcode
	seq_item.instruction[6:2]       == 5'b011;  //shamt(shift amount)
//	seq_item.instruction[9:7]       == 3'b011;  //source or destination register
	seq_item.instruction[11:10]     == 2'b01;   //func2
	seq_item.instruction[12]        == 1'b0;    //(shamt) RVC32 Must be 0
	seq_item.instruction[15:13]     == 3'b100;   //func3	
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

endtask

endclass
