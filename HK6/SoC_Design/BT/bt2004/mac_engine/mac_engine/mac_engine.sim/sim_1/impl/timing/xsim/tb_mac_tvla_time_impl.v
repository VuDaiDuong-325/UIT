// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun May  3 12:59:57 2026
// Host        : VuDuong-32 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               D:/HK6/SoC_Design/BT/bt2004/mac_engine/mac_engine/mac_engine.sim/sim_1/impl/timing/xsim/tb_mac_tvla_time_impl.v
// Design      : mac_engine
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* COMPUTE = "2'b01" *) (* IDLE = "2'b00" *) (* WAIT = "2'b10" *) 
module mac_controller
   (clk,
    rst_n,
    start,
    N,
    valid_out_core,
    valid_in,
    clear_acc,
    last_mac_in,
    done);
  input clk;
  input rst_n;
  input start;
  input [7:0]N;
  input valid_out_core;
  output valid_in;
  output clear_acc;
  output last_mac_in;
  output done;

  wire \FSM_onehot_state[0]_i_1_n_0 ;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[1] ;
  wire \FSM_onehot_state_reg_n_0_[2] ;
  wire [7:0]N;
  wire clear_acc;
  wire clear_acc_i_1_n_0;
  wire clk;
  wire [0:0]count;
  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire \count[2]_i_1_n_0 ;
  wire \count[3]_i_1_n_0 ;
  wire \count[4]_i_1_n_0 ;
  wire \count[5]_i_1_n_0 ;
  wire \count[5]_i_2_n_0 ;
  wire \count[6]_i_1_n_0 ;
  wire \count[7]_i_2_n_0 ;
  wire \count[7]_i_3_n_0 ;
  wire \count_reg_n_0_[0] ;
  wire \count_reg_n_0_[1] ;
  wire \count_reg_n_0_[2] ;
  wire \count_reg_n_0_[3] ;
  wire \count_reg_n_0_[4] ;
  wire \count_reg_n_0_[5] ;
  wire \count_reg_n_0_[6] ;
  wire \count_reg_n_0_[7] ;
  wire done;
  wire done_i_1_n_0;
  wire done_i_2_n_0;
  wire last_mac_in;
  wire last_mac_in00_in;
  wire last_mac_in_i_11_n_0;
  wire last_mac_in_i_12_n_0;
  wire last_mac_in_i_13_n_0;
  wire last_mac_in_i_14_n_0;
  wire last_mac_in_i_15_n_0;
  wire last_mac_in_i_16_n_0;
  wire last_mac_in_i_17_n_0;
  wire last_mac_in_i_18_n_0;
  wire last_mac_in_i_19_n_0;
  wire last_mac_in_i_1_n_0;
  wire last_mac_in_i_2_n_0;
  wire last_mac_in_i_4_n_0;
  wire last_mac_in_i_5_n_0;
  wire last_mac_in_i_7_n_0;
  wire last_mac_in_i_8_n_0;
  wire last_mac_in_i_9_n_0;
  wire last_mac_in_reg_i_10_n_0;
  wire last_mac_in_reg_i_6_n_0;
  wire next_state0;
  wire rst_n;
  wire start;
  wire valid_in;
  wire valid_in_i_10_n_0;
  wire valid_in_i_11_n_0;
  wire valid_in_i_12_n_0;
  wire valid_in_i_13_n_0;
  wire valid_in_i_14_n_0;
  wire valid_in_i_15_n_0;
  wire valid_in_i_16_n_0;
  wire valid_in_i_17_n_0;
  wire valid_in_i_18_n_0;
  wire valid_in_i_19_n_0;
  wire valid_in_i_1_n_0;
  wire valid_in_i_2_n_0;
  wire valid_in_i_5_n_0;
  wire valid_in_i_6_n_0;
  wire valid_in_i_7_n_0;
  wire valid_in_i_9_n_0;
  wire valid_in_reg_i_4_n_0;
  wire valid_in_reg_i_8_n_0;
  wire valid_out_core;
  wire [2:0]NLW_last_mac_in_reg_i_10_CO_UNCONNECTED;
  wire [3:0]NLW_last_mac_in_reg_i_10_O_UNCONNECTED;
  wire [3:0]NLW_last_mac_in_reg_i_3_CO_UNCONNECTED;
  wire [3:0]NLW_last_mac_in_reg_i_3_O_UNCONNECTED;
  wire [2:0]NLW_last_mac_in_reg_i_6_CO_UNCONNECTED;
  wire [3:0]NLW_last_mac_in_reg_i_6_O_UNCONNECTED;
  wire [3:0]NLW_valid_in_reg_i_3_CO_UNCONNECTED;
  wire [3:0]NLW_valid_in_reg_i_3_O_UNCONNECTED;
  wire [2:0]NLW_valid_in_reg_i_4_CO_UNCONNECTED;
  wire [3:0]NLW_valid_in_reg_i_4_O_UNCONNECTED;
  wire [2:0]NLW_valid_in_reg_i_8_CO_UNCONNECTED;
  wire [3:0]NLW_valid_in_reg_i_8_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'hFFFF0444FCCC0444)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(start),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(next_state0),
        .I4(\FSM_onehot_state_reg_n_0_[2] ),
        .I5(valid_out_core),
        .O(\FSM_onehot_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCCCC8F8C8F8C8F8)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(start),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(next_state0),
        .I4(\FSM_onehot_state_reg_n_0_[2] ),
        .I5(valid_out_core),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0F0F080F7F7F080)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(start),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(next_state0),
        .I4(\FSM_onehot_state_reg_n_0_[2] ),
        .I5(valid_out_core),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:001,COMPUTE:010,WAIT:100," *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\FSM_onehot_state[0]_i_1_n_0 ),
        .PRE(valid_in_i_2_n_0),
        .Q(\FSM_onehot_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "IDLE:001,COMPUTE:010,WAIT:100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(valid_in_i_2_n_0),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "IDLE:001,COMPUTE:010,WAIT:100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(valid_in_i_2_n_0),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[2] ));
  LUT4 #(
    .INIT(16'h8B88)) 
    clear_acc_i_1
       (.I0(start),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(clear_acc),
        .O(clear_acc_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    clear_acc_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(valid_in_i_2_n_0),
        .D(clear_acc_i_1_n_0),
        .Q(clear_acc));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(\count_reg_n_0_[0] ),
        .O(\count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \count[1]_i_1 
       (.I0(\count_reg_n_0_[0] ),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(\count_reg_n_0_[1] ),
        .O(\count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \count[2]_i_1 
       (.I0(\count_reg_n_0_[0] ),
        .I1(\count_reg_n_0_[1] ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(\count_reg_n_0_[2] ),
        .O(\count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7F008000)) 
    \count[3]_i_1 
       (.I0(\count_reg_n_0_[1] ),
        .I1(\count_reg_n_0_[0] ),
        .I2(\count_reg_n_0_[2] ),
        .I3(\FSM_onehot_state_reg_n_0_[1] ),
        .I4(\count_reg_n_0_[3] ),
        .O(\count[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \count[4]_i_1 
       (.I0(\count_reg_n_0_[2] ),
        .I1(\count_reg_n_0_[0] ),
        .I2(\count_reg_n_0_[1] ),
        .I3(\count_reg_n_0_[3] ),
        .I4(\FSM_onehot_state_reg_n_0_[1] ),
        .I5(\count_reg_n_0_[4] ),
        .O(\count[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hDFFF000020000000)) 
    \count[5]_i_1 
       (.I0(\count_reg_n_0_[3] ),
        .I1(\count[5]_i_2_n_0 ),
        .I2(\count_reg_n_0_[2] ),
        .I3(\count_reg_n_0_[4] ),
        .I4(\FSM_onehot_state_reg_n_0_[1] ),
        .I5(\count_reg_n_0_[5] ),
        .O(\count[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \count[5]_i_2 
       (.I0(\count_reg_n_0_[0] ),
        .I1(\count_reg_n_0_[1] ),
        .O(\count[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h84)) 
    \count[6]_i_1 
       (.I0(\count[7]_i_3_n_0 ),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(\count_reg_n_0_[6] ),
        .O(\count[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hF4)) 
    \count[7]_i_1 
       (.I0(next_state0),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .O(count));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hB040)) 
    \count[7]_i_2 
       (.I0(\count[7]_i_3_n_0 ),
        .I1(\count_reg_n_0_[6] ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(\count_reg_n_0_[7] ),
        .O(\count[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \count[7]_i_3 
       (.I0(\count_reg_n_0_[4] ),
        .I1(\count_reg_n_0_[2] ),
        .I2(\count_reg_n_0_[0] ),
        .I3(\count_reg_n_0_[1] ),
        .I4(\count_reg_n_0_[3] ),
        .I5(\count_reg_n_0_[5] ),
        .O(\count[7]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(clk),
        .CE(count),
        .CLR(valid_in_i_2_n_0),
        .D(\count[0]_i_1_n_0 ),
        .Q(\count_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(clk),
        .CE(count),
        .CLR(valid_in_i_2_n_0),
        .D(\count[1]_i_1_n_0 ),
        .Q(\count_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(clk),
        .CE(count),
        .CLR(valid_in_i_2_n_0),
        .D(\count[2]_i_1_n_0 ),
        .Q(\count_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(clk),
        .CE(count),
        .CLR(valid_in_i_2_n_0),
        .D(\count[3]_i_1_n_0 ),
        .Q(\count_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.C(clk),
        .CE(count),
        .CLR(valid_in_i_2_n_0),
        .D(\count[4]_i_1_n_0 ),
        .Q(\count_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[5] 
       (.C(clk),
        .CE(count),
        .CLR(valid_in_i_2_n_0),
        .D(\count[5]_i_1_n_0 ),
        .Q(\count_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[6] 
       (.C(clk),
        .CE(count),
        .CLR(valid_in_i_2_n_0),
        .D(\count[6]_i_1_n_0 ),
        .Q(\count_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[7] 
       (.C(clk),
        .CE(count),
        .CLR(valid_in_i_2_n_0),
        .D(\count[7]_i_2_n_0 ),
        .Q(\count_reg_n_0_[7] ));
  LUT3 #(
    .INIT(8'hF8)) 
    done_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(valid_out_core),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .O(done_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    done_i_2
       (.I0(valid_out_core),
        .I1(\FSM_onehot_state_reg_n_0_[2] ),
        .O(done_i_2_n_0));
  FDCE #(
    .INIT(1'b0)) 
    done_reg
       (.C(clk),
        .CE(done_i_1_n_0),
        .CLR(valid_in_i_2_n_0),
        .D(done_i_2_n_0),
        .Q(done));
  LUT6 #(
    .INIT(64'hAAEABBFFAAEA88C0)) 
    last_mac_in_i_1
       (.I0(last_mac_in_i_2_n_0),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(last_mac_in00_in),
        .I3(next_state0),
        .I4(last_mac_in_i_4_n_0),
        .I5(last_mac_in),
        .O(last_mac_in_i_1_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    last_mac_in_i_11
       (.I0(N[7]),
        .I1(N[6]),
        .I2(last_mac_in_i_5_n_0),
        .O(last_mac_in_i_11_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    last_mac_in_i_12
       (.I0(N[7]),
        .I1(N[6]),
        .I2(last_mac_in_i_5_n_0),
        .O(last_mac_in_i_12_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    last_mac_in_i_13
       (.I0(N[7]),
        .I1(N[6]),
        .I2(last_mac_in_i_5_n_0),
        .O(last_mac_in_i_13_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    last_mac_in_i_14
       (.I0(N[7]),
        .I1(N[6]),
        .I2(last_mac_in_i_5_n_0),
        .O(last_mac_in_i_14_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    last_mac_in_i_15
       (.I0(N[7]),
        .I1(N[6]),
        .I2(last_mac_in_i_5_n_0),
        .O(last_mac_in_i_15_n_0));
  LUT5 #(
    .INIT(32'h92040092)) 
    last_mac_in_i_16
       (.I0(last_mac_in_i_5_n_0),
        .I1(\count_reg_n_0_[6] ),
        .I2(N[6]),
        .I3(\count_reg_n_0_[7] ),
        .I4(N[7]),
        .O(last_mac_in_i_16_n_0));
  LUT6 #(
    .INIT(64'h9000009020400420)) 
    last_mac_in_i_17
       (.I0(last_mac_in_i_19_n_0),
        .I1(\count_reg_n_0_[3] ),
        .I2(valid_in_i_19_n_0),
        .I3(\count_reg_n_0_[4] ),
        .I4(N[4]),
        .I5(N[3]),
        .O(last_mac_in_i_17_n_0));
  LUT6 #(
    .INIT(64'h0082004128001400)) 
    last_mac_in_i_18
       (.I0(N[0]),
        .I1(N[2]),
        .I2(\count_reg_n_0_[2] ),
        .I3(\count_reg_n_0_[1] ),
        .I4(\count_reg_n_0_[0] ),
        .I5(N[1]),
        .O(last_mac_in_i_18_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    last_mac_in_i_19
       (.I0(N[1]),
        .I1(N[2]),
        .O(last_mac_in_i_19_n_0));
  LUT6 #(
    .INIT(64'h0000000000000080)) 
    last_mac_in_i_2
       (.I0(start),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(N[0]),
        .I3(N[7]),
        .I4(N[6]),
        .I5(last_mac_in_i_5_n_0),
        .O(last_mac_in_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    last_mac_in_i_4
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_state_reg_n_0_[2] ),
        .O(last_mac_in_i_4_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    last_mac_in_i_5
       (.I0(N[5]),
        .I1(N[3]),
        .I2(N[4]),
        .I3(N[2]),
        .I4(N[1]),
        .O(last_mac_in_i_5_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    last_mac_in_i_7
       (.I0(N[7]),
        .I1(N[6]),
        .I2(last_mac_in_i_5_n_0),
        .O(last_mac_in_i_7_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    last_mac_in_i_8
       (.I0(N[7]),
        .I1(N[6]),
        .I2(last_mac_in_i_5_n_0),
        .O(last_mac_in_i_8_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    last_mac_in_i_9
       (.I0(N[7]),
        .I1(N[6]),
        .I2(last_mac_in_i_5_n_0),
        .O(last_mac_in_i_9_n_0));
  FDCE #(
    .INIT(1'b0)) 
    last_mac_in_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(valid_in_i_2_n_0),
        .D(last_mac_in_i_1_n_0),
        .Q(last_mac_in));
  CARRY4 last_mac_in_reg_i_10
       (.CI(1'b0),
        .CO({last_mac_in_reg_i_10_n_0,NLW_last_mac_in_reg_i_10_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_last_mac_in_reg_i_10_O_UNCONNECTED[3:0]),
        .S({last_mac_in_i_15_n_0,last_mac_in_i_16_n_0,last_mac_in_i_17_n_0,last_mac_in_i_18_n_0}));
  CARRY4 last_mac_in_reg_i_3
       (.CI(last_mac_in_reg_i_6_n_0),
        .CO({NLW_last_mac_in_reg_i_3_CO_UNCONNECTED[3],last_mac_in00_in,NLW_last_mac_in_reg_i_3_CO_UNCONNECTED[1:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_last_mac_in_reg_i_3_O_UNCONNECTED[3:0]),
        .S({1'b0,last_mac_in_i_7_n_0,last_mac_in_i_8_n_0,last_mac_in_i_9_n_0}));
  CARRY4 last_mac_in_reg_i_6
       (.CI(last_mac_in_reg_i_10_n_0),
        .CO({last_mac_in_reg_i_6_n_0,NLW_last_mac_in_reg_i_6_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_last_mac_in_reg_i_6_O_UNCONNECTED[3:0]),
        .S({last_mac_in_i_11_n_0,last_mac_in_i_12_n_0,last_mac_in_i_13_n_0,last_mac_in_i_14_n_0}));
  LUT6 #(
    .INIT(64'hDDCC550FDDCC5500)) 
    valid_in_i_1
       (.I0(next_state0),
        .I1(start),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .I3(\FSM_onehot_state_reg_n_0_[1] ),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .I5(valid_in),
        .O(valid_in_i_1_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    valid_in_i_10
       (.I0(N[7]),
        .I1(N[6]),
        .I2(valid_in_i_13_n_0),
        .O(valid_in_i_10_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    valid_in_i_11
       (.I0(N[7]),
        .I1(N[6]),
        .I2(valid_in_i_13_n_0),
        .O(valid_in_i_11_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    valid_in_i_12
       (.I0(N[7]),
        .I1(N[6]),
        .I2(valid_in_i_13_n_0),
        .O(valid_in_i_12_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    valid_in_i_13
       (.I0(N[5]),
        .I1(N[3]),
        .I2(N[4]),
        .I3(N[0]),
        .I4(N[1]),
        .I5(N[2]),
        .O(valid_in_i_13_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    valid_in_i_14
       (.I0(N[7]),
        .I1(N[6]),
        .I2(valid_in_i_13_n_0),
        .O(valid_in_i_14_n_0));
  LUT5 #(
    .INIT(32'h92040092)) 
    valid_in_i_15
       (.I0(valid_in_i_13_n_0),
        .I1(\count_reg_n_0_[6] ),
        .I2(N[6]),
        .I3(\count_reg_n_0_[7] ),
        .I4(N[7]),
        .O(valid_in_i_15_n_0));
  LUT6 #(
    .INIT(64'h9000009020400420)) 
    valid_in_i_16
       (.I0(valid_in_i_18_n_0),
        .I1(\count_reg_n_0_[3] ),
        .I2(valid_in_i_19_n_0),
        .I3(\count_reg_n_0_[4] ),
        .I4(N[4]),
        .I5(N[3]),
        .O(valid_in_i_16_n_0));
  LUT6 #(
    .INIT(64'h0041820014000082)) 
    valid_in_i_17
       (.I0(N[0]),
        .I1(N[2]),
        .I2(\count_reg_n_0_[2] ),
        .I3(\count_reg_n_0_[1] ),
        .I4(\count_reg_n_0_[0] ),
        .I5(N[1]),
        .O(valid_in_i_17_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    valid_in_i_18
       (.I0(N[2]),
        .I1(N[1]),
        .I2(N[0]),
        .O(valid_in_i_18_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    valid_in_i_19
       (.I0(N[5]),
        .I1(\count_reg_n_0_[5] ),
        .O(valid_in_i_19_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    valid_in_i_2
       (.I0(rst_n),
        .O(valid_in_i_2_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    valid_in_i_5
       (.I0(N[7]),
        .I1(N[6]),
        .I2(valid_in_i_13_n_0),
        .O(valid_in_i_5_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    valid_in_i_6
       (.I0(N[7]),
        .I1(N[6]),
        .I2(valid_in_i_13_n_0),
        .O(valid_in_i_6_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    valid_in_i_7
       (.I0(N[7]),
        .I1(N[6]),
        .I2(valid_in_i_13_n_0),
        .O(valid_in_i_7_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    valid_in_i_9
       (.I0(N[7]),
        .I1(N[6]),
        .I2(valid_in_i_13_n_0),
        .O(valid_in_i_9_n_0));
  FDCE #(
    .INIT(1'b0)) 
    valid_in_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(valid_in_i_2_n_0),
        .D(valid_in_i_1_n_0),
        .Q(valid_in));
  CARRY4 valid_in_reg_i_3
       (.CI(valid_in_reg_i_4_n_0),
        .CO({NLW_valid_in_reg_i_3_CO_UNCONNECTED[3],next_state0,NLW_valid_in_reg_i_3_CO_UNCONNECTED[1:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_valid_in_reg_i_3_O_UNCONNECTED[3:0]),
        .S({1'b0,valid_in_i_5_n_0,valid_in_i_6_n_0,valid_in_i_7_n_0}));
  CARRY4 valid_in_reg_i_4
       (.CI(valid_in_reg_i_8_n_0),
        .CO({valid_in_reg_i_4_n_0,NLW_valid_in_reg_i_4_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_valid_in_reg_i_4_O_UNCONNECTED[3:0]),
        .S({valid_in_i_9_n_0,valid_in_i_10_n_0,valid_in_i_11_n_0,valid_in_i_12_n_0}));
  CARRY4 valid_in_reg_i_8
       (.CI(1'b0),
        .CO({valid_in_reg_i_8_n_0,NLW_valid_in_reg_i_8_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_valid_in_reg_i_8_O_UNCONNECTED[3:0]),
        .S({valid_in_i_14_n_0,valid_in_i_15_n_0,valid_in_i_16_n_0,valid_in_i_17_n_0}));
endmodule

(* use_dsp = "yes" *) 
module mac_core
   (clk,
    rst_n,
    valid_in,
    clear_acc,
    last_mac_in,
    w_in,
    x_in,
    psum_out,
    valid_out);
  input clk;
  input rst_n;
  input valid_in;
  input clear_acc;
  input last_mac_in;
  input [7:0]w_in;
  input [7:0]x_in;
  output [31:0]psum_out;
  output valid_out;

  wire [0:0]a_reg;
  wire c_reg1;
  wire c_reg2;
  wire clear_acc;
  wire clk;
  wire l_reg1;
  wire l_reg2;
  wire l_reg3;
  wire last_mac_in;
  wire [0:0]m_reg;
  wire p_0_in;
  wire [0:0]p_reg;
  wire p_reg_reg_n_100;
  wire p_reg_reg_n_101;
  wire p_reg_reg_n_102;
  wire p_reg_reg_n_103;
  wire p_reg_reg_n_104;
  wire p_reg_reg_n_105;
  wire p_reg_reg_n_74;
  wire p_reg_reg_n_75;
  wire p_reg_reg_n_76;
  wire p_reg_reg_n_77;
  wire p_reg_reg_n_78;
  wire p_reg_reg_n_79;
  wire p_reg_reg_n_80;
  wire p_reg_reg_n_81;
  wire p_reg_reg_n_82;
  wire p_reg_reg_n_83;
  wire p_reg_reg_n_84;
  wire p_reg_reg_n_85;
  wire p_reg_reg_n_86;
  wire p_reg_reg_n_87;
  wire p_reg_reg_n_88;
  wire p_reg_reg_n_89;
  wire p_reg_reg_n_90;
  wire p_reg_reg_n_91;
  wire p_reg_reg_n_92;
  wire p_reg_reg_n_93;
  wire p_reg_reg_n_94;
  wire p_reg_reg_n_95;
  wire p_reg_reg_n_96;
  wire p_reg_reg_n_97;
  wire p_reg_reg_n_98;
  wire p_reg_reg_n_99;
  wire [31:0]psum_out;
  wire \psum_out[31]_i_2_n_0 ;
  wire rst_n;
  wire v_reg1;
  wire v_reg2;
  wire v_reg3;
  wire valid_in;
  wire valid_out;
  wire [7:0]w_in;
  wire [7:0]x_in;
  wire NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_p_reg_reg_OVERFLOW_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_p_reg_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_p_reg_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_p_reg_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_p_reg_reg_CARRYOUT_UNCONNECTED;
  wire [47:32]NLW_p_reg_reg_P_UNCONNECTED;
  wire [47:0]NLW_p_reg_reg_PCOUT_UNCONNECTED;

  FDRE #(
    .INIT(1'b0)) 
    c_reg1_reg
       (.C(clk),
        .CE(1'b1),
        .D(clear_acc),
        .Q(c_reg1),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    c_reg2_reg
       (.C(clk),
        .CE(1'b1),
        .D(c_reg1),
        .Q(c_reg2),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    l_reg1_reg
       (.C(clk),
        .CE(1'b1),
        .D(last_mac_in),
        .Q(l_reg1),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    l_reg2_reg
       (.C(clk),
        .CE(1'b1),
        .D(l_reg1),
        .Q(l_reg2),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    l_reg3_reg
       (.C(clk),
        .CE(1'b1),
        .D(l_reg2),
        .Q(l_reg3),
        .R(p_0_in));
  (* OPT_MODIFIED = "RETARGET" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .IS_OPMODE_INVERTED(7'b0100000),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    p_reg_reg
       (.A({w_in[7],w_in[7],w_in[7],w_in[7],w_in[7],w_in[7],w_in[7],w_in[7],w_in[7],w_in[7],w_in[7],w_in[7],w_in[7],w_in[7],w_in[7],w_in[7],w_in[7],w_in[7],w_in[7],w_in[7],w_in[7],w_in[7],w_in}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_p_reg_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({x_in[7],x_in[7],x_in[7],x_in[7],x_in[7],x_in[7],x_in[7],x_in[7],x_in[7],x_in[7],x_in}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_p_reg_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_p_reg_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(a_reg),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(a_reg),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(m_reg),
        .CEP(p_reg),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_p_reg_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,c_reg2,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_p_reg_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_p_reg_reg_P_UNCONNECTED[47:32],p_reg_reg_n_74,p_reg_reg_n_75,p_reg_reg_n_76,p_reg_reg_n_77,p_reg_reg_n_78,p_reg_reg_n_79,p_reg_reg_n_80,p_reg_reg_n_81,p_reg_reg_n_82,p_reg_reg_n_83,p_reg_reg_n_84,p_reg_reg_n_85,p_reg_reg_n_86,p_reg_reg_n_87,p_reg_reg_n_88,p_reg_reg_n_89,p_reg_reg_n_90,p_reg_reg_n_91,p_reg_reg_n_92,p_reg_reg_n_93,p_reg_reg_n_94,p_reg_reg_n_95,p_reg_reg_n_96,p_reg_reg_n_97,p_reg_reg_n_98,p_reg_reg_n_99,p_reg_reg_n_100,p_reg_reg_n_101,p_reg_reg_n_102,p_reg_reg_n_103,p_reg_reg_n_104,p_reg_reg_n_105}),
        .PATTERNBDETECT(NLW_p_reg_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_p_reg_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_p_reg_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_p_reg_reg_UNDERFLOW_UNCONNECTED));
  LUT2 #(
    .INIT(4'h8)) 
    p_reg_reg_i_1
       (.I0(rst_n),
        .I1(valid_in),
        .O(a_reg));
  LUT2 #(
    .INIT(4'h8)) 
    p_reg_reg_i_2
       (.I0(rst_n),
        .I1(v_reg1),
        .O(m_reg));
  LUT2 #(
    .INIT(4'h8)) 
    p_reg_reg_i_3
       (.I0(rst_n),
        .I1(v_reg2),
        .O(p_reg));
  LUT1 #(
    .INIT(2'h1)) 
    \psum_out[31]_i_1 
       (.I0(rst_n),
        .O(p_0_in));
  LUT2 #(
    .INIT(4'h8)) 
    \psum_out[31]_i_2 
       (.I0(v_reg3),
        .I1(l_reg3),
        .O(\psum_out[31]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[0] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_105),
        .Q(psum_out[0]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[10] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_95),
        .Q(psum_out[10]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[11] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_94),
        .Q(psum_out[11]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[12] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_93),
        .Q(psum_out[12]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[13] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_92),
        .Q(psum_out[13]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[14] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_91),
        .Q(psum_out[14]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[15] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_90),
        .Q(psum_out[15]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[16] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_89),
        .Q(psum_out[16]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[17] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_88),
        .Q(psum_out[17]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[18] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_87),
        .Q(psum_out[18]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[19] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_86),
        .Q(psum_out[19]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[1] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_104),
        .Q(psum_out[1]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[20] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_85),
        .Q(psum_out[20]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[21] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_84),
        .Q(psum_out[21]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[22] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_83),
        .Q(psum_out[22]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[23] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_82),
        .Q(psum_out[23]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[24] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_81),
        .Q(psum_out[24]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[25] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_80),
        .Q(psum_out[25]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[26] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_79),
        .Q(psum_out[26]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[27] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_78),
        .Q(psum_out[27]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[28] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_77),
        .Q(psum_out[28]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[29] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_76),
        .Q(psum_out[29]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[2] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_103),
        .Q(psum_out[2]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[30] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_75),
        .Q(psum_out[30]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[31] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_74),
        .Q(psum_out[31]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[3] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_102),
        .Q(psum_out[3]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[4] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_101),
        .Q(psum_out[4]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[5] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_100),
        .Q(psum_out[5]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[6] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_99),
        .Q(psum_out[6]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[7] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_98),
        .Q(psum_out[7]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[8] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_97),
        .Q(psum_out[8]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[9] 
       (.C(clk),
        .CE(\psum_out[31]_i_2_n_0 ),
        .D(p_reg_reg_n_96),
        .Q(psum_out[9]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    v_reg1_reg
       (.C(clk),
        .CE(1'b1),
        .D(valid_in),
        .Q(v_reg1),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    v_reg2_reg
       (.C(clk),
        .CE(1'b1),
        .D(v_reg1),
        .Q(v_reg2),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    v_reg3_reg
       (.C(clk),
        .CE(1'b1),
        .D(v_reg2),
        .Q(v_reg3),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    valid_out_reg
       (.C(clk),
        .CE(1'b1),
        .D(\psum_out[31]_i_2_n_0 ),
        .Q(valid_out),
        .R(p_0_in));
endmodule

(* ECO_CHECKSUM = "ea186ce1" *) 
(* NotValidForBitStream *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
module mac_engine
   (clk,
    rst_n,
    start,
    N,
    w_in,
    x_in,
    psum_out,
    done);
  input clk;
  input rst_n;
  input start;
  input [7:0]N;
  input [7:0]w_in;
  input [7:0]x_in;
  output [31:0]psum_out;
  output done;

  wire [7:0]N;
  wire [7:0]N_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire done;
  wire done_OBUF;
  wire [31:0]psum_out;
  wire [31:0]psum_out_OBUF;
  wire rst_n;
  wire rst_n_IBUF;
  wire start;
  wire start_IBUF;
  wire [7:0]w_in;
  wire [7:0]w_in_IBUF;
  wire wire_clear_acc;
  wire wire_last_mac_in;
  wire wire_valid_in;
  wire wire_valid_out_core;
  wire [7:0]x_in;
  wire [7:0]x_in_IBUF;

initial begin
 $sdf_annotate("tb_mac_tvla_time_impl.sdf",,,,"tool_control");
end
  IBUF \N_IBUF[0]_inst 
       (.I(N[0]),
        .O(N_IBUF[0]));
  IBUF \N_IBUF[1]_inst 
       (.I(N[1]),
        .O(N_IBUF[1]));
  IBUF \N_IBUF[2]_inst 
       (.I(N[2]),
        .O(N_IBUF[2]));
  IBUF \N_IBUF[3]_inst 
       (.I(N[3]),
        .O(N_IBUF[3]));
  IBUF \N_IBUF[4]_inst 
       (.I(N[4]),
        .O(N_IBUF[4]));
  IBUF \N_IBUF[5]_inst 
       (.I(N[5]),
        .O(N_IBUF[5]));
  IBUF \N_IBUF[6]_inst 
       (.I(N[6]),
        .O(N_IBUF[6]));
  IBUF \N_IBUF[7]_inst 
       (.I(N[7]),
        .O(N_IBUF[7]));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF done_OBUF_inst
       (.I(done_OBUF),
        .O(done));
  OBUF \psum_out_OBUF[0]_inst 
       (.I(psum_out_OBUF[0]),
        .O(psum_out[0]));
  OBUF \psum_out_OBUF[10]_inst 
       (.I(psum_out_OBUF[10]),
        .O(psum_out[10]));
  OBUF \psum_out_OBUF[11]_inst 
       (.I(psum_out_OBUF[11]),
        .O(psum_out[11]));
  OBUF \psum_out_OBUF[12]_inst 
       (.I(psum_out_OBUF[12]),
        .O(psum_out[12]));
  OBUF \psum_out_OBUF[13]_inst 
       (.I(psum_out_OBUF[13]),
        .O(psum_out[13]));
  OBUF \psum_out_OBUF[14]_inst 
       (.I(psum_out_OBUF[14]),
        .O(psum_out[14]));
  OBUF \psum_out_OBUF[15]_inst 
       (.I(psum_out_OBUF[15]),
        .O(psum_out[15]));
  OBUF \psum_out_OBUF[16]_inst 
       (.I(psum_out_OBUF[16]),
        .O(psum_out[16]));
  OBUF \psum_out_OBUF[17]_inst 
       (.I(psum_out_OBUF[17]),
        .O(psum_out[17]));
  OBUF \psum_out_OBUF[18]_inst 
       (.I(psum_out_OBUF[18]),
        .O(psum_out[18]));
  OBUF \psum_out_OBUF[19]_inst 
       (.I(psum_out_OBUF[19]),
        .O(psum_out[19]));
  OBUF \psum_out_OBUF[1]_inst 
       (.I(psum_out_OBUF[1]),
        .O(psum_out[1]));
  OBUF \psum_out_OBUF[20]_inst 
       (.I(psum_out_OBUF[20]),
        .O(psum_out[20]));
  OBUF \psum_out_OBUF[21]_inst 
       (.I(psum_out_OBUF[21]),
        .O(psum_out[21]));
  OBUF \psum_out_OBUF[22]_inst 
       (.I(psum_out_OBUF[22]),
        .O(psum_out[22]));
  OBUF \psum_out_OBUF[23]_inst 
       (.I(psum_out_OBUF[23]),
        .O(psum_out[23]));
  OBUF \psum_out_OBUF[24]_inst 
       (.I(psum_out_OBUF[24]),
        .O(psum_out[24]));
  OBUF \psum_out_OBUF[25]_inst 
       (.I(psum_out_OBUF[25]),
        .O(psum_out[25]));
  OBUF \psum_out_OBUF[26]_inst 
       (.I(psum_out_OBUF[26]),
        .O(psum_out[26]));
  OBUF \psum_out_OBUF[27]_inst 
       (.I(psum_out_OBUF[27]),
        .O(psum_out[27]));
  OBUF \psum_out_OBUF[28]_inst 
       (.I(psum_out_OBUF[28]),
        .O(psum_out[28]));
  OBUF \psum_out_OBUF[29]_inst 
       (.I(psum_out_OBUF[29]),
        .O(psum_out[29]));
  OBUF \psum_out_OBUF[2]_inst 
       (.I(psum_out_OBUF[2]),
        .O(psum_out[2]));
  OBUF \psum_out_OBUF[30]_inst 
       (.I(psum_out_OBUF[30]),
        .O(psum_out[30]));
  OBUF \psum_out_OBUF[31]_inst 
       (.I(psum_out_OBUF[31]),
        .O(psum_out[31]));
  OBUF \psum_out_OBUF[3]_inst 
       (.I(psum_out_OBUF[3]),
        .O(psum_out[3]));
  OBUF \psum_out_OBUF[4]_inst 
       (.I(psum_out_OBUF[4]),
        .O(psum_out[4]));
  OBUF \psum_out_OBUF[5]_inst 
       (.I(psum_out_OBUF[5]),
        .O(psum_out[5]));
  OBUF \psum_out_OBUF[6]_inst 
       (.I(psum_out_OBUF[6]),
        .O(psum_out[6]));
  OBUF \psum_out_OBUF[7]_inst 
       (.I(psum_out_OBUF[7]),
        .O(psum_out[7]));
  OBUF \psum_out_OBUF[8]_inst 
       (.I(psum_out_OBUF[8]),
        .O(psum_out[8]));
  OBUF \psum_out_OBUF[9]_inst 
       (.I(psum_out_OBUF[9]),
        .O(psum_out[9]));
  IBUF rst_n_IBUF_inst
       (.I(rst_n),
        .O(rst_n_IBUF));
  IBUF start_IBUF_inst
       (.I(start),
        .O(start_IBUF));
  (* COMPUTE = "2'b01" *) 
  (* IDLE = "2'b00" *) 
  (* WAIT = "2'b10" *) 
  mac_controller u_controller
       (.N(N_IBUF),
        .clear_acc(wire_clear_acc),
        .clk(clk_IBUF_BUFG),
        .done(done_OBUF),
        .last_mac_in(wire_last_mac_in),
        .rst_n(rst_n_IBUF),
        .start(start_IBUF),
        .valid_in(wire_valid_in),
        .valid_out_core(wire_valid_out_core));
  (* USE_DSP = "YES" *) 
  mac_core u_core
       (.clear_acc(wire_clear_acc),
        .clk(clk_IBUF_BUFG),
        .last_mac_in(wire_last_mac_in),
        .psum_out(psum_out_OBUF),
        .rst_n(rst_n_IBUF),
        .valid_in(wire_valid_in),
        .valid_out(wire_valid_out_core),
        .w_in(w_in_IBUF),
        .x_in(x_in_IBUF));
  IBUF \w_in_IBUF[0]_inst 
       (.I(w_in[0]),
        .O(w_in_IBUF[0]));
  IBUF \w_in_IBUF[1]_inst 
       (.I(w_in[1]),
        .O(w_in_IBUF[1]));
  IBUF \w_in_IBUF[2]_inst 
       (.I(w_in[2]),
        .O(w_in_IBUF[2]));
  IBUF \w_in_IBUF[3]_inst 
       (.I(w_in[3]),
        .O(w_in_IBUF[3]));
  IBUF \w_in_IBUF[4]_inst 
       (.I(w_in[4]),
        .O(w_in_IBUF[4]));
  IBUF \w_in_IBUF[5]_inst 
       (.I(w_in[5]),
        .O(w_in_IBUF[5]));
  IBUF \w_in_IBUF[6]_inst 
       (.I(w_in[6]),
        .O(w_in_IBUF[6]));
  IBUF \w_in_IBUF[7]_inst 
       (.I(w_in[7]),
        .O(w_in_IBUF[7]));
  IBUF \x_in_IBUF[0]_inst 
       (.I(x_in[0]),
        .O(x_in_IBUF[0]));
  IBUF \x_in_IBUF[1]_inst 
       (.I(x_in[1]),
        .O(x_in_IBUF[1]));
  IBUF \x_in_IBUF[2]_inst 
       (.I(x_in[2]),
        .O(x_in_IBUF[2]));
  IBUF \x_in_IBUF[3]_inst 
       (.I(x_in[3]),
        .O(x_in_IBUF[3]));
  IBUF \x_in_IBUF[4]_inst 
       (.I(x_in[4]),
        .O(x_in_IBUF[4]));
  IBUF \x_in_IBUF[5]_inst 
       (.I(x_in[5]),
        .O(x_in_IBUF[5]));
  IBUF \x_in_IBUF[6]_inst 
       (.I(x_in[6]),
        .O(x_in_IBUF[6]));
  IBUF \x_in_IBUF[7]_inst 
       (.I(x_in[7]),
        .O(x_in_IBUF[7]));
endmodule
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
