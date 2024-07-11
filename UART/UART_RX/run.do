vlib work
vlog -f source_files.list -mfcu
vsim -voptargs=+acc work.UART_RX_tb 
add wave *
run -all