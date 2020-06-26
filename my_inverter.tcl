# Set module name
set mod my_inverter

# Set Library
set_attribute library /mnt/apps/prebuilt/eda/designkits/TSMC_65nm/N65RF/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gplus_200a/tcbn65gplustc.lib

set_attribute lef_library /mnt/apps/prebuilt/eda/designkits/TSMC_65nm/N65RF/TSMCHOME/digital/Back_End/lef/tcbn65gplus_200a/lef/tcbn65gplus_6lmT1.lef

set_attribute cap_table_file /mnt/apps/prebuilt/eda/designkits/TSMC_65nm/N65RF/TSMCHOME/digital/Back_End/lef/tcbn65gplus_200a/techfiles/captable/cln65g+_1p06m+alrdl_rcworst_top1.captable

# Read Verilog File
read_hdl -v2001 ../${mod}.v

# Elaborate Design
elaborate 

# Check Design
check_design

# Constraints
define_clock -period 10000 -name main_clk {clk}
external_delay -output 100 -clock main_clk [all_outputs]
external_delay -input 100 -clock main_clk [all_inputs]

# Synthsize to generic
syn_gen

# Synthesize to mapped
syn_map

# Synthesize optimization
syn_opt

# Export synthesized circuit to verilog
write_hdl > ../${mod}_ps.v

# Write Constraints
write_script > constraints.g

# Write SDF
write_sdf > sdf_${mod}.sdf

# Write SDC
write_sdc > sdc_${mod}.sdc

# Reports
report_timing > timing.txt 
report area > area.txt 
report timing -lint 
report design > design.txt 
report gates > gates.txt 
report power > power.txt 
report clocks > clocks.txt 

write_design -innovus
#gui_show


