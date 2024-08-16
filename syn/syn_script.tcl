
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

########################### Formality Setup file ############################

set_svf SYS_TOP.svf

################## Design Compiler Library Files #setup ######################

lappend search_path /home/IC/Labs/SYSTEM_SYN//std_cells
lappend search_path /home/IC/Labs/SYSTEM_SYN//rtl

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries 
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $SSLIB $TTLIB $FFLIB]  

#echo "###############################################"
#echo "############# Reading RTL Files  ##############"
#echo "###############################################"

set file_format verilog

#UART_TX Files

read_file -format $file_format ALU.v
read_file -format $file_format Async_fifo.v
read_file -format $file_format fifo_mem.v
read_file -format $file_format BIT_SYNC.v
read_file -format $file_format fifo_rd.v
read_file -format $file_format fifo_wr.v
read_file -format $file_format ClkDiv.v
read_file -format $file_format CLKDIV_MUX.v
read_file -format $file_format CLK_GATE.v
read_file -format $file_format DATA_SYNC.v
read_file -format $file_format PULSE_GEN.v
read_file -format $file_format register.v
read_file -format $file_format RST_SYNC.v
read_file -format $file_format SYS_CTRL.v
read_file -format $file_format SYS_TOP.v
read_file -format $file_format UART_TOP.v
read_file -format $file_format UART_RX_data_sampling.v
read_file -format $file_format UART_RX_deserializer.v
read_file -format $file_format UART_RX_edge_bit_counter.v
read_file -format $file_format UART_RX_fsm.v
read_file -format $file_format UART_RX_parity_check.v
read_file -format $file_format UART_RX_start_check.v
read_file -format $file_format UART_RX_stop_check.v
read_file -format $file_format UART_RX_TOP.v
read_file -format $file_format mux.v
read_file -format $file_format UART_TX_fsm.v
read_file -format $file_format UART_TX_parity_calc.v
read_file -format $file_format UART_TX_serializer.v
read_file -format $file_format UART_TX_TOP.v

###################### Defining toplevel ###################################

current_design $top_module

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## Liniking All The Design Parts ########"
puts "###############################################"

link 

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design

############################### Path groups ################################
puts "###############################################"
puts "################ Path groups ##################"
puts "###############################################"

group_path -name INREG -from [all_inputs]
group_path -name REGOUT -to [all_outputs]
group_path -name INOUT -from [all_inputs] -to [all_outputs]

#################### Define Design Constraints #########################
puts "###############################################"
puts "############ Design Constraints #### ##########"
puts "###############################################"

source -echo ./cons.tcl

###################### Mapping and optimization ########################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile -map_effort high

##################### Close Formality Setup file ###########################

set_svf -off

#############################################################################
# Write out Design after initial compile
#############################################################################

write_file -format verilog -hierarchy -output UART_TX_TOP.v
write_file -format verilog -hierarchy -output UART_fsm.v
write_file -format verilog -hierarchy -output UART_serializer.v
write_file -format verilog -hierarchy -output UART_parity_calc.v
write_file -format verilog -hierarchy -output mux.v
write_file -format verilog -hierarchy -output ALU.v
write_file -format verilog -hierarchy -output ASYNC_FIFO.v
write_file -format verilog -hierarchy -output fifo_mem.v
write_file -format verilog -hierarchy -output BIT_SYNC.v
write_file -format verilog -hierarchy -output fifo_rd.v
write_file -format verilog -hierarchy -output fifo_wr.v
write_file -format verilog -hierarchy -output ClkDiv.v
write_file -format verilog -hierarchy -output CLKDIV_MUX.v
write_file -format verilog -hierarchy -output CLK_GATE.v
write_file -format verilog -hierarchy -output DATA_SYNC.v
write_file -format verilog -hierarchy -output PULSE_GEN.v
write_file -format verilog -hierarchy -output register.v
write_file -format verilog -hierarchy -output RST_SYNC.v
write_file -format verilog -hierarchy -output SYS_CTRL.v
write_file -format verilog -hierarchy -output SYS_TOP.v
write_file -format verilog -hierarchy -output SYS_TOP_TB.v
write_file -format verilog -hierarchy -output UART_TOP.v
write_file -format verilog -hierarchy -output UART_RX_data_sampling.v
write_file -format verilog -hierarchy -output UART_RX_deserializer.v
write_file -format verilog -hierarchy -output UART_RX_edge_bit_counter.v
write_file -format verilog -hierarchy -output UART_RX_fsm.v
write_file -format verilog -hierarchy -output UART_RX_parity_check.v
write_file -format verilog -hierarchy -output UART_RX_start_check.v
write_file -format verilog -hierarchy -output UART_RX_stop_check.v
write_file -format verilog -hierarchy -output UART_RX_TOP.v
write_file -format verilog -hierarchy -output mux.v
write_file -format verilog -hierarchy -output mux2X1.v
write_file -format verilog -hierarchy -output UART_TX_fsm.sv
write_file -format verilog -hierarchy -output UART_TX_parity_calc.v
write_file -format verilog -hierarchy -output UART_TX_serializer.v
write_file -format verilog -hierarchy -output UART_TX_TOP.v

write_file -format ddc -hierarchy -output SYS_TOP.ddc
write_sdc  -nosplit SYS_TOP.sdc
write_sdf           SYS_TOP.sdf

################# reporting #######################

report_area -hierarchy > area.rpt
report_power -hierarchy > power.rpt
report_timing -max_paths 100 -delay_type min > hold.rpt
report_timing -max_paths 100 -delay_type max > setup.rpt
report_clock -attributes > clocks.rpt
report_constraint -all_violators > constraints.rpt

################# starting graphical user interface #######################

#gui_start
