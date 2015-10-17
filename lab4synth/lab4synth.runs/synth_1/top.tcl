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
set_property webtalk.parent_dir C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab4synth/lab4synth.cache/wt [current_project]
set_property parent.project_path C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab4synth/lab4synth.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib {
  C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab4synth/lab4synth.srcs/sources_1/imports/Jon_Lab4/Decrementer.v
  C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab4synth/lab4synth.srcs/sources_1/imports/Jon_Lab4/BCD_adder.v
  C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab4synth/lab4synth.srcs/sources_1/imports/Jon_Lab4/Controller.v
  C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab4synth/lab4synth.srcs/sources_1/imports/Jon_Lab4/Debounce_sp.v
  C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab4synth/lab4synth.srcs/sources_1/imports/Jon_Lab4/Divider.v
  C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab4synth/lab4synth.srcs/sources_1/imports/Jon_Lab4/7_Segment_Display_logic.v
  C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab4synth/lab4synth.srcs/sources_1/imports/Jon_Lab4/Flasher.v
  C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab4synth/lab4synth.srcs/sources_1/imports/Jon_Lab4/TOP.v
}
read_xdc C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab4synth/lab4synth.srcs/constrs_1/imports/460mlab/Basys3_Master_Lab4.xdc
set_property used_in_implementation false [get_files C:/Modeltech_pe_edu_10.4a/examples/460mlab/lab4synth/lab4synth.srcs/constrs_1/imports/460mlab/Basys3_Master_Lab4.xdc]

synth_design -top top -part xc7a35tcpg236-1
write_checkpoint -noxdef top.dcp
catch { report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb }
