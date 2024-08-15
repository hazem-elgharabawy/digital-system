vlib work
vlog -f source_files.list -mfcu
vsim -voptargs=+acc work.SYS_TOP_TB 
add wave *
run -all