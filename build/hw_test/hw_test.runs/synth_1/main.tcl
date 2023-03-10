# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "C:/Users/younj/Desktop/dsd_final/build/hw_test/hw_test.runs/synth_1/main.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "synth_1" START { ROLLUP_AUTO }
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/younj/Desktop/dsd_final/build/hw_test/hw_test.cache/wt [current_project]
set_property parent.project_path C:/Users/younj/Desktop/dsd_final/build/hw_test/hw_test.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part_repo_paths {C:/Xilinx/Vivado/2021.1/data/board_files} [current_project]
set_property board_part digilentinc.com:arty-a7-100:part0:1.0 [current_project]
set_property ip_output_repo c:/Users/younj/Desktop/dsd_final/build/hw_test/hw_test.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_verilog -library xil_defaultlib {
  C:/Users/younj/Desktop/dsd_final/src/modules/provided/ip/uart/rtl/Convert_32to8.v
  C:/Users/younj/Desktop/dsd_final/src/modules/provided/ip/uart/rtl/FIFO_64bit.v
  C:/Users/younj/Desktop/dsd_final/src/modules/provided/ip/uart/rtl/FIFO_buffer_64bit.v
  C:/Users/younj/Desktop/dsd_final/src/modules/provided/ip/axi_crossbar_0/wrapper/axi_crossbar_0_top.v
  C:/Users/younj/Desktop/dsd_final/src/modules/provided/ip/axi_crossbar_1/wrapper/axi_crossbar_1_top.v
  C:/Users/younj/Desktop/dsd_final/src/modules/provided/ip/host_decoder/rtl/axi_m_interface.v
  C:/Users/younj/Desktop/dsd_final/src/modules/provided/system/rtl/axi_subsystem.v
  C:/Users/younj/Desktop/dsd_final/src/modules/conv_module/clk_counter.v
  C:/Users/younj/Desktop/dsd_final/src/modules/fc_module/clk_counter.v
  C:/Users/younj/Desktop/dsd_final/src/modules/pool_module/clk_counter.v
  C:/Users/younj/Desktop/dsd_final/src/modules/compute_top.v
  C:/Users/younj/Desktop/dsd_final/src/modules/conv_module/conv_apb.v
  C:/Users/younj/Desktop/dsd_final/src/modules/conv_module/conv_module.v
  C:/Users/younj/Desktop/dsd_final/src/modules/conv_module/conv_top.v
  C:/Users/younj/Desktop/dsd_final/src/modules/fc_module/fc_apb.v
  C:/Users/younj/Desktop/dsd_final/src/modules/fc_module/fc_module.v
  C:/Users/younj/Desktop/dsd_final/src/modules/fc_module/fc_top.v
  C:/Users/younj/Desktop/dsd_final/src/modules/provided/ip/host_decoder/rtl/host_decoder.v
  C:/Users/younj/Desktop/dsd_final/src/modules/provided/ip/host_decoder/rtl/host_decoder_top.v
  C:/Users/younj/Desktop/dsd_final/src/modules/interface_top.v
  C:/Users/younj/Desktop/dsd_final/src/modules/pool_module/pool_apb.v
  C:/Users/younj/Desktop/dsd_final/src/modules/pool_module/pool_module.v
  C:/Users/younj/Desktop/dsd_final/src/modules/pool_module/pool_top.v
  C:/Users/younj/Desktop/dsd_final/src/modules/provided/ip/uart/rtl/receive_debouncing.v
  C:/Users/younj/Desktop/dsd_final/src/modules/provided/ip/uart/rtl/receiver.v
  C:/Users/younj/Desktop/dsd_final/src/modules/provided/ip/uart/rtl/transmit_debouncing.v
  C:/Users/younj/Desktop/dsd_final/src/modules/provided/ip/uart/rtl/transmitter.v
  C:/Users/younj/Desktop/dsd_final/src/modules/provided/ip/uart/rtl/uart_top.v
  C:/Users/younj/Desktop/dsd_final/src/modules/main.v
}
read_ip -quiet C:/Users/younj/Desktop/dsd_final/build/hw_test/hw_test.srcs/sources_1/ip/sram_32x2560/sram_32x2560.xci
set_property used_in_implementation false [get_files -all c:/Users/younj/Desktop/dsd_final/build/hw_test/hw_test.gen/sources_1/ip/sram_32x2560_1/sram_32x2560_ooc.xdc]

