class C_ISA_all_sequence extends C_ISA_sequence;
//factory registration
`uvm_object_utils(C_ISA_all_sequence)

  //creating sequence item handle
C_ISA_seq_item seq_item;

int scenario;

//function new constructor
function new(string name="C_ISA_all_sequence");
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
`uvm_info (get_type_name(),"all sequence: inside body", UVM_LOW)

 if (scenario == 1)
       // reset
       begin
        `uvm_do_with(seq_item,{
	seq_item.risc_rst        	== 1'b0;
	seq_item.instruction[1:0]       == 2'b00;	//opcode
	seq_item.instruction[6:2]       == 5'b00000;	//rs2
	seq_item.instruction[11:7]      == 5'b00000;	//rs1/rd
	seq_item.instruction[15:12]     == 4'b0000;	//funct4
	seq_item.data_mem_read_data_i   == 32'b0;		
	});
	
	end

 if (scenario == 2)
   //   addition instruction 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b10;	//opcode
	seq_item.instruction[6:2]       == 5'b00011;	//rs2
	seq_item.instruction[11:7]      == 5'b00100;	//rs1/rd
	seq_item.instruction[15:12]     == 4'b1001;	//funct4
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

 if (scenario == 3)
   //   addition immediate instruction 
       begin
        `uvm_do_with(seq_item,{
	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00011;	//nzimm//
	seq_item.instruction[11:7]      == 5'b00001;	//rd//1
	seq_item.instruction[12]     	== 1'b1;	//sextimm	
	seq_item.instruction[15:13]     == 3'b000;	//funct3
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

  if (scenario == 4)
   //   subtraction instruction 
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

  if (scenario == 5)
    //  or instruction 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode(01)
	seq_item.instruction[4:2]       == 3'b111;	//rs2
	seq_item.instruction[6:5]       == 2'b10;	//funct(10)
	seq_item.instruction[9:7]       == 3'b011;	//rd/rs1
	seq_item.instruction[15:10]     == 6'b100011;	//funct6(100011)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

if (scenario == 6)
 //     xor instruction 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;
	seq_item.instruction[4:2]       == 3'b111;
	seq_item.instruction[6:5]       == 2'b01;
	seq_item.instruction[9:7]       == 3'b011;	
	seq_item.instruction[15:10]       == 6'b100011;	
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

if (scenario == 7)
   //   and instruction 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;
	seq_item.instruction[4:2]       == 3'b111;
	seq_item.instruction[6:5]       == 2'b11;
	seq_item.instruction[9:7]       == 3'b011;	
	seq_item.instruction[15:10]     == 6'b100011;	
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

if (scenario == 8)
   //   andi instruction 
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

if (scenario == 9)
   //   move instruction 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b10;	//opcode(10)
	seq_item.instruction[6:2]       == 5'b00111;	//rs2
	seq_item.instruction[11:7]      == 5'b00011;	//rs1/rd
	seq_item.instruction[15:12]     == 4'b1000;	//func4(1000)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

if (scenario == 10)
   //   addi4sp instruction 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b00;	//opcode(00)
	seq_item.instruction[4:2]       == 3'b000;	//rd'+8
	seq_item.instruction[12:5]      == 8'b00000010;	//imm[5:4|9:6|2|3]
	seq_item.instruction[15:13]     == 3'b000;	//funct3(000)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end
	
if (scenario == 11)
   //   addi16sp instruction 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode(01)
	seq_item.instruction[6:2]       == 5'b10000;	//imm[4|6[8:7]|5]	
	seq_item.instruction[11:7]      == 5'b00010;	//rd'[x[2]]//2	
	seq_item.instruction[12]        == 1'b0;	//imm[9]signbit	
	seq_item.instruction[15:13]     == 3'b011;	//funct1(011)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end
	
if (scenario == 12)
   //   slli instruction 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b10;   //opcode 10
	seq_item.instruction[6:2]       == 5'b00010;  //shamt(shift amount)
	seq_item.instruction[11:7]      == 5'b00011;  //source or destination register
	seq_item.instruction[12]        == 1'b0;    //(shamt[5]) RVC32 Must be 0
	seq_item.instruction[15:13]     == 3'b000;   //func3	
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end
	
if (scenario == 13)
   //   srli instruction 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;   //opcode 01
	seq_item.instruction[6:2]       == 5'd4;  //shamt(shift amount)
	seq_item.instruction[9:7]       == 3'd5;  //source or destination register
	seq_item.instruction[11:10]     == 2'b00;   //func2
	seq_item.instruction[12]        == 1'b0;    //(shamt) RVC32 Must be 0
	seq_item.instruction[15:13]     == 3'b100;   //func3	
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end
	
if (scenario == 14)
   //   srai instruction 
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

if (scenario == 15)
   //   load immediate instruction 
       begin
        `uvm_do_with(seq_item,{
	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00111;	//imm[4:0]
	seq_item.instruction[11:7]      == 5'b00010;	//rd(!=0)
	seq_item.instruction[12]     	== 1'b0;	//imm[5]signbit
	seq_item.instruction[15:13]     == 3'b010;	//funct3
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end
	
if (scenario == 16)
   //   load upper immediate instruction 
       begin
        `uvm_do_with(seq_item,{
	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode
	seq_item.instruction[6:2]       == 5'b00011;	//imm[16:12<<12]
	seq_item.instruction[11:7]      == 5'b00110;	//rd(!=0,2)//6
	seq_item.instruction[12]     	== 1'b0;	//imm[17]signbit
	seq_item.instruction[15:13]     == 3'b011;	//funct3
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

if (scenario == 17)
   //   load word instruction 
       begin
        `uvm_do_with(seq_item,{
	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b00;	//opcode
	seq_item.instruction[4:2]       == 3'b001;	//rd'
	seq_item.instruction[6:5]       == 2'b01;	//imm[2|6]
	seq_item.instruction[9:7]       == 3'b010;	//rs'
	seq_item.instruction[12:10]     == 3'b010;	//imm[5:3]
	seq_item.instruction[15:13]     == 3'b010;	//funct3
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

if (scenario == 18)
   //   load word stack pointer instruction 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b10;	//opcode(10)
	seq_item.instruction[6:2]       == 5'b00111;	//imm[5:0][offset[4:2|7:6]]imm(11001) in decimal=25*4
	seq_item.instruction[11:7]      == 5'b00010;	//rd//2
	seq_item.instruction[12]        == 1'b1;	// imm[6],  
	seq_item.instruction[15:13]     == 3'b010;	//funct3(010)
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end
if (scenario == 19)
   //   store word instruction 
       begin
        `uvm_do_with(seq_item,{
	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b00;	//opcode
	seq_item.instruction[4:2]       == 3'b001;	//rd'
	seq_item.instruction[6:5]       == 2'b10;	//imm[2|6]
	seq_item.instruction[9:7]       == 3'b010;	//rs'
	seq_item.instruction[12:10]     == 3'b000;	//imm[5:3]
	seq_item.instruction[15:13]     == 3'b110;	//funct3
//	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end
if (scenario == 20)
   //   store word stack pointer instruction 
       begin
        `uvm_do_with(seq_item,{
	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b10;	//opcode
	seq_item.instruction[6:2]       == 5'b00010;	//rs
	seq_item.instruction[12:7]      == 6'b111111;	//imm
	seq_item.instruction[15:13]     == 3'b110;	//funct3
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

if (scenario == 21)
   //   no operation instruction 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b01;	//opcode 10
	seq_item.instruction[6:2]       == 5'b00000;	//rs2
	seq_item.instruction[12:7]      == 6'b000000;	//rd/rs1
	seq_item.instruction[15:13]     == 3'b000;	//funct4
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

if (scenario == 22)
   //   environmental break instruction 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b10;		//opcode 10
	seq_item.instruction[11:2]      == 10'b0000000000;	//imm
	seq_item.instruction[15:12]     == 4'b1001;		//funct4
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

if (scenario == 23)
   //   add instruction 
       begin
        `uvm_do_with(seq_item,{
  	seq_item.risc_rst        	== 1'b1;
	seq_item.instruction[1:0]       == 2'b10;	//opcode 10
	seq_item.instruction[6:2]       == 5'b00010;	//rs1
	seq_item.instruction[11:7]      == 5'b00011;	//rd/rs1
	seq_item.instruction[15:12]     == 4'b1001;	//funct4
	seq_item.data_mem_read_data_i   == 32'b0;	
	});
	end

endtask

endclass
