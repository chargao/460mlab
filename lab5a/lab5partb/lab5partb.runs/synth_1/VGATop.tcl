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
set_property webtalk.parent_dir C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab5a/lab5partb/lab5partb.cache/wt [current_project]
set_property parent.project_path C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab5a/lab5partb/lab5partb.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib {
  C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab5a/lab5partb/lab5partb.srcs/sources_1/imports/lab5a/vga.v
  C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab5a/lab5partb/lab5partb.srcs/sources_1/imports/lab5a/divider.v
  C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab5a/lab5partb/lab5partb.srcs/sources_1/imports/lab5a/part_b_top.v
}
read_xdc C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab5a/lab5partb/lab5partb.srcs/constrs_1/imports/lab5/Basys3_Master.xdc
set_property used_in_implementation false [get_files C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab5a/lab5partb/lab5partb.srcs/constrs_1/imports/lab5/Basys3_Master.xdc]

synth_design -top VGATop -part xc7a35tcpg236-1
write_checkpoint -noxdef VGATop.dcp
catch { report_utilization -file VGATop_utilization_synth.rpt -pb VGATop_utilization_synth.pb }
