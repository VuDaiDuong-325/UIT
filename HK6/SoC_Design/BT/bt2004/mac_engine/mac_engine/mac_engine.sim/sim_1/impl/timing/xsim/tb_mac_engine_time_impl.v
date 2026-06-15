// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Apr 20 17:20:41 2026
// Host        : VuDuong-32 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               D:/HK6/SoC_Design/BT/bt2004/mac_engine/mac_engine/mac_engine.sim/sim_1/impl/timing/xsim/tb_mac_engine_time_impl.v
// Design      : mac_engine
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module mac_controller
   (done_OBUF,
    wire_valid_in,
    wire_clear_acc,
    wire_last_mac_in,
    \FSM_onehot_state_reg[2]_0 ,
    CEA2,
    done_reg_0,
    CLK,
    p_0_in,
    N_IBUF,
    start_IBUF,
    wire_valid_out_core,
    rst_n_IBUF);
  output done_OBUF;
  output wire_valid_in;
  output wire_clear_acc;
  output wire_last_mac_in;
  output \FSM_onehot_state_reg[2]_0 ;
  output [0:0]CEA2;
  input done_reg_0;
  input CLK;
  input p_0_in;
  input [7:0]N_IBUF;
  input start_IBUF;
  input wire_valid_out_core;
  input rst_n_IBUF;

  wire [0:0]CEA2;
  wire CLK;
  wire \FSM_onehot_state[0]_i_1_n_0 ;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state_reg[2]_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[1] ;
  wire [7:0]N_IBUF;
  wire clear_acc_i_1_n_0;
  wire [7:0]count;
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
  wire [0:0]count_0;
  wire done_OBUF;
  wire done_i_1_n_0;
  wire done_reg_0;
  wire last_mac_in00_in;
  wire last_mac_in0_carry__0_i_1_n_0;
  wire last_mac_in0_carry__0_i_2_n_0;
  wire last_mac_in0_carry__0_i_3_n_0;
  wire last_mac_in0_carry__0_i_4_n_0;
  wire last_mac_in0_carry__0_n_0;
  wire last_mac_in0_carry__1_i_1_n_0;
  wire last_mac_in0_carry__1_i_2_n_0;
  wire last_mac_in0_carry__1_i_3_n_0;
  wire last_mac_in0_carry_i_1_n_0;
  wire last_mac_in0_carry_i_2_n_0;
  wire last_mac_in0_carry_i_3_n_0;
  wire last_mac_in0_carry_i_4_n_0;
  wire last_mac_in0_carry_i_5_n_0;
  wire last_mac_in0_carry_i_6_n_0;
  wire last_mac_in0_carry_n_0;
  wire last_mac_in_i_1_n_0;
  wire last_mac_in_i_2_n_0;
  wire last_mac_in_i_3_n_0;
  wire next_state0__10;
  wire next_state0_carry__0_i_1_n_0;
  wire next_state0_carry__0_i_2_n_0;
  wire next_state0_carry__0_i_3_n_0;
  wire next_state0_carry__0_i_4_n_0;
  wire next_state0_carry__0_n_0;
  wire next_state0_carry__1_i_1_n_0;
  wire next_state0_carry__1_i_2_n_0;
  wire next_state0_carry__1_i_3_n_0;
  wire next_state0_carry_i_1_n_0;
  wire next_state0_carry_i_2_n_0;
  wire next_state0_carry_i_3_n_0;
  wire next_state0_carry_i_4_n_0;
  wire next_state0_carry_i_5_n_0;
  wire next_state0_carry_i_6_n_0;
  wire next_state0_carry_i_7_n_0;
  wire next_state0_carry_n_0;
  wire p_0_in;
  wire rst_n_IBUF;
  wire start_IBUF;
  wire valid_in_i_1_n_0;
  wire wire_clear_acc;
  wire wire_last_mac_in;
  wire wire_valid_in;
  wire wire_valid_out_core;
  wire [2:0]NLW_last_mac_in0_carry_CO_UNCONNECTED;
  wire [3:0]NLW_last_mac_in0_carry_O_UNCONNECTED;
  wire [2:0]NLW_last_mac_in0_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_last_mac_in0_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_last_mac_in0_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_last_mac_in0_carry__1_O_UNCONNECTED;
  wire [2:0]NLW_next_state0_carry_CO_UNCONNECTED;
  wire [3:0]NLW_next_state0_carry_O_UNCONNECTED;
  wire [2:0]NLW_next_state0_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_next_state0_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_next_state0_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_next_state0_carry__1_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'hFFFF0444FCCC0444)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(start_IBUF),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(next_state0__10),
        .I4(\FSM_onehot_state_reg[2]_0 ),
        .I5(wire_valid_out_core),
        .O(\FSM_onehot_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCCCC8F8C8F8C8F8)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(start_IBUF),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(next_state0__10),
        .I4(\FSM_onehot_state_reg[2]_0 ),
        .I5(wire_valid_out_core),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0F0F080F7F7F080)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(start_IBUF),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(next_state0__10),
        .I4(\FSM_onehot_state_reg[2]_0 ),
        .I5(wire_valid_out_core),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:001,COMPUTE:010,WAIT:100," *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\FSM_onehot_state[0]_i_1_n_0 ),
        .PRE(p_0_in),
        .Q(\FSM_onehot_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "IDLE:001,COMPUTE:010,WAIT:100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "IDLE:001,COMPUTE:010,WAIT:100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg[2]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h8B88)) 
    clear_acc_i_1
       (.I0(start_IBUF),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(wire_clear_acc),
        .O(clear_acc_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    clear_acc_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(clear_acc_i_1_n_0),
        .Q(wire_clear_acc));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(count[0]),
        .O(\count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \count[1]_i_1 
       (.I0(count[0]),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(count[1]),
        .O(\count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \count[2]_i_1 
       (.I0(count[0]),
        .I1(count[1]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(count[2]),
        .O(\count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7F008000)) 
    \count[3]_i_1 
       (.I0(count[1]),
        .I1(count[0]),
        .I2(count[2]),
        .I3(\FSM_onehot_state_reg_n_0_[1] ),
        .I4(count[3]),
        .O(\count[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \count[4]_i_1 
       (.I0(count[2]),
        .I1(count[0]),
        .I2(count[1]),
        .I3(count[3]),
        .I4(\FSM_onehot_state_reg_n_0_[1] ),
        .I5(count[4]),
        .O(\count[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hDFFF000020000000)) 
    \count[5]_i_1 
       (.I0(count[3]),
        .I1(\count[5]_i_2_n_0 ),
        .I2(count[2]),
        .I3(count[4]),
        .I4(\FSM_onehot_state_reg_n_0_[1] ),
        .I5(count[5]),
        .O(\count[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \count[5]_i_2 
       (.I0(count[0]),
        .I1(count[1]),
        .O(\count[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h84)) 
    \count[6]_i_1 
       (.I0(\count[7]_i_3_n_0 ),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(count[6]),
        .O(\count[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hF4)) 
    \count[7]_i_1 
       (.I0(next_state0__10),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .O(count_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hB040)) 
    \count[7]_i_2 
       (.I0(\count[7]_i_3_n_0 ),
        .I1(count[6]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(count[7]),
        .O(\count[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \count[7]_i_3 
       (.I0(count[4]),
        .I1(count[2]),
        .I2(count[0]),
        .I3(count[1]),
        .I4(count[3]),
        .I5(count[5]),
        .O(\count[7]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(CLK),
        .CE(count_0),
        .CLR(p_0_in),
        .D(\count[0]_i_1_n_0 ),
        .Q(count[0]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(CLK),
        .CE(count_0),
        .CLR(p_0_in),
        .D(\count[1]_i_1_n_0 ),
        .Q(count[1]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(CLK),
        .CE(count_0),
        .CLR(p_0_in),
        .D(\count[2]_i_1_n_0 ),
        .Q(count[2]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(CLK),
        .CE(count_0),
        .CLR(p_0_in),
        .D(\count[3]_i_1_n_0 ),
        .Q(count[3]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.C(CLK),
        .CE(count_0),
        .CLR(p_0_in),
        .D(\count[4]_i_1_n_0 ),
        .Q(count[4]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[5] 
       (.C(CLK),
        .CE(count_0),
        .CLR(p_0_in),
        .D(\count[5]_i_1_n_0 ),
        .Q(count[5]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[6] 
       (.C(CLK),
        .CE(count_0),
        .CLR(p_0_in),
        .D(\count[6]_i_1_n_0 ),
        .Q(count[6]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[7] 
       (.C(CLK),
        .CE(count_0),
        .CLR(p_0_in),
        .D(\count[7]_i_2_n_0 ),
        .Q(count[7]));
  LUT3 #(
    .INIT(8'hF8)) 
    done_i_1
       (.I0(\FSM_onehot_state_reg[2]_0 ),
        .I1(wire_valid_out_core),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .O(done_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    done_reg
       (.C(CLK),
        .CE(done_i_1_n_0),
        .CLR(p_0_in),
        .D(done_reg_0),
        .Q(done_OBUF));
  CARRY4 last_mac_in0_carry
       (.CI(1'b0),
        .CO({last_mac_in0_carry_n_0,NLW_last_mac_in0_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_last_mac_in0_carry_O_UNCONNECTED[3:0]),
        .S({last_mac_in0_carry_i_1_n_0,last_mac_in0_carry_i_2_n_0,last_mac_in0_carry_i_3_n_0,last_mac_in0_carry_i_4_n_0}));
  CARRY4 last_mac_in0_carry__0
       (.CI(last_mac_in0_carry_n_0),
        .CO({last_mac_in0_carry__0_n_0,NLW_last_mac_in0_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_last_mac_in0_carry__0_O_UNCONNECTED[3:0]),
        .S({last_mac_in0_carry__0_i_1_n_0,last_mac_in0_carry__0_i_2_n_0,last_mac_in0_carry__0_i_3_n_0,last_mac_in0_carry__0_i_4_n_0}));
  LUT3 #(
    .INIT(8'hFE)) 
    last_mac_in0_carry__0_i_1
       (.I0(N_IBUF[7]),
        .I1(N_IBUF[6]),
        .I2(last_mac_in0_carry_i_5_n_0),
        .O(last_mac_in0_carry__0_i_1_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    last_mac_in0_carry__0_i_2
       (.I0(N_IBUF[7]),
        .I1(N_IBUF[6]),
        .I2(last_mac_in0_carry_i_5_n_0),
        .O(last_mac_in0_carry__0_i_2_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    last_mac_in0_carry__0_i_3
       (.I0(N_IBUF[7]),
        .I1(N_IBUF[6]),
        .I2(last_mac_in0_carry_i_5_n_0),
        .O(last_mac_in0_carry__0_i_3_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    last_mac_in0_carry__0_i_4
       (.I0(N_IBUF[7]),
        .I1(N_IBUF[6]),
        .I2(last_mac_in0_carry_i_5_n_0),
        .O(last_mac_in0_carry__0_i_4_n_0));
  CARRY4 last_mac_in0_carry__1
       (.CI(last_mac_in0_carry__0_n_0),
        .CO({NLW_last_mac_in0_carry__1_CO_UNCONNECTED[3],last_mac_in00_in,NLW_last_mac_in0_carry__1_CO_UNCONNECTED[1:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_last_mac_in0_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,last_mac_in0_carry__1_i_1_n_0,last_mac_in0_carry__1_i_2_n_0,last_mac_in0_carry__1_i_3_n_0}));
  LUT3 #(
    .INIT(8'hFE)) 
    last_mac_in0_carry__1_i_1
       (.I0(N_IBUF[7]),
        .I1(N_IBUF[6]),
        .I2(last_mac_in0_carry_i_5_n_0),
        .O(last_mac_in0_carry__1_i_1_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    last_mac_in0_carry__1_i_2
       (.I0(N_IBUF[7]),
        .I1(N_IBUF[6]),
        .I2(last_mac_in0_carry_i_5_n_0),
        .O(last_mac_in0_carry__1_i_2_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    last_mac_in0_carry__1_i_3
       (.I0(N_IBUF[7]),
        .I1(N_IBUF[6]),
        .I2(last_mac_in0_carry_i_5_n_0),
        .O(last_mac_in0_carry__1_i_3_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    last_mac_in0_carry_i_1
       (.I0(N_IBUF[7]),
        .I1(N_IBUF[6]),
        .I2(last_mac_in0_carry_i_5_n_0),
        .O(last_mac_in0_carry_i_1_n_0));
  LUT5 #(
    .INIT(32'h92040092)) 
    last_mac_in0_carry_i_2
       (.I0(last_mac_in0_carry_i_5_n_0),
        .I1(count[6]),
        .I2(N_IBUF[6]),
        .I3(count[7]),
        .I4(N_IBUF[7]),
        .O(last_mac_in0_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h9000009020400420)) 
    last_mac_in0_carry_i_3
       (.I0(last_mac_in0_carry_i_6_n_0),
        .I1(count[3]),
        .I2(next_state0_carry_i_7_n_0),
        .I3(count[4]),
        .I4(N_IBUF[4]),
        .I5(N_IBUF[3]),
        .O(last_mac_in0_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h0082004128001400)) 
    last_mac_in0_carry_i_4
       (.I0(N_IBUF[0]),
        .I1(N_IBUF[2]),
        .I2(count[2]),
        .I3(count[1]),
        .I4(count[0]),
        .I5(N_IBUF[1]),
        .O(last_mac_in0_carry_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    last_mac_in0_carry_i_5
       (.I0(N_IBUF[5]),
        .I1(N_IBUF[3]),
        .I2(N_IBUF[4]),
        .I3(N_IBUF[2]),
        .I4(N_IBUF[1]),
        .O(last_mac_in0_carry_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'hE)) 
    last_mac_in0_carry_i_6
       (.I0(N_IBUF[1]),
        .I1(N_IBUF[2]),
        .O(last_mac_in0_carry_i_6_n_0));
  LUT6 #(
    .INIT(64'hAAEABBFFAAEA88C0)) 
    last_mac_in_i_1
       (.I0(last_mac_in_i_2_n_0),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(last_mac_in00_in),
        .I3(next_state0__10),
        .I4(last_mac_in_i_3_n_0),
        .I5(wire_last_mac_in),
        .O(last_mac_in_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000080)) 
    last_mac_in_i_2
       (.I0(start_IBUF),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(N_IBUF[0]),
        .I3(N_IBUF[7]),
        .I4(N_IBUF[6]),
        .I5(last_mac_in0_carry_i_5_n_0),
        .O(last_mac_in_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hE)) 
    last_mac_in_i_3
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_state_reg[2]_0 ),
        .O(last_mac_in_i_3_n_0));
  FDCE #(
    .INIT(1'b0)) 
    last_mac_in_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(last_mac_in_i_1_n_0),
        .Q(wire_last_mac_in));
  CARRY4 next_state0_carry
       (.CI(1'b0),
        .CO({next_state0_carry_n_0,NLW_next_state0_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_next_state0_carry_O_UNCONNECTED[3:0]),
        .S({next_state0_carry_i_1_n_0,next_state0_carry_i_2_n_0,next_state0_carry_i_3_n_0,next_state0_carry_i_4_n_0}));
  CARRY4 next_state0_carry__0
       (.CI(next_state0_carry_n_0),
        .CO({next_state0_carry__0_n_0,NLW_next_state0_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_next_state0_carry__0_O_UNCONNECTED[3:0]),
        .S({next_state0_carry__0_i_1_n_0,next_state0_carry__0_i_2_n_0,next_state0_carry__0_i_3_n_0,next_state0_carry__0_i_4_n_0}));
  LUT3 #(
    .INIT(8'hFE)) 
    next_state0_carry__0_i_1
       (.I0(N_IBUF[7]),
        .I1(N_IBUF[6]),
        .I2(next_state0_carry_i_5_n_0),
        .O(next_state0_carry__0_i_1_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    next_state0_carry__0_i_2
       (.I0(N_IBUF[7]),
        .I1(N_IBUF[6]),
        .I2(next_state0_carry_i_5_n_0),
        .O(next_state0_carry__0_i_2_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    next_state0_carry__0_i_3
       (.I0(N_IBUF[7]),
        .I1(N_IBUF[6]),
        .I2(next_state0_carry_i_5_n_0),
        .O(next_state0_carry__0_i_3_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    next_state0_carry__0_i_4
       (.I0(N_IBUF[7]),
        .I1(N_IBUF[6]),
        .I2(next_state0_carry_i_5_n_0),
        .O(next_state0_carry__0_i_4_n_0));
  CARRY4 next_state0_carry__1
       (.CI(next_state0_carry__0_n_0),
        .CO({NLW_next_state0_carry__1_CO_UNCONNECTED[3],next_state0__10,NLW_next_state0_carry__1_CO_UNCONNECTED[1:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_next_state0_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,next_state0_carry__1_i_1_n_0,next_state0_carry__1_i_2_n_0,next_state0_carry__1_i_3_n_0}));
  LUT3 #(
    .INIT(8'hFE)) 
    next_state0_carry__1_i_1
       (.I0(N_IBUF[7]),
        .I1(N_IBUF[6]),
        .I2(next_state0_carry_i_5_n_0),
        .O(next_state0_carry__1_i_1_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    next_state0_carry__1_i_2
       (.I0(N_IBUF[7]),
        .I1(N_IBUF[6]),
        .I2(next_state0_carry_i_5_n_0),
        .O(next_state0_carry__1_i_2_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    next_state0_carry__1_i_3
       (.I0(N_IBUF[7]),
        .I1(N_IBUF[6]),
        .I2(next_state0_carry_i_5_n_0),
        .O(next_state0_carry__1_i_3_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    next_state0_carry_i_1
       (.I0(N_IBUF[7]),
        .I1(N_IBUF[6]),
        .I2(next_state0_carry_i_5_n_0),
        .O(next_state0_carry_i_1_n_0));
  LUT5 #(
    .INIT(32'h92040092)) 
    next_state0_carry_i_2
       (.I0(next_state0_carry_i_5_n_0),
        .I1(count[6]),
        .I2(N_IBUF[6]),
        .I3(count[7]),
        .I4(N_IBUF[7]),
        .O(next_state0_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h9000009020400420)) 
    next_state0_carry_i_3
       (.I0(next_state0_carry_i_6_n_0),
        .I1(count[3]),
        .I2(next_state0_carry_i_7_n_0),
        .I3(count[4]),
        .I4(N_IBUF[4]),
        .I5(N_IBUF[3]),
        .O(next_state0_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h0041820014000082)) 
    next_state0_carry_i_4
       (.I0(N_IBUF[0]),
        .I1(N_IBUF[2]),
        .I2(count[2]),
        .I3(count[1]),
        .I4(count[0]),
        .I5(N_IBUF[1]),
        .O(next_state0_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    next_state0_carry_i_5
       (.I0(N_IBUF[5]),
        .I1(N_IBUF[3]),
        .I2(N_IBUF[4]),
        .I3(N_IBUF[0]),
        .I4(N_IBUF[1]),
        .I5(N_IBUF[2]),
        .O(next_state0_carry_i_5_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    next_state0_carry_i_6
       (.I0(N_IBUF[2]),
        .I1(N_IBUF[1]),
        .I2(N_IBUF[0]),
        .O(next_state0_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    next_state0_carry_i_7
       (.I0(N_IBUF[5]),
        .I1(count[5]),
        .O(next_state0_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    p_reg_reg_i_1
       (.I0(rst_n_IBUF),
        .I1(wire_valid_in),
        .O(CEA2));
  LUT6 #(
    .INIT(64'hDDCC550FDDCC5500)) 
    valid_in_i_1
       (.I0(next_state0__10),
        .I1(start_IBUF),
        .I2(\FSM_onehot_state_reg[2]_0 ),
        .I3(\FSM_onehot_state_reg_n_0_[1] ),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .I5(wire_valid_in),
        .O(valid_in_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    valid_in_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(valid_in_i_1_n_0),
        .Q(wire_valid_in));
endmodule

module mac_core
   (SR,
    wire_valid_out_core,
    valid_out_reg_0,
    Q,
    wire_last_mac_in,
    CLK,
    wire_valid_in,
    wire_clear_acc,
    done_reg,
    rst_n_IBUF,
    CEA2,
    B,
    A);
  output [0:0]SR;
  output wire_valid_out_core;
  output valid_out_reg_0;
  output [31:0]Q;
  input wire_last_mac_in;
  input CLK;
  input wire_valid_in;
  input wire_clear_acc;
  input done_reg;
  input rst_n_IBUF;
  input [0:0]CEA2;
  input [7:0]B;
  input [7:0]A;

  wire [7:0]A;
  wire [7:0]B;
  wire [0:0]CEA2;
  wire CLK;
  wire [31:0]Q;
  wire [0:0]SR;
  wire c_reg1;
  wire c_reg2;
  wire done_reg;
  wire l_reg1;
  wire l_reg2;
  wire l_reg3;
  wire [0:0]m_reg;
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
  wire \psum_out[31]_i_1_n_0 ;
  wire rst_n_IBUF;
  wire v_reg1;
  wire v_reg2;
  wire v_reg3;
  wire valid_out_reg_0;
  wire wire_clear_acc;
  wire wire_last_mac_in;
  wire wire_valid_in;
  wire wire_valid_out_core;
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

  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_state[2]_i_2 
       (.I0(rst_n_IBUF),
        .O(SR));
  FDRE #(
    .INIT(1'b0)) 
    c_reg1_reg
       (.C(CLK),
        .CE(1'b1),
        .D(wire_clear_acc),
        .Q(c_reg1),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    c_reg2_reg
       (.C(CLK),
        .CE(1'b1),
        .D(c_reg1),
        .Q(c_reg2),
        .R(SR));
  LUT2 #(
    .INIT(4'h8)) 
    done_i_2
       (.I0(wire_valid_out_core),
        .I1(done_reg),
        .O(valid_out_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    l_reg1_reg
       (.C(CLK),
        .CE(1'b1),
        .D(wire_last_mac_in),
        .Q(l_reg1),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    l_reg2_reg
       (.C(CLK),
        .CE(1'b1),
        .D(l_reg1),
        .Q(l_reg2),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    l_reg3_reg
       (.C(CLK),
        .CE(1'b1),
        .D(l_reg2),
        .Q(l_reg3),
        .R(SR));
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
       (.A({A[7],A[7],A[7],A[7],A[7],A[7],A[7],A[7],A[7],A[7],A[7],A[7],A[7],A[7],A[7],A[7],A[7],A[7],A[7],A[7],A[7],A[7],A}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_p_reg_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({B[7],B[7],B[7],B[7],B[7],B[7],B[7],B[7],B[7],B[7],B}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_p_reg_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_p_reg_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_p_reg_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(CEA2),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(CEA2),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(m_reg),
        .CEP(p_reg),
        .CLK(CLK),
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
    p_reg_reg_i_2
       (.I0(rst_n_IBUF),
        .I1(v_reg1),
        .O(m_reg));
  LUT2 #(
    .INIT(4'h8)) 
    p_reg_reg_i_3
       (.I0(rst_n_IBUF),
        .I1(v_reg2),
        .O(p_reg));
  LUT2 #(
    .INIT(4'h8)) 
    \psum_out[31]_i_1 
       (.I0(v_reg3),
        .I1(l_reg3),
        .O(\psum_out[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[0] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_105),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[10] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_95),
        .Q(Q[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[11] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_94),
        .Q(Q[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[12] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_93),
        .Q(Q[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[13] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_92),
        .Q(Q[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[14] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_91),
        .Q(Q[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[15] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_90),
        .Q(Q[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[16] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_89),
        .Q(Q[16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[17] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_88),
        .Q(Q[17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[18] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_87),
        .Q(Q[18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[19] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_86),
        .Q(Q[19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[1] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_104),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[20] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_85),
        .Q(Q[20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[21] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_84),
        .Q(Q[21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[22] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_83),
        .Q(Q[22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[23] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_82),
        .Q(Q[23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[24] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_81),
        .Q(Q[24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[25] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_80),
        .Q(Q[25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[26] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_79),
        .Q(Q[26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[27] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_78),
        .Q(Q[27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[28] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_77),
        .Q(Q[28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[29] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_76),
        .Q(Q[29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[2] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_103),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[30] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_75),
        .Q(Q[30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[31] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_74),
        .Q(Q[31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[3] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_102),
        .Q(Q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[4] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_101),
        .Q(Q[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[5] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_100),
        .Q(Q[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[6] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_99),
        .Q(Q[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[7] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_98),
        .Q(Q[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[8] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_97),
        .Q(Q[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \psum_out_reg[9] 
       (.C(CLK),
        .CE(\psum_out[31]_i_1_n_0 ),
        .D(p_reg_reg_n_96),
        .Q(Q[9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    v_reg1_reg
       (.C(CLK),
        .CE(1'b1),
        .D(wire_valid_in),
        .Q(v_reg1),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    v_reg2_reg
       (.C(CLK),
        .CE(1'b1),
        .D(v_reg1),
        .Q(v_reg2),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    v_reg3_reg
       (.C(CLK),
        .CE(1'b1),
        .D(v_reg2),
        .Q(v_reg3),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    valid_out_reg
       (.C(CLK),
        .CE(1'b1),
        .D(\psum_out[31]_i_1_n_0 ),
        .Q(wire_valid_out_core),
        .R(SR));
endmodule

(* ECO_CHECKSUM = "510f7e77" *) 
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
  wire [0:0]a_reg;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire done;
  wire done_OBUF;
  wire p_0_in;
  wire [31:0]psum_out;
  wire [31:0]psum_out_OBUF;
  wire rst_n;
  wire rst_n_IBUF;
  wire start;
  wire start_IBUF;
  wire u_controller_n_4;
  wire u_core_n_2;
  wire [7:0]w_in;
  wire [7:0]w_in_IBUF;
  wire wire_clear_acc;
  wire wire_last_mac_in;
  wire wire_valid_in;
  wire wire_valid_out_core;
  wire [7:0]x_in;
  wire [7:0]x_in_IBUF;

initial begin
 $sdf_annotate("tb_mac_engine_time_impl.sdf",,,,"tool_control");
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
  mac_controller u_controller
       (.CEA2(a_reg),
        .CLK(clk_IBUF_BUFG),
        .\FSM_onehot_state_reg[2]_0 (u_controller_n_4),
        .N_IBUF(N_IBUF),
        .done_OBUF(done_OBUF),
        .done_reg_0(u_core_n_2),
        .p_0_in(p_0_in),
        .rst_n_IBUF(rst_n_IBUF),
        .start_IBUF(start_IBUF),
        .wire_clear_acc(wire_clear_acc),
        .wire_last_mac_in(wire_last_mac_in),
        .wire_valid_in(wire_valid_in),
        .wire_valid_out_core(wire_valid_out_core));
  mac_core u_core
       (.A(w_in_IBUF),
        .B(x_in_IBUF),
        .CEA2(a_reg),
        .CLK(clk_IBUF_BUFG),
        .Q(psum_out_OBUF),
        .SR(p_0_in),
        .done_reg(u_controller_n_4),
        .rst_n_IBUF(rst_n_IBUF),
        .valid_out_reg_0(u_core_n_2),
        .wire_clear_acc(wire_clear_acc),
        .wire_last_mac_in(wire_last_mac_in),
        .wire_valid_in(wire_valid_in),
        .wire_valid_out_core(wire_valid_out_core));
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
