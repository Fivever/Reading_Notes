-makelib ies_lib/xil_defaultlib -sv \
  "D:/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_0 \
  "../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../rom16_32.srcs/sources_1/ip/rom16_32/sim/rom16_32.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

