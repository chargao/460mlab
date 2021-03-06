# 
# Synthesis run script generated by Vivado
# 

set_param gui.test TreeTableDev
set_param xicom.use_bs_reader 1
debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

create_project -in_memory -part xc7a35tcpg236-1
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir E:/EE460M/lab5/project_1.cache/wt [current_project]
set_property parent.project_path E:/EE460M/lab5/project_1.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib {
  E:/EE460M/lab5/Keyboard_scanner.v
  E:/EE460M/lab5/divider.v
  E:/EE460M/lab5/7_seg.v
  E:/EE460M/lab5/partA.v
}
read_xdc E:/EE460M/lab5/Basys3_Master.xdc
set_property used_in_implementation false [get_files E:/EE460M/lab5/Basys3_Master.xdc]

catch { write_hwdef -file Top.hwdef }
synth_design -top Top -part xc7a35tcpg236-1
write_checkpoint -noxdef Top.dcp
catch { report_utilization -file Top_utilization_synth.rpt -pb Top_utilization_synth.pb }
