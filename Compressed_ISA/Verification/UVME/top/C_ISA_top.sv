module C_ISA_top;

  import uvm_pkg::*;
  import C_ISA_pkg::*;

  `include "uvm_macros.svh"

//-> Wires For Connecting Data Memory With C_ISA CORE RV32IM
    wire          data_mem_write_en_o;
    wire  [31:0]  data_mem_write_addr_o;
    wire  [31:0]  data_mem_write_data_o; 
    wire          data_mem_read_en;
    wire  [31:0]  data_mem_read_addr;
    wire  [31:0]  data_mem_read_data_i;
    wire          id_ex_mem_rd_en;


  //clock and reset signal declaration
    bit risc_clk;

//creatinng instance of interface, in order to connect DUT and testcase
  C_ISA_inf intf(risc_clk);
  
  //DUT instance, interface signals are connected to the DUT ports
  riscv_top dut (
    .risc_clk(intf.risc_clk),
    .risc_rst(intf.risc_rst),
    .instruction(intf.instruction), 
		.data_mem_write_en_o	(data_mem_write_en_o),
		.data_mem_write_data_o	(data_mem_write_data_o),
		.data_mem_write_addr_o	(data_mem_write_addr_o),
		.data_mem_read_en	(data_mem_read_en),
		.data_mem_read_addr	(data_mem_read_addr),
		.id_ex_mem_rd_en 	(id_ex_mem_rd_en),
		.data_mem_read_data_i	(data_mem_read_data_i),    
		.stall_pipeline		(stall_pipeline),
		.ebreak_valid		(ebreak_valid),
    .carry(intf.carry),
    .zero(intf.zero)
		);

    	//-> Data Memory Instantiation
data_memory DATA_MEM (
    .data_mem_clk(intf.risc_clk),
    .data_mem_write_en_o(data_mem_write_en_o),
    .data_mem_write_data_o(data_mem_write_data_o),
    .data_mem_write_addr_o(data_mem_write_addr_o),
    .data_mem_read_en(data_mem_read_en),
    .data_mem_read_addr(data_mem_read_addr),
    .id_ex_mem_rd_en(id_ex_mem_rd_en),
    .data_mem_read_data_i(data_mem_read_data_i)    
    );

  // Clock generation for 740.74 Mhz t=1/f it is 1.35 nano seconds 
  initial begin 
  risc_clk=1'b1;
  forever begin
  #0.675 risc_clk = ~risc_clk;
  end
  end

  //set interface in config_db 
  initial begin 
    uvm_config_db#(virtual C_ISA_inf)::set(null,"*","C_ISA_inf",intf);
  end
  
  initial begin 
    uvm_top.set_report_verbosity_level(UVM_HIGH);  
    run_test("C_ISA_test");
  end

  // Waveform Dumping 
  initial begin
    $shm_open("wave.shm");  // Open SHM database
    $shm_probe("ACTMF");    // Probe all signals (A=All signals,C=Combinational, T=Toggle info, M=Memory, F=Full hierarchy )
  end

    //-> ISA GPR Back Loading Data
  integer random_file_handle;
    integer random_file_handle_ISA;
  
      task generate_random_values_ISA();

        integer i;
        int signed random_value_ISA;

        // Open the file in write mode
        random_file_handle_ISA = $fopen("random_values_ISA.hex", "w");
        if (random_file_handle == 0) begin
            $display("ERROR: Unable to open file.");
            $finish;
        end
	
        // Generate 32 random 32-bit values and write them to the file
        for (i = 0; i < 32; i = i + 1) begin
            random_value_ISA = $urandom_range(-15000,15000);  // Generate random negative value
            //random_value_ISA = $urandom_range(0,444);  // Generate random value
            $fwrite(random_file_handle_ISA, "%08x\n", random_value_ISA);  // write to file in hex format
        end

        $fclose(random_file_handle_ISA);
        $display("Random values have been written to random_values.txt");
    endtask


    initial begin
        // Generate instructions and random values
        generate_random_values_ISA();

        // Load the hex file with random values into the GPRs (Using the top.DUT path for loading)
        for (int i = 0; i < 32; i++) begin
            C_ISA_top.dut.reg_file_inst.dp_ram_inst.regfile[i]=0;
        end

        $readmemh("random_values_ISA.hex", C_ISA_top.dut.reg_file_inst.dp_ram_inst.regfile,0,31);

        // Debugging: Display loaded values to verify
        $display("Loaded GPR values from random_values_ISA.hex:");
        for (int i = 0; i < 32; i++) begin
            $display("C_ISA_top.dut.reg_file_inst.dp_ram_inst.regfile[%0d] = %0d",i, $signed(C_ISA_top.dut.reg_file_inst.dp_ram_inst.regfile[i]));
	    $display("UnSigned value = %0d", C_ISA_top.dut.reg_file_inst.dp_ram_inst.regfile[i]);
        end
    end 

    //-> Load Data Memory
    task generate_data_mem();

        logic [31:0] data_mem;
        integer data_file_handle;
        // int unsigned seed = $urandom() % 100;

        //-> Open the file in write mode
        data_file_handle = $fopen("data.hex", "w");
        if (data_file_handle == 0) begin
            $display("ERROR: Unable to open file.");
            $finish;
        end

        //-> Generate 32 random 32-bit values and write them to the file
        for (int i = 0; i < 16383; i = i + 1) begin
            data_mem = $urandom(); //_range(0,16383);             //-> Generate random value
            $fwrite(data_file_handle, "%08x\n", data_mem);  //-> write to file in hex format
        end

        $fclose(data_file_handle);
        $display("Random values have been written to data_memory.txt");
    endtask


    initial begin
        generate_data_mem();
       
        for (int i = 0; i < 16383; i++) begin
            C_ISA_top.DATA_MEM.mem[i]=0;
        end

        $readmemh("data.hex",C_ISA_top.DATA_MEM.mem,0,16383);

        //-> Debugging: Display loaded values to verify
        $display("Loaded Random values from data.hex:");

        for (int i = 0; i <16383; i++) begin
            $display("C_ISA_top.DATA_MEM.ram[%0d] = %h",i,C_ISA_top.DATA_MEM.mem[i]);
        end

        for (int i = 16383; i < 16384; i++) begin
            $display("C_ISA_top.DATA_MEM.ram[%0d] = %h",i,C_ISA_top.DATA_MEM.mem[i]);
        end
    end 



endmodule  
