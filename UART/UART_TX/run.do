vlib work
vlog mux.v UART_fsm.sv UART_parity_calc.v UART_serializer.v UART_TOP.v UART_TX_tb.v  +cover
vsim -voptargs=+acc work.UART_TX_tb -cover
add wave *
coverage save UART_TX_tb.ucdb -onexit
run -all