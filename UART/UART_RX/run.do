vlib work
vlog -f source_files.list -mfcu
vsim -voptargs=+acc work.UART_RX_tb 
add wave *
add wave -position insertpoint sim:/UART_RX_tb/DUT/fsm/*
run -all