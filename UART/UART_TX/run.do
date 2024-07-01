vlib work
vlog source_files.txt 
vsim -voptargs=+acc work.UART_TX_tb 
add wave *
run -all