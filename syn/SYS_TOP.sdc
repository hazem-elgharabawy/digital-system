###################################################################

# Created by write_sdc on Fri Aug 16 02:41:30 2024

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports REF_CLK]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports RST]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports UART_CLK]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports RX_IN]
set_load -pin_load 0.1 [get_ports TX_OUT]
create_clock [get_ports REF_CLK]  -period 70  -waveform {0 10}
set_clock_uncertainty -setup 0.2  [get_clocks REF_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks REF_CLK]
set_clock_transition -max -rise 0.05 [get_clocks REF_CLK]
set_clock_transition -min -rise 0.05 [get_clocks REF_CLK]
set_clock_transition -max -fall 0.05 [get_clocks REF_CLK]
set_clock_transition -min -fall 0.05 [get_clocks REF_CLK]
group_path -name INOUT  -from [list [get_ports REF_CLK] [get_ports RST] [get_ports UART_CLK] [get_ports RX_IN]]  -to [list [get_ports parity_error] [get_ports stop_error] [get_ports TX_OUT]]
group_path -name INREG  -from [list [get_ports REF_CLK] [get_ports RST] [get_ports UART_CLK] [get_ports RX_IN]]
group_path -name REGOUT  -to [list [get_ports parity_error] [get_ports stop_error] [get_ports TX_OUT]]
set_input_delay -clock REF_CLK  14  [get_ports RST]
