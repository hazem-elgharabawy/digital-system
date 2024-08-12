vlib work
vlog -f source_files.list -mfcu
vsim -voptargs=+acc work.FIFO_TB 
add wave *
run -all