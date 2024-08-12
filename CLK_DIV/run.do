vlib work
vlog -f source_files.list -mfcu
vsim -voptargs=+acc work.CLK_DIV_tb 
add wave *
run -all