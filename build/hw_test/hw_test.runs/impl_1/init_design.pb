
q
Command: %s
53*	vivadotcl2@
,link_design -top main -part xc7a100tcsg324-12default:defaultZ4-113h px� 
g
#Design is defaulting to srcset: %s
437*	planAhead2
	sources_12default:defaultZ12-437h px� 
j
&Design is defaulting to constrset: %s
434*	planAhead2
	constrs_12default:defaultZ12-434h px� 
W
Loading part %s157*device2$
xc7a100tcsg324-12default:defaultZ21-403h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2{
gc:/Users/younj/Desktop/dsd_final/build/hw_test/hw_test.gen/sources_1/ip/sram_32x2112_2/sram_32x2112.dcp2default:default2L
8u_compute_top/u_conv_top/u_conv_module/feat_sram_32x21122default:defaultZ1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2{
gc:/Users/younj/Desktop/dsd_final/build/hw_test/hw_test.gen/sources_1/ip/sram_32x1024_2/sram_32x1024.dcp2default:default2N
:u_compute_top/u_conv_top/u_conv_module/result_sram_32x10242default:defaultZ1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2{
gc:/Users/younj/Desktop/dsd_final/build/hw_test/hw_test.gen/sources_1/ip/sram_32x2560_1/sram_32x2560.dcp2default:default2N
:u_compute_top/u_conv_top/u_conv_module/weight_sram_32x25602default:defaultZ1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2\
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.dcp2default:default2/
u_interface_top/u_axi_vdma02default:defaultZ1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2V
Bc:/Users/younj/Desktop/dsd_final/src/common_ip/clk_gen/clk_gen.dcp2default:default2-
u_interface_top/u_clk_gen2default:defaultZ1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2X
Dc:/Users/younj/Desktop/dsd_final/src/common_ip/mig_dram/mig_dram.dcp2default:default2)
u_interface_top/u_mig2default:defaultZ1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2l
Xc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_interconnect_1/axi_interconnect_1.dcp2default:default2C
/u_interface_top/u_axi_subsystem/u_axi_datapath02default:defaultZ1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2\
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_to_apb/axi_to_apb.dcp2default:default2C
/u_interface_top/u_axi_subsystem/u_axi_to_apb_m32default:defaultZ1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2l
Xc:/Users/younj/Desktop/dsd_final/src/common_ip/axi4_32_to_axilite/axi4_32_to_axilite.dcp2default:default2D
0u_interface_top/u_axi_subsystem/u_axi_to_axilite2default:defaultZ1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2d
Pc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_crossbar_1/axi_crossbar_1.dcp2default:default2U
Au_interface_top/u_axi_subsystem/u_axi_controlpath0/u_axi_lite_bus2default:defaultZ1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2d
Pc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_crossbar_0/axi_crossbar_0.dcp2default:default2Q
=u_interface_top/u_axi_subsystem/u_axi_splitter/u_axi_splitter2default:defaultZ1-454h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:022default:default2
00:00:022default:default2
1135.8552default:default2
0.0002default:defaultZ17-268h px� 
h
-Analyzing %s Unisim elements for replacement
17*netlist2
13032default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
x
Netlist was created with %s %s291*project2
Vivado2default:default2
2021.12default:defaultZ1-479h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
�
LRemoving redundant IBUF, %s, from the path connected to top-level port: %s 
35*opt2?
+u_interface_top/u_clk_gen/inst/clkin1_ibufg2default:default2
clk2default:defaultZ31-35h px� 
�
�Could not create '%s' constraint because net '%s' is not directly connected to top level port. Synthesis is ignored for %s but preserved for implementation.
528*constraints2 
IBUF_LOW_PWR2default:default27
!u_interface_top/u_clk_gen/clk_in12default:default2 
IBUF_LOW_PWR2default:default8Z18-550h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/clk_gen/clk_gen_board.xdc2default:default24
u_interface_top/u_clk_gen/inst	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/clk_gen/clk_gen_board.xdc2default:default24
u_interface_top/u_clk_gen/inst	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2X
Bc:/Users/younj/Desktop/dsd_final/src/common_ip/clk_gen/clk_gen.xdc2default:default24
u_interface_top/u_clk_gen/inst	2default:default8Z20-848h px� 
�
%Done setting XDC timing constraints.
35*timing2X
Bc:/Users/younj/Desktop/dsd_final/src/common_ip/clk_gen/clk_gen.xdc2default:default2
572default:default8@Z38-35h px� 
�
Deriving generated clocks
2*timing2X
Bc:/Users/younj/Desktop/dsd_final/src/common_ip/clk_gen/clk_gen.xdc2default:default2
572default:default8@Z38-2h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
get_clocks: 2default:default2
00:00:142default:default2
00:00:122default:default2
1690.1522default:default2
554.2972default:defaultZ17-268h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2X
Bc:/Users/younj/Desktop/dsd_final/src/common_ip/clk_gen/clk_gen.xdc2default:default24
u_interface_top/u_clk_gen/inst	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default24
u_interface_top/u_axi_vdma0/U0	2default:default8Z20-848h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
762default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
802default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
842default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
882default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-12default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
922default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
962default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
1002default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
1042default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
1082default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
1122default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-12default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
1162default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-62default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
2082default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-62default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
2162default:default8@Z4-921h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default24
u_interface_top/u_axi_vdma0/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default24
u_interface_top/u_axi_vdma1/U0	2default:default8Z20-848h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
762default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
802default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
842default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
882default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-12default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
922default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
962default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
1002default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
1042default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
1082default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
1122default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-12default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
1162default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-62default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
2082default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-62default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
2162default:default8@Z4-921h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default24
u_interface_top/u_axi_vdma1/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default24
u_interface_top/u_axi_vdma2/U0	2default:default8Z20-848h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
762default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
802default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
842default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
882default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-12default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
922default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
962default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
1002default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
1042default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
1082default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-42default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
1122default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-12default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
1162default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-62default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
2082default:default8@Z4-921h px� 
�
,Waiver ID '%s' -to list should not be empty.333*	vivadotcl2
CDC-62default:default2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default2
2162default:default8@Z4-921h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2^
Hc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0.xdc2default:default24
u_interface_top/u_axi_vdma2/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2{
ec:/Users/younj/Desktop/dsd_final/src/common_ip/mig_dram/mig_dram/user_design/constraints/mig_dram.xdc2default:default2+
u_interface_top/u_mig	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2{
ec:/Users/younj/Desktop/dsd_final/src/common_ip/mig_dram/mig_dram/user_design/constraints/mig_dram.xdc2default:default2+
u_interface_top/u_mig	2default:default8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2]
GC:/Users/younj/Desktop/dsd_final/src/constraints/Arty-A7-100-Master.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2]
GC:/Users/younj/Desktop/dsd_final/src/constraints/Arty-A7-100-Master.xdc2default:default8Z20-178h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2z
dc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_interconnect_1/axi_interconnect_1_impl_clocks.xdc2default:default2J
4u_interface_top/u_axi_subsystem/u_axi_datapath0/inst	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2z
dc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_interconnect_1/axi_interconnect_1_impl_clocks.xdc2default:default2J
4u_interface_top/u_axi_subsystem/u_axi_datapath0/inst	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2u
_c:/Users/younj/Desktop/dsd_final/src/common_ip/axi_interconnect_1/axi_interconnect_1_clocks.xdc2default:default2J
4u_interface_top/u_axi_subsystem/u_axi_datapath0/inst	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2u
_c:/Users/younj/Desktop/dsd_final/src/common_ip/axi_interconnect_1/axi_interconnect_1_clocks.xdc2default:default2J
4u_interface_top/u_axi_subsystem/u_axi_datapath0/inst	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2e
Oc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0_clocks.xdc2default:default24
u_interface_top/u_axi_vdma0/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2e
Oc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0_clocks.xdc2default:default24
u_interface_top/u_axi_vdma0/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2e
Oc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0_clocks.xdc2default:default24
u_interface_top/u_axi_vdma1/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2e
Oc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0_clocks.xdc2default:default24
u_interface_top/u_axi_vdma1/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2e
Oc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0_clocks.xdc2default:default24
u_interface_top/u_axi_vdma2/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2e
Oc:/Users/younj/Desktop/dsd_final/src/common_ip/axi_vdma_0/axi_vdma_0_clocks.xdc2default:default24
u_interface_top/u_axi_vdma2/U0	2default:default8Z20-847h px� 
m
2%s XPM XDC files have been applied to the design.
665*project2
442default:defaultZ1-1714h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
�%s scoped IP constraints or related sub-commands were skipped due to synthesis logic optimizations usually triggered by constant connectivity or unconnected output pins. To review the skipped constraints and messages, run the command 'set_param netlist.IPMsgFiltering false' before opening the design.
650*project2
62default:defaultZ1-1687h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0302default:default2
1715.4412default:default2
0.0002default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2�
�  A total of 264 instances were transformed.
  IOBUFDS_INTERMDISABLE => IOBUFDS_INTERMDISABLE (IBUFDS_INTERMDISABLE_INT(x2), INV, OBUFTDS(x2)): 2 instances
  IOBUF_INTERMDISABLE => IOBUF_INTERMDISABLE (IBUF_INTERMDISABLE, OBUFT): 16 instances
  LUT6_2 => LUT6_2 (LUT5, LUT6): 46 instances
  OBUFDS => OBUFDS_DUAL_BUF (INV, OBUFDS(x2)): 1 instance 
  RAM32M => RAM32M (RAMD32(x6), RAMS32(x2)): 195 instances
  RAM32X1D => RAM32X1D (RAMD32(x2)): 4 instances
2default:defaultZ1-111h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
222default:default2
412default:default2
02default:default2
02default:defaultZ4-41h px� 
]
%s completed successfully
29*	vivadotcl2
link_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2!
link_design: 2default:default2
00:00:432default:default2
00:00:442default:default2
1715.4412default:default2
579.5862default:defaultZ17-268h px� 


End Record