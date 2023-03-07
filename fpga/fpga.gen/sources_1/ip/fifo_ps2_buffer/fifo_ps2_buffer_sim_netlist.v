// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (win64) Build 3788238 Tue Feb 21 20:00:34 MST 2023
// Date        : Mon Mar  6 18:40:56 2023
// Host        : tpe running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/School/weeekly_processor/fpga/fpga.gen/sources_1/ip/fifo_ps2_buffer/fifo_ps2_buffer_sim_netlist.v
// Design      : fifo_ps2_buffer
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_ps2_buffer,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2.2" *) 
(* NotValidForBitStream *)
module fifo_ps2_buffer
   (clk,
    srst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    valid,
    data_count);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input clk;
  input srst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output valid;
  output [3:0]data_count;

  wire clk;
  wire [3:0]data_count;
  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire srst;
  wire valid;
  wire wr_en;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [3:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [3:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "4" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "1" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "1" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "1" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "1" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "3" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "14" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "13" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "4" *) 
  (* C_RD_DEPTH = "16" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "4" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "4" *) 
  (* C_WR_DEPTH = "16" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "4" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  fifo_ps2_buffer_fifo_generator_v13_2_7 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(clk),
        .data_count(data_count),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[3:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(1'b0),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(srst),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(valid),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[3:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Uus+5g3Fts6ofehbTlGvCWP47ZUO4Iguts10nwWKrrDCnmsKa0ECOFAy/6mqYixli8+MQiv36nW7
/i00MI/aOdL5Bnv7lIG8IKDhQU26Y0bwz+LQ8JdFuk+yoPzP3KSeDflyhZYqW+F1mMe76Z1rKxpm
NKBrJNbZx9pDDnUS99Q=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MjhF8pcXDmDHbm3qaKwAoW7xraCAj9OKmQsxF9ez58Q1MBQmQ478ZxYQkHS7BgJ8jBjXuEVawhYE
RXXrl2Vh9LdUmrzHoIXf/7/0O8zwhvqGXZlBJvufZPjkW+kT2DV0zifiTSX/MtiLKEkjwrDOwdPw
eQ2VXS1M6bP+Fdv/EZtrQu+O6rr/z8rKbDnwlpS07oAAFNo9whhRhTyGODGiHXHvEt9aEmwggTe4
69Kzr3fkuDSbVmZuu9PSi/LMLdlx8wBbTY5dNNoD7dbmKs/lS8cyJHdH4o5HtFB3C+8TTd/+tS5n
wZBB2jesSLZ9tn0xfDf59P50VDr2XuQhTu0gtA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
WgIQovaPdeSINbxJR137BKZONMNArLTTEi/M2ur2lEjx6z6OBuKH5q80CRzC4EYDDe6jUXzKWFDu
81B03qnuBmJaePVrwKDN5+8u99JrU5kQaFyFrQTWY2Z8nEt4zMvYeOHOve66lP+jPK2QItaVblAY
XbhtjP+k6pZCb/IRcRc=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YD7Tl5QfW9Ui8DCiXtaE8D5ZIKMluUXQGhmoMiq6ZO2KSI9h6Ro9aoSFdKZWX6lCbhqBo9FUrcy0
uH7NQ9YbCY43K8tJE8tbFYzJxOmmHphtV7vSkjSl9HinJXduSqG5SfRjXhN7DUAlYw/QvHBhgUO3
YwZJso8yfud7CbV1HNEcwGwqXEwsGFdkE6bTiUhRnA9Sbof8jjC/qnZtL9qB3F7SHSONAp4yEUkt
t2zKOJsTQ1BbdYhkdSK4tU8C0hGDpCEl8foBaTj8wARxmwoB98XfsLW359Rc1/Cyo1FjSyA9yiYz
CJsstysstNZDK4UkQMreL/vFqi+PxPgf6cCd9w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
NDZIPYFfy5fHOyzo3Wvc+H6hGcMX/P2lLOQCrUCDKgWjBGN6qxCdHPt1E3UKOUWIisbvG/y2kR2e
lMxrLh2Am52VyNGgcKpQwnqw7eXa7+7xvN+Jo11Q1DRbu+NCAFEicO3kbrl48gTPAPhOW5LM7eA2
hZRbCh4SawXFUSOshB/ZJ9/ytC5fO0WCXXV6w0JjN5+rkDg401K4uq8xD4e84GVmnE5GUAfliRXm
W3urevu5NlqqRbGfuX0Yhf83nZnzIHe4PxFqnvtA7+BtSIGzgFiD8OqbV6+nRweKJRcdrx132aph
AoQtianVEl1M8EAP5CNzJAUfMvkkhMRU2x+WtA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ttaeY1lqndtl71pfmwuj1l1gkilLl3f5JV8o3KrBbi/MoHNXAw51rhKtwIQN5JMGkXNAq1kZyGmw
wfnBzWYlAxQE++8sDBT/lxMFxwK9TLDRjMA2veyUqZekotMyLr6d5jf7DgLHCM2cXo9TziodEX6R
o0vGAZjsBlNys+6jGfJbtdV8SCuAlc0I4z9p0boiUCidiK/avjWoktlxrQf1L9g1LZYdk1aRWr/r
hRVHSNpbPLPKSgbHsx6noNv3dgB2mfhn9jhmlmYxV7N5L+d1aoG4VKoY8gUkgypD0PthTdXpweFl
EObdkZWgp0s91R37yUiGaMhImifGXLT2TmvWcg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Xjh/r+uTIFLK1SUOPho9ZPs/oSNalRX+tpCee/BF80wWUXHxPNNIFfPbhrb5Ppm3iEtrNdI5DLRI
0tjaQNPbzdLVasl11GmsykNWzFFsvFxpFj7FYoGMg9QXQ+eT+V0zHbYMSapoSEKGOkdAC/UB8Cys
JxI58H0p8bLI3k0lZp9bTmnvhQqPdYGwLQCb2WsrplhqUtEumZjMcDjl4805ti1AZn5/ADeauued
Yo1NJOUajSC26cFNfwkugV4pVY67Lxk4tZPvHKNbu/qlVhdtJswY4bWKFxZutnAnXmo8S5nFwwEV
JNXYgpVDS07Cue7sbfuxNcNJFvsj6AwVEYNUNw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HsJKFyC7O8ipZYjpbPgzgOY1jcqskM/gO40stsMiM1axRuoFUxObJUt2hfCUSRNCPGcNO1F/k5sQ
YRkxxGWGkipZ+SNKhaOeg1KPWPOyKulujFtq1r64yeL9JT24FMoPBllBlpowEJW2rhYR8ZlWfZra
FfoGFR0l2YzhaeCfNwxUC4ipvZ64nViLxOqoX5r82UyusSDrPfqHu+sw2dmI0qIOe6Krpjgb0kvl
O+UFZqiv9YUgV0mrWsCOYt7y+jtTQJXRkUax3IbEk2EjOoMmQYwXf+x+Fay+Ed2L1weAiKUhgcqj
r7Y9moK51yRXg5LeoQCkNYG50Aw14aC0/I6frAQLjU6fip4iHHXe2RdL0v2xKvLh4X9buAKWic0X
mzA6XFlqEIlNKwo55UbQkTtkWgLwJxeydfCgAOeffrK6Ls2/4a2oneFZbKMNXe9GU4B8AZBZqhla
9MIcb3bCI75UlkW5iI5SB8R/eT/qvrL3yo+JpH6QS7RRXQVgEkwcPrz7

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XhWAwLXQiQzRNHMj075cYascgsaaVmImnIfShSSdw3P5BkCWWmhosk5iLRi/nFtxUTXJuO2ST73Z
EuKgr6/PAqe2+AN48tbN2MKOLx+RKrgqzckIqKWA2gp974Fs/VXaPvr2TnlZ3QkOXqFYvx5UcOI0
PDcRse59FDAYbBIPtS2sw0//yQyHEoKf+D2tIvVNwHyXylR2Oko+g07H/jX5+xx/yuQg29ctBI/m
8vhIbJMnPIEs6AaWbll/KI4pfVEV2TE36xgAWxtyWcx/O9wCJzzri4VIQ/WuagIWoydOMKPISdih
IpmPuVDzuPwInDZfBse7K5fixLpWr1DmvJx7cg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
sCbhosRvV5loCfp2CX5UW6G9dA98Fobzy39VERO4hPN82wRKr7i0hyc2W9kSdV3tifArfeuGK+hN
e9a6qR3mx5a2IrDDjAcEtVchIDpVVJLANzyh7qwTqBXDW/QRSPi3F5pA/YLWK9hePfmya4/jccvE
uKl38Z9x0Ag/YCb6H5BQKuS6O0s383I+FSzOTS0Sxpu+7L3Yr5kP8prRGIP1qD6zMgG6uKJj3HF9
omstvh1F3q5YMgScMd7v1MZWsZELgUQDktPhSt7HUUHogq2aZQYl7x3riganBKoQKZ13A9Iex2ky
qTF3cIrtAz6ZLK4ND+RBseQdbcm7l6h5GALeCg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
P9Ji+GKT738MP7o8TaU+mDFK4pwND49sGVKlSEKVKYxfXQEpCgR3QoVlcWyNhPWFVCBRkAYfaXDX
w0WOnd+KAWMuSDiTgtIpjKHzomg6DvwzJONdE94jHt48fL/q3itgN6pxVY7sU6Bo7xJ0oFjBhGEx
7AY1YLKCoR95jGRnMi1K/OcvN2r3aLyVD4CZBm6xRydif1UrumV6WgSEP7wrQo64lc2+HShIad9x
RbARl/mCcH9mF8W1q5/Gp1LU3RiCnqrMA3tnN2mL3BLWKWJ3bHPQIGFb+eKzCFcksrNNuZW9I+F/
N+Q2f3PL3cVGpFzWMzIBCYLuA6RWNCw/62lOhw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 62704)
`pragma protect data_block
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
hxfk2Q==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
