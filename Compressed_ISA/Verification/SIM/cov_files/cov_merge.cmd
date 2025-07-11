merge -overwrite -out cov_merged_output test*
load -run ./cov_work/scope/cov_merged_output

# exclude -inst GP_DMA_TOP.DMA_top_inst.DMA_FSM_ctrl_inst -toggle {start_reg[1-31]}

report -detail -all -text -out cov_report.txt
report -detail -text -out cov_uncovered_report.txt
report -detail -html -out ./cov_report_html
