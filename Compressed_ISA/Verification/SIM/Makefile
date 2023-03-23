# Show available test cases and options
#

run:	info

info:
	@echo "//-------------------------list of alias name available in make file ---------------------//"
	@echo "    along with make pass any of the one parameter to run corresponding test or to open waveform"
	@echo "    all                             ---->   to run all the below test cases use make all command"
	@echo "    base_test                      ---->   to run the C_ISA_test.sv"
	@echo "    reset_test                    ---->   to run the C_ISA_reset_test.sv"
	@echo "    add_test                ---->   to run the C_ISA_add_test.sv"
	@echo "    sub_test                ---->   to run the C_ISA_sub_test.sv"
	@echo "    or_test                ---->   to run the C_ISA_or_test.sv"
	@echo "    and_test                ---->   to run the C_ISA_and_test.sv"
	@echo "    andi_test                ---->   to run the C_ISA_andi_test.sv"
	@echo "    xor_test                ---->   to run the C_ISA_xor_test.sv"
	@echo "    mv_test                ---->   to run the C_ISA_mv_test.sv"
	@echo "    srli_test                ---->   to run the C_ISA_srli_test.sv"
	@echo "    srai_test                ---->   to run the C_ISA_srai_test.sv"
	@echo "    slli_test                ---->   to run the C_ISA_slli_test.sv"
	@echo "    addi_test                ---->   to run the C_ISA_addi_test.sv"
	@echo "    addi16sp_test                ---->   to run the C_ISA_addi16sp_test.sv"
	@echo "    addi4sp_test                ---->   to run the C_ISA_addi4sp_test.sv"
	@echo "    lwsp_test                ---->   to run the C_ISA_lwsp_test.sv"
	@echo "    swsp_test                ---->   to run the C_ISA_swsp_test.sv"
	@echo "    lw_test                ---->   to run the C_ISA_lw_test.sv"
	@echo "    sw_test                ---->   to run the C_ISA_sw_test.sv"
	@echo "    li_test                ---->   to run the C_ISA_li_test.sv"
	@echo "    lui_test                ---->   to run the C_ISA_lui_test.sv"
	@echo "    nop_test                ---->   to run the C_ISA_nop_test.sv"
	@echo "    ebreak_test                ---->   to run the C_ISA_ebreak_test.sv"
	@echo "    illegal_instruction_test                ---->   to run the C_ISA_illegal_instruction_test.sv"
	@echo "    regression                ---->   to run the regression & source the cmd and open the imc"
	@echo "    waveform                ---->   to open the simvision"
	@echo "    clean                ---->   to delete the previous xrun files and cov files"

	@echo "//---------------------------------------------------------------------------------------//"

# Default target that runs all tests
all: base_test reset_test add_test waveform

# Base test case
base_test:
	@echo "[makefile]  base test case is running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_test -uvmhome CDNS-1.1d -seed
	@echo "[makefile]  base test case run is completed successfully"

# reset test case
reset_test:
	@echo "[makefile]  reset test case is running"
	xrun -access +rwc -f compile_list.f -uvmhome CDNS-1.1d +UVM_TESTNAME=C_ISA_reset_test
	@echo "[makefile]  reset test case run is completed successfully"

# C_ISA add_test case
add_test:
	@echo "[makefile]  C_ISA add_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_add_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA add_test case run was successful"


# C_ISA sub_test case
sub_test:
	@echo "[makefile]  C_ISA sub_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_sub_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA sub_test case run was successful"

# C_ISA or_test case
or_test:
	@echo "[makefile]  C_ISA or_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_or_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA or_test case run was successful"

# C_ISA and_test case
and_test:
	@echo "[makefile]  C_ISA and_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_and_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA and_test case run was successful"

# C_ISA xor_test case
xor_test:
	@echo "[makefile]  C_ISA xor_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_xor_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA xor_test case run was successful"

# C_ISA mv_test case
mv_test:
	@echo "[makefile]  C_ISA mv_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_mv_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA mv_test case run was successful"

# C_ISA srli_test case
srli_test:
	@echo "[makefile]  C_ISA srli_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_srli_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA srli_test case run was successful"

# C_ISA srai_test case
srai_test:
	@echo "[makefile]  C_ISA srai_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_srai_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA srai_test case run was successful"

# C_ISA slli_test case
slli_test:
	@echo "[makefile]  C_ISA slli_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_slli_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA slli_test case run was successful"


# C_ISA andi_test case
andi_test:
	@echo "[makefile]  C_ISA andi_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_andi_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA andi_test case run was successful"

# C_ISA andi_test case
addi_test:
	@echo "[makefile]  C_ISA addi_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_addi_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA addi_test case run was successful"

# C_ISA andi4sp_test case
addi4sp_test:
	@echo "[makefile]  C_ISA addi4sp_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_addi4sp_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA addi4sp_test case run was successful"

# C_ISA andi16sp_test case
addi16sp_test:
	@echo "[makefile]  C_ISA addi16sp_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_addi16sp_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA addi16sp_test case run was successful"

# C_ISA lwsp_test case
lwsp_test:
	@echo "[makefile]  C_ISA lwsp_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_lwsp_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA lwsp_test case run was successful"

# C_ISA swsp_test case
swsp_test:
	@echo "[makefile]  C_ISA swsp_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_swsp_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA swsp_test case run was successful"

# C_ISA lw_test case
lw_test:
	@echo "[makefile]  C_ISA lw_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_lw_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA lw_test case run was successful"

# C_ISA sw_test case
sw_test:
	@echo "[makefile]  C_ISA sw_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_sw_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA sw_test case run was successful"

# C_ISA li_test case
li_test:
	@echo "[makefile]  C_ISA li_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_li_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA li_test case run was successful"

# C_ISA lui_test case
lui_test:
	@echo "[makefile]  C_ISA lui_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_lui_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA lui_test case run was successful"

# C_ISA nop_test case
nop_test:
	@echo "[makefile]  C_ISA nop_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_nop_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA nop_test case run was successful"

# C_ISA ebreak_test case
ebreak_test:
	@echo "[makefile]  C_ISA ebreak_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_ebreak_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA ebreak_test case run was successful"

# C_ISA illegal_instruction_test case
illegal_instruction_test:
	@echo "[makefile]  C_ISA illegal_instruction_test case running"
	xrun -access +rwc -f compile_list.f +UVM_TESTNAME=C_ISA_illegal_instruction_test -uvmhome CDNS-1.1d 
	@echo "[makefile]  C_ISA illegal_instruction_test case run was successful"

#regression
regression:
	@echo "[makefile]  regression running"
	perl C_ISA_regression.pl test_list.f 1
	source cmd
	imc -exec ./cov_files/cov_merge.cmd
	imc &	
	@echo "[makefile]  regression was successfully completed"

clean:

	rm -r *.log *.key xrun.history xcelium.d wave.shm cov_report.txt cov_report_html
	@echo "[makefile]  clean was successfully completed"

# Waveform viewing
waveform:
	simvision wave.shm &

