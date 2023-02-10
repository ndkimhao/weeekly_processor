// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.1 (win64) Build 3719031 Thu Dec  8 18:35:04 MST 2022
// Date        : Thu Feb  9 16:00:23 2023
// Host        : tpe running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top fifo_uart_buffer -prefix
//               fifo_uart_buffer_ fifo_uart_buffer_sim_netlist.v
// Design      : fifo_uart_buffer
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_uart_buffer,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2.1" *) 
(* NotValidForBitStream *)
module fifo_uart_buffer
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
  output [4:0]data_count;

  wire clk;
  wire [4:0]data_count;
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
  wire [4:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [4:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "5" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "30" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "29" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "5" *) 
  (* C_RD_DEPTH = "32" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "5" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "5" *) 
  (* C_WR_DEPTH = "32" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "5" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  fifo_uart_buffer_fifo_generator_v13_2_7 U0
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[4:0]),
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[4:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
cnGRCwL34Zd/f7vN/qdTD5tSmfep25WormGF9GAvWhUMBSk6AK1gW8Ra1lJ96EnhSz8Shpe4UOE1
EphxlE3fTmP9DODIPwi2ixCtDPd9msxcfI/gIL4cIVjSzINnCgEMiS2h90UJ2QvivpHYcO8DyoX2
ykqCgOn+EKOfXmQk3pQ=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lYxfDFHbg7lJtrHk/tReRS6zZhx0OSSI0zhBymbLSuJ6qa8ZwrpjVaeqrJwGbfYhCCcQPo9qpgKt
mdLg3frBZjJxIw2DLDjBnu9TBP6EABfDjt5+o0kVk03KLH46JAJ+8lW7FBPdjmM+3pWoTVDCrsmQ
c0UcAor3nmV81MaUXj50o0znqOUOtqvPsvfe4koE3aVfTKLZGtau6RWG64GOPtfJRXU5LMBKaFqY
8uFguo6eDEuQXVtOVn+z9Wcy2WRasmxK3o6zUBaUY1rAVODTcgTD4AR7IxPt7X6apcH04S5vfH6F
4niNMnhYANp2m2v7LEAtvuK2HwYIx6vU8vsPsA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
bjqILVKRxjOBgGhcj63iJECI16B7tFPgTPUUpEvBtevwKfbOxFgVfGuviffg4ux+gpu0G0y379G9
Rzdr1JXaspY/nBz6CUR15znAPomLh2TXKggLG+05LHcwfzUmNyhbu3oyww9Z3OGnRVW3i7bgyCtL
k22rtQcTPyBVK2LiYjM=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FawkOjwvioItJpe+V27+6I0BWFA/ImzNNGmZF1aSKRK5w7saPIlqVn0sGtSBmf1el0e+Mk87hZPr
6Tzvl7ANENDFwRWk9rMttElc2gvjnZk22d2qODOQ3xXq8NZ7UBWBsSpws65LwI1if5BQzfTTF1As
M++MMvgrXLSVo0pzPKy3CGAgaVrO2INFHGAmwgdO+IrFkvYrVcFGtly4yZ0P0Y0ZAOi2EKU2ZOU9
DqjPxrtZ1q9WcVbTIqF0h3/fIpbdQAfnIx3d2bPQtWJ4XDg+zDw0nSy20W+5iwRE+5DSSeCFceyz
VE5GYrpt7DxldpaMCqwbFvWYjQUMq/i946LWlw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zaHEFs0xfpkkyXS+6RRmBPGvrRGcJkKa0cjSk4Q8iIlFP9W69OP1CouPOHsTIncw08tOyfZbyz2f
Bh/LNyE+YmANfPBSmkuFI3+KAQ9l8ajxJTD3kXKj58+hywAuVC89+h69HrGl5jjagUz5PsHtLINr
SO+mhJKV4d7zpje6isLaJ6wXG/tOyjhIkJW6vlin0S/eh6QBrVs/hXkMIpCvN2cQ+4yXJVwACFTq
aNir87pJP+3b1UgSqwMlQOblYtqrWtXWMUFvAbimSvQUqFzXn5PvhNvBBdHSFnJCWqFWrVqh0cmt
qOb03MKmsPWlS2oUaLMW0QMDERpjnOVOwAbbmg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L2kVWVHE/7S2hOHNzYw9bhdLgi9kSzHXZyZoHJKJCnG0WF/7GH6sO3g0fSG9Ol51eFvVQYOuc7ec
5GyDiyar72uneDAJQJQu2MOZgjhtSSeT8qk4KgTrrdKci9C0ZoJEL1By5/GtQCMZwlBKGURmkZt4
I2Myljy/8qDOF8WihWgGUgfaRFUx1bX58bdEni9n11S4ImxG8r9EY1NptpwpjV+wChaCSZJ71Ex+
rmeRSNqUbSX3Ak4UYQeRAFFL6XjYqh+kzhfAHzcJeKJRqzw37W9ROAwQbnbEE5QZK3stRtBPiwDs
2XfN8PqcGh7mzHIh6Ce3TAVj7plPvjQY7lM8Zg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YZQinbE95dig+Yc5croxoSlc3jFsiKxCZkppz8RB6TJrKwFRtEDyOSjdk4Q+CJYLR5NIUVNRPx9R
8nEHtLn/Mx54Ehu9tDtqP83a+ssnVLG4g64H/AggCfEAy4BVBKgnLkGda43edfZ2HilIN9kPIG35
Vw3S5z098lrWQNNWw3dsEMpWxvDJ7N80PizJcuovPyuuyHIOOyeRYo1Cb9gmbGBtNkA57z6WZHaK
6LxhE6EAT4JTxeXLjlT8Cb06GUBaZyMQog+c3lPPtfSw59lc2MfGgftmP55BzAdWWvhR9rESYsPV
YLzMbjVjiiyWfYCvuWY7urYoTeZM3UyP0WvU7g==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
Z+WCKlqzP3Bsp7TTwkQKdX5/5ScO7SyI58bdHds4KNxzDIDMF6UL1G+oIjCbm5mv8xv1AdT9MUAu
OtGnnCrMwHOFHqCGut+Pfk9j7+PTeGNQnhw3k/GAodWJSBjW7sMRNIv+PjEEfHN+CUiNIf6HIUcp
NtI0WSD0dwW3ck66Catc6s+HSf4yPhEehdq0Bj8SpcLIVwbhYFon9WgSSrZOIeaj/HipPiuRjh7m
jGmUjWYM5qg7hdwSaADq5RcJmJyupR9cUL1kavD3TPpKu7Myt5RUzZ2F2M+c3nNraeQ89sAa7BW+
DPJ1NvyO//7tInNchAjvi5mbTYq19u6vZqCEkwNXwkQ9VkB8pR4JOt+gPQGzSU/Q+xP7nUWwZGt2
erR4qVFFurQU4Z+NEBZdk7+qIas5JM0Fdoa5auw1c68UTRYwGturZJQxdS48tMH8ThuL5UkcwYAz
97wwTPTHTeBhwD9Uwzp/oKizb4EvIAr+pBjw5xQzXan+ZWy0+/4NAeIP

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MKVvv2qyaMoY4H7ekt7yHCmn/5xXG5RDFvwrT0oB4qp0OIxEggKardLW+e786Ndqk6cV9b+xCfY3
hDDImtwJxfERmOpLi/sTIOxL0z1Yv6sutDW+M+0tcQGy+QhH+w1tC7civjRVgpV6kA1lx43yKdrR
axbsyzzcKlWlYbhjM6DV2DKUQi0bYI3hu9BcZkbjpqJuwZom5icYfY/s9a9saodKULTGX387j6Jy
Kfui3HGYyvWveqhP6EbRx6ZfduohLWfJTrTQS0qnl+pPWVG3MLOHEz7Z4ayDbGE8WnKEe0Kk/RQH
L5OzB5ddj1tSR8U7bF+/yiGbEnxQ1l+AF1ECbQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ndsI5lHyR3ea0d+Wu/KczAcQzFbZfn/eeULFvxWZxdn0axyuM1SlBVWezjGNhShfZtaY/m6+hgQi
YJkLVXv9WGniQk4I7RUL3D4RT2g0P9+rIfRWyUI17Lx1v7NHoKt1r4y/pEouUS6vX/kQYv5qWS6k
s9qybwR0nkr6Xxb4lAwjXSobaPxLE9lgBOhDZkA3MutQNvmwBKLyQMTN8cECMLMu8npZQKA02Xqu
piR5SYYpJHcOP80l350nkKVfirhPqHgvEo713p6NkOtJSNcRwUPTGrvWrQUOqnXHDw2KMJK3b/ed
y966oTXHP9okTPpKhcVsg0BQb3ezRl1PaxW8Zg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hjWfP6l5uQTZ77OfPacB0LrjQcamPWrWG9XZJsOO0dFli9AZP9lt8DLeQLK/j/C4ISaB+YV62TEd
6QxJtzI0W3xh6qgniodDN5PffvxU1eOyYttG+ouyAt4WCkzPrvelNnFQOZZadWWkcPHQfts+MZi4
0EWg6Hl81XnIXcOZ3zdkPpz1qd1hx2N1irakc3susXWEmvFrWoxyJoToaLp6v24TfpBDH9HHsNxG
ZFjQvec/Kb22dUv4WJ2Szntwqm+j+9HCreuuKozuHm6dYtFpr+d4VUfnvmtQ4s5yUnbQhcuqRk4q
fZZR4wmnsefS8tQvUQPw+nYfPMXHvkIPW9HPlQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 70800)
`pragma protect data_block
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
9Cp3tiYs
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
