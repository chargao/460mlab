# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab7/lab_7_synth2/lab_7_synth2.cache/wt [current_project]
set_property parent.project_path C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab7/lab_7_synth2/lab_7_synth2.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib {
  C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab7/lab_7_synth2/lab_7_synth2.srcs/sources_1/imports/lab7/mips.v
  C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab7/lab_7_synth2/lab_7_synth2.srcs/sources_1/imports/lab7/complete_mips.v
  C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab7/lab_7_synth2/lab_7_synth2.srcs/sources_1/imports/lab7/Divider.v
}
read_xdc C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab7/lab_7_synth2/lab_7_synth2.srcs/constrs_1/imports/lab7/Basys3_Master.xdc
set_property used_in_implementation false [get_files C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab7/lab_7_synth2/lab_7_synth2.srcs/constrs_1/imports/lab7/Basys3_Master.xdc]

synth_design -top Complete_MIPS -part xc7a35tcpg236-1
write_checkpoint -noxdef Complete_MIPS.dcp
catch { report_utilization -file Complete_MIPS_utilization_synth.rpt -pb Complete_MIPS_utilization_synth.pb }