read_ip -quiet C:/Users/younj/Desktop/dsd_final/src/common_ip/axi_interconnect_1/axi_interconnect_1.xci
set_property used_in_synthesis false [get_files -all c:/Users/younj/Desktop/dsd_final/src/common_ip/axi_interconnect_1/axi_interconnect_1_impl_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/younj/Desktop/dsd_final/src/common_ip/axi_interconnect_1/axi_interconnect_1_impl_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/younj/Desktop/dsd_final/src/common_ip/axi_interconnect_1/axi_interconnect_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/younj/Desktop/dsd_final/src/common_ip/axi_interconnect_1/axi_interconnect_1_clocks.xdc]

read_ip -quiet C:/Users/younj/Desktop/dsd_final/src/common_ip/clk_gen/clk_gen.xci
set_property used_in_implementation false [get_files -all c:/Users/younj/Desktop/dsd_final/src/common_ip/clk_gen/clk_gen_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/younj/Desktop/dsd_final/src/common_ip/clk_gen/clk_gen.xdc]
set_property used_in_implementation false [get_files -all c:/Users/younj/Desktop/dsd_final/src/common_ip/clk_gen/clk_gen_ooc.xdc]

read_ip -quiet C:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xci
set_property used_in_implementation false [get_files -all c:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0_ooc.xdc]

read_ip -quiet C:/Users/younj/Desktop/dsd_final/src/common_ip/axi4_32_to_axilite/axi4_32_to_axilite.xci
set_property used_in_implementation false [get_files -all c:/Users/younj/Desktop/dsd_final/src/common_ip/axi4_32_to_axilite/axi4_32_to_axilite_ooc.xdc]

read_ip -quiet C:/Users/younj/Desktop/dsd_final/src/common_ip/axi_to_apb/axi_to_apb.xci
set_property used_in_implementation false [get_files -all c:/Users/younj/Desktop/dsd_final/src/common_ip/axi_to_apb/axi_to_apb_ooc.xdc]

read_ip -quiet C:/Users/younj/Desktop/dsd_final/src/common_ip/axi_crossbar_0/axi_crossbar_0.xci
set_property used_in_implementation false [get_files -all c:/Users/younj/Desktop/dsd_final/src/common_ip/axi_crossbar_0/axi_crossbar_0_ooc.xdc]

read_ip -quiet C:/Users/younj/Desktop/dsd_final/src/common_ip/axi_crossbar_1/axi_crossbar_1.xci
set_property used_in_implementation false [get_files -all c:/Users/younj/Desktop/dsd_final/src/common_ip/axi_crossbar_1/axi_crossbar_1_ooc.xdc]

read_ip -quiet C:/Users/younj/Desktop/dsd_final/src/common_ip/mig_dram/mig_dram.xci
set_property used_in_implementation false [get_files -all c:/Users/younj/Desktop/dsd_final/src/common_ip/mig_dram/mig_dram/user_design/constraints/mig_dram.xdc]
set_property used_in_implementation false [get_files -all c:/Users/younj/Desktop/dsd_final/src/common_ip/mig_dram/mig_dram/user_design/constraints/mig_dram_ooc.xdc]

read_ip -quiet c:/Users/younj/Desktop/dsd_final/build/hw_test/hw_test.srcs/sources_1/ip/sram_32x2112/sram_32x2112.xci
set_property used_in_implementation false [get_files -all c:/Users/younj/Desktop/dsd_final/build/hw_test/hw_test.gen/sources_1/ip/sram_32x2112_2/sram_32x2112_ooc.xdc]

read_ip -quiet c:/Users/younj/Desktop/dsd_final/build/hw_test/hw_test.srcs/sources_1/ip/sram_32x1024_1/sram_32x1024.xci
set_property used_in_implementation false [get_files -all c:/Users/younj/Desktop/dsd_final/build/hw_test/hw_test.gen/sources_1/ip/sram_32x1024_2/sram_32x1024_ooc.xdc]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/younj/Desktop/dsd_final/src/constraints/Arty-A7-100-Master.xdc
set_property used_in_implementation false [get_files C:/Users/younj/Desktop/dsd_final/src/constraints/Arty-A7-100-Master.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top main -part xc7a100tcsg324-1
OPTRACE "synth_design" END { }
if { [get_msg_config -count -severity {CRITICAL WARNING}] > 0 } {
 send_msg_id runtcl-6 info "Synthesis results are not added to the cache due to CRITICAL_WARNING"
}


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef main.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file main_utilization_synth.rpt -pb main_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }
