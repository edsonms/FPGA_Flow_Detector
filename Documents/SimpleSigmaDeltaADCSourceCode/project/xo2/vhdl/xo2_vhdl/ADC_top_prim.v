// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.11.2.446
// Netlist written on Sat Aug 22 19:02:11 2020
//
// Verilog Description of module ADC_top
//

module ADC_top (clk_in, rstn, analog_cmp, analog_out, sample_rdy, 
            digital_out);   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(66[8:15])
    input clk_in;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(77[3:9])
    input rstn;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(78[3:7])
    input analog_cmp;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(79[3:13])
    output analog_out;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(82[9:19])
    output sample_rdy;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(83[9:19])
    output [11:0]digital_out;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(84[9:20])
    
    wire clk_in_c /* synthesis SET_AS_NETWORK=clk_in_c, is_clock=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(77[3:9])
    
    wire rstn_c, analog_cmp_c, analog_out_c, sample_rdy_c, digital_out_c_11, 
        digital_out_c_10, digital_out_c_9, digital_out_c_8, digital_out_c_7, 
        digital_out_c_6, digital_out_c_5, digital_out_c_4, digital_out_c_3, 
        digital_out_c_2, digital_out_c_1, digital_out_c_0, GND_net, 
        VCC_net;
    
    GSR GSR_INST (.GSR(rstn_c));
    OB digital_out_pad_11 (.I(digital_out_c_11), .O(digital_out[11]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(84[9:20])
    OB sample_rdy_pad (.I(sample_rdy_c), .O(sample_rdy));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(83[9:19])
    OB analog_out_pad (.I(analog_out_c), .O(analog_out));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(82[9:19])
    OB digital_out_pad_10 (.I(digital_out_c_10), .O(digital_out[10]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(84[9:20])
    VHI i227 (.Z(VCC_net));
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    VLO i1 (.Z(GND_net));
    TSALL TSALL_INST (.TSALL(GND_net));
    OB digital_out_pad_9 (.I(digital_out_c_9), .O(digital_out[9]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(84[9:20])
    OB digital_out_pad_8 (.I(digital_out_c_8), .O(digital_out[8]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(84[9:20])
    OB digital_out_pad_7 (.I(digital_out_c_7), .O(digital_out[7]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(84[9:20])
    OB digital_out_pad_6 (.I(digital_out_c_6), .O(digital_out[6]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(84[9:20])
    OB digital_out_pad_5 (.I(digital_out_c_5), .O(digital_out[5]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(84[9:20])
    OB digital_out_pad_4 (.I(digital_out_c_4), .O(digital_out[4]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(84[9:20])
    OB digital_out_pad_3 (.I(digital_out_c_3), .O(digital_out[3]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(84[9:20])
    OB digital_out_pad_2 (.I(digital_out_c_2), .O(digital_out[2]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(84[9:20])
    OB digital_out_pad_1 (.I(digital_out_c_1), .O(digital_out[1]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(84[9:20])
    OB digital_out_pad_0 (.I(digital_out_c_0), .O(digital_out[0]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(84[9:20])
    IB clk_in_pad (.I(clk_in), .O(clk_in_c));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(77[3:9])
    IB rstn_pad (.I(rstn), .O(rstn_c));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(78[3:7])
    IB analog_cmp_pad (.I(analog_cmp), .O(analog_cmp_c));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(79[3:13])
    \sigmadelta_adc(12,13,3)  SSD_ADC (.clk_in_c(clk_in_c), .analog_out_c(analog_out_c), 
            .analog_cmp_c(analog_cmp_c), .GND_net(GND_net), .sample_rdy_c(sample_rdy_c), 
            .digital_out_c_0(digital_out_c_0), .digital_out_c_11(digital_out_c_11), 
            .digital_out_c_10(digital_out_c_10), .digital_out_c_9(digital_out_c_9), 
            .digital_out_c_8(digital_out_c_8), .digital_out_c_7(digital_out_c_7), 
            .digital_out_c_6(digital_out_c_6), .digital_out_c_5(digital_out_c_5), 
            .digital_out_c_4(digital_out_c_4), .digital_out_c_3(digital_out_c_3), 
            .digital_out_c_2(digital_out_c_2), .digital_out_c_1(digital_out_c_1));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(142[10:24])
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

//
// Verilog Description of module TSALL
// module not written out since it is a black-box. 
//

//
// Verilog Description of module \sigmadelta_adc(12,13,3) 
//

module \sigmadelta_adc(12,13,3)  (clk_in_c, analog_out_c, analog_cmp_c, 
            GND_net, sample_rdy_c, digital_out_c_0, digital_out_c_11, 
            digital_out_c_10, digital_out_c_9, digital_out_c_8, digital_out_c_7, 
            digital_out_c_6, digital_out_c_5, digital_out_c_4, digital_out_c_3, 
            digital_out_c_2, digital_out_c_1);
    input clk_in_c;
    output analog_out_c;
    input analog_cmp_c;
    input GND_net;
    output sample_rdy_c;
    output digital_out_c_0;
    output digital_out_c_11;
    output digital_out_c_10;
    output digital_out_c_9;
    output digital_out_c_8;
    output digital_out_c_7;
    output digital_out_c_6;
    output digital_out_c_5;
    output digital_out_c_4;
    output digital_out_c_3;
    output digital_out_c_2;
    output digital_out_c_1;
    
    wire clk_in_c /* synthesis SET_AS_NETWORK=clk_in_c, is_clock=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(77[3:9])
    wire [11:0]accum;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(125[13:18])
    
    wire rollover;
    wire [12:0]sigma;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(124[13:18])
    
    wire accum_rdy, rollover_N_54;
    wire [12:0]counter;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(126[13:20])
    
    wire n24, n20, n22, n268;
    wire [12:0]n57;
    
    wire n267, n266, n265, n264, n263, clk_in_c_enable_13;
    wire [12:0]n6;
    
    wire n254, n16, n251, n252, n253, n249, n250, clk_in_c_enable_12;
    wire [12:0]sigma_12__N_1;
    
    wire n24_adj_119, n20_adj_120, n22_adj_121, n16_adj_122;
    
    FD1P3AX accum_i0_i0 (.D(sigma[1]), .SP(rollover), .CK(clk_in_c), .Q(accum[0])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam accum_i0_i0.GSR = "ENABLED";
    FD1S3AX accum_rdy_22 (.D(rollover), .CK(clk_in_c), .Q(accum_rdy)) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam accum_rdy_22.GSR = "ENABLED";
    FD1S3AX rollover_24 (.D(rollover_N_54), .CK(clk_in_c), .Q(rollover)) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(211[5] 221[9])
    defparam rollover_24.GSR = "ENABLED";
    FD1S3AX delta_19 (.D(analog_cmp_c), .CK(clk_in_c), .Q(analog_out_c)) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(143[5] 145[12])
    defparam delta_19.GSR = "DISABLED";
    LUT4 i12_4_lut (.A(counter[7]), .B(n24), .C(n20), .D(counter[6]), 
         .Z(rollover_N_54)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i12_4_lut.init = 16'h8000;
    LUT4 i9_4_lut (.A(counter[1]), .B(counter[11]), .C(counter[0]), .D(counter[2]), 
         .Z(n22)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i9_4_lut.init = 16'h8000;
    CCU2D counter_34_add_4_13 (.A0(counter[11]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[12]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n268), .S0(n57[11]), .S1(n57[12]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34_add_4_13.INIT0 = 16'hfaaa;
    defparam counter_34_add_4_13.INIT1 = 16'hfaaa;
    defparam counter_34_add_4_13.INJECT1_0 = "NO";
    defparam counter_34_add_4_13.INJECT1_1 = "NO";
    CCU2D counter_34_add_4_11 (.A0(counter[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[10]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n267), .COUT(n268), .S0(n57[9]), .S1(n57[10]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34_add_4_11.INIT0 = 16'hfaaa;
    defparam counter_34_add_4_11.INIT1 = 16'hfaaa;
    defparam counter_34_add_4_11.INJECT1_0 = "NO";
    defparam counter_34_add_4_11.INJECT1_1 = "NO";
    CCU2D counter_34_add_4_9 (.A0(counter[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[8]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n266), .COUT(n267), .S0(n57[7]), .S1(n57[8]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34_add_4_9.INIT0 = 16'hfaaa;
    defparam counter_34_add_4_9.INIT1 = 16'hfaaa;
    defparam counter_34_add_4_9.INJECT1_0 = "NO";
    defparam counter_34_add_4_9.INJECT1_1 = "NO";
    CCU2D counter_34_add_4_7 (.A0(counter[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n265), .COUT(n266), .S0(n57[5]), .S1(n57[6]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34_add_4_7.INIT0 = 16'hfaaa;
    defparam counter_34_add_4_7.INIT1 = 16'hfaaa;
    defparam counter_34_add_4_7.INJECT1_0 = "NO";
    defparam counter_34_add_4_7.INJECT1_1 = "NO";
    CCU2D counter_34_add_4_5 (.A0(counter[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n264), .COUT(n265), .S0(n57[3]), .S1(n57[4]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34_add_4_5.INIT0 = 16'hfaaa;
    defparam counter_34_add_4_5.INIT1 = 16'hfaaa;
    defparam counter_34_add_4_5.INJECT1_0 = "NO";
    defparam counter_34_add_4_5.INJECT1_1 = "NO";
    CCU2D counter_34_add_4_3 (.A0(counter[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[2]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n263), .COUT(n264), .S0(n57[1]), .S1(n57[2]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34_add_4_3.INIT0 = 16'hfaaa;
    defparam counter_34_add_4_3.INIT1 = 16'hfaaa;
    defparam counter_34_add_4_3.INJECT1_0 = "NO";
    defparam counter_34_add_4_3.INJECT1_1 = "NO";
    CCU2D counter_34_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[0]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .COUT(n263), .S1(n57[0]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34_add_4_1.INIT0 = 16'hF000;
    defparam counter_34_add_4_1.INIT1 = 16'h0555;
    defparam counter_34_add_4_1.INJECT1_0 = "NO";
    defparam counter_34_add_4_1.INJECT1_1 = "NO";
    FD1P3IX sigma_i11 (.D(n6[11]), .SP(clk_in_c_enable_13), .CD(rollover), 
            .CK(clk_in_c), .Q(sigma[11])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam sigma_i11.GSR = "ENABLED";
    CCU2D add_6_14 (.A0(sigma[12]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n254), 
          .S0(n6[12]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(171[26:31])
    defparam add_6_14.INIT0 = 16'h5aaa;
    defparam add_6_14.INIT1 = 16'h0000;
    defparam add_6_14.INJECT1_0 = "NO";
    defparam add_6_14.INJECT1_1 = "NO";
    LUT4 i3_2_lut (.A(counter[4]), .B(counter[9]), .Z(n16)) /* synthesis lut_function=(A (B)) */ ;
    defparam i3_2_lut.init = 16'h8888;
    CCU2D add_6_8 (.A0(sigma[6]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(sigma[7]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n251), 
          .COUT(n252), .S0(n6[6]), .S1(n6[7]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(171[26:31])
    defparam add_6_8.INIT0 = 16'h5aaa;
    defparam add_6_8.INIT1 = 16'h5aaa;
    defparam add_6_8.INJECT1_0 = "NO";
    defparam add_6_8.INJECT1_1 = "NO";
    CCU2D add_6_10 (.A0(sigma[8]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(sigma[9]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n252), 
          .COUT(n253), .S0(n6[8]), .S1(n6[9]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(171[26:31])
    defparam add_6_10.INIT0 = 16'h5aaa;
    defparam add_6_10.INIT1 = 16'h5aaa;
    defparam add_6_10.INJECT1_0 = "NO";
    defparam add_6_10.INJECT1_1 = "NO";
    CCU2D add_6_2 (.A0(sigma[0]), .B0(analog_out_c), .C0(GND_net), .D0(GND_net), 
          .A1(sigma[1]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n249), 
          .S1(n6[1]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(171[26:31])
    defparam add_6_2.INIT0 = 16'h7000;
    defparam add_6_2.INIT1 = 16'h5aaa;
    defparam add_6_2.INJECT1_0 = "NO";
    defparam add_6_2.INJECT1_1 = "NO";
    CCU2D add_6_12 (.A0(sigma[10]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(sigma[11]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n253), .COUT(n254), .S0(n6[10]), .S1(n6[11]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(171[26:31])
    defparam add_6_12.INIT0 = 16'h5aaa;
    defparam add_6_12.INIT1 = 16'h5aaa;
    defparam add_6_12.INJECT1_0 = "NO";
    defparam add_6_12.INJECT1_1 = "NO";
    CCU2D add_6_4 (.A0(sigma[2]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(sigma[3]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n249), 
          .COUT(n250), .S0(n6[2]), .S1(n6[3]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(171[26:31])
    defparam add_6_4.INIT0 = 16'h5aaa;
    defparam add_6_4.INIT1 = 16'h5aaa;
    defparam add_6_4.INJECT1_0 = "NO";
    defparam add_6_4.INJECT1_1 = "NO";
    FD1S3AX counter_34__i0 (.D(n57[0]), .CK(clk_in_c), .Q(counter[0])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34__i0.GSR = "ENABLED";
    FD1P3IX sigma_i10 (.D(n6[10]), .SP(clk_in_c_enable_13), .CD(rollover), 
            .CK(clk_in_c), .Q(sigma[10])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam sigma_i10.GSR = "ENABLED";
    LUT4 i11_4_lut (.A(counter[12]), .B(n22), .C(n16), .D(counter[5]), 
         .Z(n24)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i11_4_lut.init = 16'h8000;
    FD1P3IX sigma_i9 (.D(n6[9]), .SP(clk_in_c_enable_13), .CD(rollover), 
            .CK(clk_in_c), .Q(sigma[9])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam sigma_i9.GSR = "ENABLED";
    FD1P3IX sigma_i8 (.D(n6[8]), .SP(clk_in_c_enable_13), .CD(rollover), 
            .CK(clk_in_c), .Q(sigma[8])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam sigma_i8.GSR = "ENABLED";
    FD1P3IX sigma_i7 (.D(n6[7]), .SP(clk_in_c_enable_13), .CD(rollover), 
            .CK(clk_in_c), .Q(sigma[7])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam sigma_i7.GSR = "ENABLED";
    FD1P3IX sigma_i6 (.D(n6[6]), .SP(clk_in_c_enable_13), .CD(rollover), 
            .CK(clk_in_c), .Q(sigma[6])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam sigma_i6.GSR = "ENABLED";
    FD1P3IX sigma_i5 (.D(n6[5]), .SP(clk_in_c_enable_13), .CD(rollover), 
            .CK(clk_in_c), .Q(sigma[5])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam sigma_i5.GSR = "ENABLED";
    FD1P3IX sigma_i4 (.D(n6[4]), .SP(clk_in_c_enable_13), .CD(rollover), 
            .CK(clk_in_c), .Q(sigma[4])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam sigma_i4.GSR = "ENABLED";
    FD1P3IX sigma_i3 (.D(n6[3]), .SP(clk_in_c_enable_13), .CD(rollover), 
            .CK(clk_in_c), .Q(sigma[3])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam sigma_i3.GSR = "ENABLED";
    FD1P3IX sigma_i2 (.D(n6[2]), .SP(clk_in_c_enable_13), .CD(rollover), 
            .CK(clk_in_c), .Q(sigma[2])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam sigma_i2.GSR = "ENABLED";
    FD1P3IX sigma_i1 (.D(n6[1]), .SP(clk_in_c_enable_13), .CD(rollover), 
            .CK(clk_in_c), .Q(sigma[1])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam sigma_i1.GSR = "ENABLED";
    FD1P3AX sigma_i0 (.D(sigma_12__N_1[0]), .SP(clk_in_c_enable_12), .CK(clk_in_c), 
            .Q(sigma[0])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam sigma_i0.GSR = "ENABLED";
    FD1P3AX accum_i0_i11 (.D(sigma[12]), .SP(rollover), .CK(clk_in_c), 
            .Q(accum[11])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam accum_i0_i11.GSR = "ENABLED";
    FD1P3AX accum_i0_i10 (.D(sigma[11]), .SP(rollover), .CK(clk_in_c), 
            .Q(accum[10])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam accum_i0_i10.GSR = "ENABLED";
    FD1P3AX accum_i0_i9 (.D(sigma[10]), .SP(rollover), .CK(clk_in_c), 
            .Q(accum[9])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam accum_i0_i9.GSR = "ENABLED";
    FD1P3AX accum_i0_i8 (.D(sigma[9]), .SP(rollover), .CK(clk_in_c), .Q(accum[8])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam accum_i0_i8.GSR = "ENABLED";
    FD1P3AX accum_i0_i7 (.D(sigma[8]), .SP(rollover), .CK(clk_in_c), .Q(accum[7])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam accum_i0_i7.GSR = "ENABLED";
    FD1P3AX accum_i0_i6 (.D(sigma[7]), .SP(rollover), .CK(clk_in_c), .Q(accum[6])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam accum_i0_i6.GSR = "ENABLED";
    FD1P3AX accum_i0_i5 (.D(sigma[6]), .SP(rollover), .CK(clk_in_c), .Q(accum[5])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam accum_i0_i5.GSR = "ENABLED";
    FD1P3AX accum_i0_i4 (.D(sigma[5]), .SP(rollover), .CK(clk_in_c), .Q(accum[4])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam accum_i0_i4.GSR = "ENABLED";
    FD1P3AX accum_i0_i3 (.D(sigma[4]), .SP(rollover), .CK(clk_in_c), .Q(accum[3])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam accum_i0_i3.GSR = "ENABLED";
    FD1P3AX accum_i0_i2 (.D(sigma[3]), .SP(rollover), .CK(clk_in_c), .Q(accum[2])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam accum_i0_i2.GSR = "ENABLED";
    FD1P3AX accum_i0_i1 (.D(sigma[2]), .SP(rollover), .CK(clk_in_c), .Q(accum[1])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam accum_i0_i1.GSR = "ENABLED";
    FD1P3IX sigma_i12 (.D(n6[12]), .SP(clk_in_c_enable_13), .CD(rollover), 
            .CK(clk_in_c), .Q(sigma[12])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=24, LSE_LLINE=142, LSE_RLINE=142 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(159[5] 175[12])
    defparam sigma_i12.GSR = "ENABLED";
    LUT4 i196_4_lut (.A(sigma[7]), .B(n24_adj_119), .C(n20_adj_120), .D(sigma[6]), 
         .Z(clk_in_c_enable_13)) /* synthesis lut_function=(!(A (B (C (D))))) */ ;
    defparam i196_4_lut.init = 16'h7fff;
    LUT4 i11_4_lut_adj_1 (.A(sigma[12]), .B(n22_adj_121), .C(n16_adj_122), 
         .D(sigma[5]), .Z(n24_adj_119)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i11_4_lut_adj_1.init = 16'h8000;
    LUT4 i7_3_lut (.A(sigma[10]), .B(sigma[8]), .C(sigma[3]), .Z(n20_adj_120)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i7_3_lut.init = 16'h8080;
    LUT4 i3_2_lut_adj_2 (.A(sigma[4]), .B(sigma[9]), .Z(n16_adj_122)) /* synthesis lut_function=(A (B)) */ ;
    defparam i3_2_lut_adj_2.init = 16'h8888;
    LUT4 i9_4_lut_adj_3 (.A(sigma[1]), .B(sigma[11]), .C(sigma[0]), .D(sigma[2]), 
         .Z(n22_adj_121)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i9_4_lut_adj_3.init = 16'h8000;
    LUT4 i1_2_lut (.A(clk_in_c_enable_13), .B(rollover), .Z(clk_in_c_enable_12)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut.init = 16'heeee;
    LUT4 sigma_12__I_0_i1_3_lut (.A(sigma[0]), .B(analog_out_c), .C(rollover), 
         .Z(sigma_12__N_1[0])) /* synthesis lut_function=(A (B (C)+!B !(C))+!A (B)) */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(164[9] 173[16])
    defparam sigma_12__I_0_i1_3_lut.init = 16'hc6c6;
    LUT4 i7_3_lut_adj_4 (.A(counter[10]), .B(counter[8]), .C(counter[3]), 
         .Z(n20)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i7_3_lut_adj_4.init = 16'h8080;
    FD1S3AX counter_34__i1 (.D(n57[1]), .CK(clk_in_c), .Q(counter[1])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34__i1.GSR = "ENABLED";
    FD1S3AX counter_34__i2 (.D(n57[2]), .CK(clk_in_c), .Q(counter[2])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34__i2.GSR = "ENABLED";
    FD1S3AX counter_34__i3 (.D(n57[3]), .CK(clk_in_c), .Q(counter[3])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34__i3.GSR = "ENABLED";
    FD1S3AX counter_34__i4 (.D(n57[4]), .CK(clk_in_c), .Q(counter[4])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34__i4.GSR = "ENABLED";
    FD1S3AX counter_34__i5 (.D(n57[5]), .CK(clk_in_c), .Q(counter[5])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34__i5.GSR = "ENABLED";
    FD1S3AX counter_34__i6 (.D(n57[6]), .CK(clk_in_c), .Q(counter[6])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34__i6.GSR = "ENABLED";
    FD1S3AX counter_34__i7 (.D(n57[7]), .CK(clk_in_c), .Q(counter[7])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34__i7.GSR = "ENABLED";
    FD1S3AX counter_34__i8 (.D(n57[8]), .CK(clk_in_c), .Q(counter[8])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34__i8.GSR = "ENABLED";
    FD1S3AX counter_34__i9 (.D(n57[9]), .CK(clk_in_c), .Q(counter[9])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34__i9.GSR = "ENABLED";
    FD1S3AX counter_34__i10 (.D(n57[10]), .CK(clk_in_c), .Q(counter[10])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34__i10.GSR = "ENABLED";
    FD1S3AX counter_34__i11 (.D(n57[11]), .CK(clk_in_c), .Q(counter[11])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34__i11.GSR = "ENABLED";
    FD1S3AX counter_34__i12 (.D(n57[12]), .CK(clk_in_c), .Q(counter[12])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(215[14:21])
    defparam counter_34__i12.GSR = "ENABLED";
    CCU2D add_6_6 (.A0(sigma[4]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(sigma[5]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n250), 
          .COUT(n251), .S0(n6[4]), .S1(n6[5]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(171[26:31])
    defparam add_6_6.INIT0 = 16'h5aaa;
    defparam add_6_6.INIT1 = 16'h5aaa;
    defparam add_6_6.INJECT1_0 = "NO";
    defparam add_6_6.INJECT1_1 = "NO";
    \box_ave(12,3)  BA_INST (.clk_in_c(clk_in_c), .accum({accum}), .sample_rdy_c(sample_rdy_c), 
            .digital_out_c_0(digital_out_c_0), .accum_rdy(accum_rdy), .GND_net(GND_net), 
            .digital_out_c_11(digital_out_c_11), .digital_out_c_10(digital_out_c_10), 
            .digital_out_c_9(digital_out_c_9), .digital_out_c_8(digital_out_c_8), 
            .digital_out_c_7(digital_out_c_7), .digital_out_c_6(digital_out_c_6), 
            .digital_out_c_5(digital_out_c_5), .digital_out_c_4(digital_out_c_4), 
            .digital_out_c_3(digital_out_c_3), .digital_out_c_2(digital_out_c_2), 
            .digital_out_c_1(digital_out_c_1));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/sigmadelta_adc.vhd(189[10:17])
    
endmodule
//
// Verilog Description of module \box_ave(12,3) 
//

module \box_ave(12,3)  (clk_in_c, accum, sample_rdy_c, digital_out_c_0, 
            accum_rdy, GND_net, digital_out_c_11, digital_out_c_10, 
            digital_out_c_9, digital_out_c_8, digital_out_c_7, digital_out_c_6, 
            digital_out_c_5, digital_out_c_4, digital_out_c_3, digital_out_c_2, 
            digital_out_c_1);
    input clk_in_c;
    input [11:0]accum;
    output sample_rdy_c;
    output digital_out_c_0;
    input accum_rdy;
    input GND_net;
    output digital_out_c_11;
    output digital_out_c_10;
    output digital_out_c_9;
    output digital_out_c_8;
    output digital_out_c_7;
    output digital_out_c_6;
    output digital_out_c_5;
    output digital_out_c_4;
    output digital_out_c_3;
    output digital_out_c_2;
    output digital_out_c_1;
    
    wire clk_in_c /* synthesis SET_AS_NETWORK=clk_in_c, is_clock=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/adc_top.vhd(77[3:9])
    
    wire sample_d1, sample_d2, accumulate;
    wire [11:0]raw_data_d1;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(110[8:19])
    
    wire latch_result;
    wire [14:0]accum_adj_117;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(108[8:13])
    
    wire n261;
    wire [2:0]count;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(109[8:13])
    wire [14:0]n65;
    
    wire n260, n4, n259, n258, n257, n256, n255;
    wire [14:0]n114;
    
    wire n284;
    wire [2:0]n17;
    
    LUT4 sample_d1_I_0_2_lut (.A(sample_d1), .B(sample_d2), .Z(accumulate)) /* synthesis lut_function=(!((B)+!A)) */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(141[19:46])
    defparam sample_d1_I_0_2_lut.init = 16'h2222;
    FD1S3AX raw_data_d1_i0 (.D(accum[0]), .CK(clk_in_c), .Q(raw_data_d1[0])) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(127[5] 137[9])
    defparam raw_data_d1_i0.GSR = "ENABLED";
    FD1S3AX sample_d2_27 (.D(sample_d1), .CK(clk_in_c), .Q(sample_d2)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(127[5] 137[9])
    defparam sample_d2_27.GSR = "ENABLED";
    FD1S3AX result_valid_29 (.D(latch_result), .CK(clk_in_c), .Q(sample_rdy_c)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(127[5] 137[9])
    defparam result_valid_29.GSR = "ENABLED";
    FD1P3AX ave_data_out_i0_i1 (.D(accum_adj_117[3]), .SP(latch_result), 
            .CK(clk_in_c), .Q(digital_out_c_0)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(194[5] 200[12])
    defparam ave_data_out_i0_i1.GSR = "ENABLED";
    FD1S3AX sample_d1_26 (.D(accum_rdy), .CK(clk_in_c), .Q(sample_d1)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(127[5] 137[9])
    defparam sample_d1_26.GSR = "ENABLED";
    CCU2D accum_35_add_4_15 (.A0(count[1]), .B0(count[0]), .C0(count[2]), 
          .D0(accum_adj_117[13]), .A1(count[1]), .B1(count[0]), .C1(count[2]), 
          .D1(accum_adj_117[14]), .CIN(n261), .S0(n65[13]), .S1(n65[14]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35_add_4_15.INIT0 = 16'hfe00;
    defparam accum_35_add_4_15.INIT1 = 16'hfe00;
    defparam accum_35_add_4_15.INJECT1_0 = "NO";
    defparam accum_35_add_4_15.INJECT1_1 = "NO";
    CCU2D accum_35_add_4_13 (.A0(raw_data_d1[11]), .B0(n4), .C0(count[2]), 
          .D0(accum_adj_117[11]), .A1(count[1]), .B1(count[0]), .C1(count[2]), 
          .D1(accum_adj_117[12]), .CIN(n260), .COUT(n261), .S0(n65[11]), 
          .S1(n65[12]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35_add_4_13.INIT0 = 16'h56aa;
    defparam accum_35_add_4_13.INIT1 = 16'hfe00;
    defparam accum_35_add_4_13.INJECT1_0 = "NO";
    defparam accum_35_add_4_13.INJECT1_1 = "NO";
    CCU2D accum_35_add_4_11 (.A0(raw_data_d1[9]), .B0(n4), .C0(count[2]), 
          .D0(accum_adj_117[9]), .A1(raw_data_d1[10]), .B1(n4), .C1(count[2]), 
          .D1(accum_adj_117[10]), .CIN(n259), .COUT(n260), .S0(n65[9]), 
          .S1(n65[10]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35_add_4_11.INIT0 = 16'h56aa;
    defparam accum_35_add_4_11.INIT1 = 16'h56aa;
    defparam accum_35_add_4_11.INJECT1_0 = "NO";
    defparam accum_35_add_4_11.INJECT1_1 = "NO";
    CCU2D accum_35_add_4_9 (.A0(raw_data_d1[7]), .B0(n4), .C0(count[2]), 
          .D0(accum_adj_117[7]), .A1(raw_data_d1[8]), .B1(n4), .C1(count[2]), 
          .D1(accum_adj_117[8]), .CIN(n258), .COUT(n259), .S0(n65[7]), 
          .S1(n65[8]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35_add_4_9.INIT0 = 16'h56aa;
    defparam accum_35_add_4_9.INIT1 = 16'h56aa;
    defparam accum_35_add_4_9.INJECT1_0 = "NO";
    defparam accum_35_add_4_9.INJECT1_1 = "NO";
    CCU2D accum_35_add_4_7 (.A0(raw_data_d1[5]), .B0(n4), .C0(count[2]), 
          .D0(accum_adj_117[5]), .A1(raw_data_d1[6]), .B1(n4), .C1(count[2]), 
          .D1(accum_adj_117[6]), .CIN(n257), .COUT(n258), .S0(n65[5]), 
          .S1(n65[6]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35_add_4_7.INIT0 = 16'h56aa;
    defparam accum_35_add_4_7.INIT1 = 16'h56aa;
    defparam accum_35_add_4_7.INJECT1_0 = "NO";
    defparam accum_35_add_4_7.INJECT1_1 = "NO";
    CCU2D accum_35_add_4_5 (.A0(raw_data_d1[3]), .B0(n4), .C0(count[2]), 
          .D0(accum_adj_117[3]), .A1(raw_data_d1[4]), .B1(n4), .C1(count[2]), 
          .D1(accum_adj_117[4]), .CIN(n256), .COUT(n257), .S0(n65[3]), 
          .S1(n65[4]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35_add_4_5.INIT0 = 16'h56aa;
    defparam accum_35_add_4_5.INIT1 = 16'h56aa;
    defparam accum_35_add_4_5.INJECT1_0 = "NO";
    defparam accum_35_add_4_5.INJECT1_1 = "NO";
    CCU2D accum_35_add_4_3 (.A0(raw_data_d1[1]), .B0(n4), .C0(count[2]), 
          .D0(n114[1]), .A1(raw_data_d1[2]), .B1(n4), .C1(count[2]), 
          .D1(n114[2]), .CIN(n255), .COUT(n256), .S0(n65[1]), .S1(n65[2]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35_add_4_3.INIT0 = 16'h56aa;
    defparam accum_35_add_4_3.INIT1 = 16'h56aa;
    defparam accum_35_add_4_3.INJECT1_0 = "NO";
    defparam accum_35_add_4_3.INJECT1_1 = "NO";
    CCU2D accum_35_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(raw_data_d1[0]), .B1(n4), .C1(count[2]), 
          .D1(n114[0]), .COUT(n255), .S1(n65[0]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35_add_4_1.INIT0 = 16'hF000;
    defparam accum_35_add_4_1.INIT1 = 16'h56aa;
    defparam accum_35_add_4_1.INJECT1_0 = "NO";
    defparam accum_35_add_4_1.INJECT1_1 = "NO";
    LUT4 i3_4_lut (.A(sample_d1), .B(count[0]), .C(sample_d2), .D(n284), 
         .Z(latch_result)) /* synthesis lut_function=(!((B+(C+(D)))+!A)) */ ;
    defparam i3_4_lut.init = 16'h0002;
    FD1P3AX count_36__i0 (.D(n17[0]), .SP(accumulate), .CK(clk_in_c), 
            .Q(count[0]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(156[22:27])
    defparam count_36__i0.GSR = "ENABLED";
    FD1P3AX accum_35__i0 (.D(n65[0]), .SP(accumulate), .CK(clk_in_c), 
            .Q(n114[0])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35__i0.GSR = "ENABLED";
    FD1P3AX accum_35__i1 (.D(n65[1]), .SP(accumulate), .CK(clk_in_c), 
            .Q(n114[1])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35__i1.GSR = "ENABLED";
    FD1P3AX count_36__i2 (.D(n17[2]), .SP(accumulate), .CK(clk_in_c), 
            .Q(count[2]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(156[22:27])
    defparam count_36__i2.GSR = "ENABLED";
    LUT4 i160_2_lut (.A(count[1]), .B(count[0]), .Z(n17[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(156[22:27])
    defparam i160_2_lut.init = 16'h6666;
    FD1P3AX count_36__i1 (.D(n17[1]), .SP(accumulate), .CK(clk_in_c), 
            .Q(count[1]));   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(156[22:27])
    defparam count_36__i1.GSR = "ENABLED";
    FD1P3AX ave_data_out_i0_i12 (.D(accum_adj_117[14]), .SP(latch_result), 
            .CK(clk_in_c), .Q(digital_out_c_11)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(194[5] 200[12])
    defparam ave_data_out_i0_i12.GSR = "ENABLED";
    FD1P3AX ave_data_out_i0_i11 (.D(accum_adj_117[13]), .SP(latch_result), 
            .CK(clk_in_c), .Q(digital_out_c_10)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(194[5] 200[12])
    defparam ave_data_out_i0_i11.GSR = "ENABLED";
    FD1P3AX ave_data_out_i0_i10 (.D(accum_adj_117[12]), .SP(latch_result), 
            .CK(clk_in_c), .Q(digital_out_c_9)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(194[5] 200[12])
    defparam ave_data_out_i0_i10.GSR = "ENABLED";
    FD1P3AX ave_data_out_i0_i9 (.D(accum_adj_117[11]), .SP(latch_result), 
            .CK(clk_in_c), .Q(digital_out_c_8)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(194[5] 200[12])
    defparam ave_data_out_i0_i9.GSR = "ENABLED";
    FD1P3AX ave_data_out_i0_i8 (.D(accum_adj_117[10]), .SP(latch_result), 
            .CK(clk_in_c), .Q(digital_out_c_7)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(194[5] 200[12])
    defparam ave_data_out_i0_i8.GSR = "ENABLED";
    FD1P3AX ave_data_out_i0_i7 (.D(accum_adj_117[9]), .SP(latch_result), 
            .CK(clk_in_c), .Q(digital_out_c_6)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(194[5] 200[12])
    defparam ave_data_out_i0_i7.GSR = "ENABLED";
    FD1P3AX ave_data_out_i0_i6 (.D(accum_adj_117[8]), .SP(latch_result), 
            .CK(clk_in_c), .Q(digital_out_c_5)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(194[5] 200[12])
    defparam ave_data_out_i0_i6.GSR = "ENABLED";
    FD1P3AX ave_data_out_i0_i5 (.D(accum_adj_117[7]), .SP(latch_result), 
            .CK(clk_in_c), .Q(digital_out_c_4)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(194[5] 200[12])
    defparam ave_data_out_i0_i5.GSR = "ENABLED";
    FD1P3AX ave_data_out_i0_i4 (.D(accum_adj_117[6]), .SP(latch_result), 
            .CK(clk_in_c), .Q(digital_out_c_3)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(194[5] 200[12])
    defparam ave_data_out_i0_i4.GSR = "ENABLED";
    FD1P3AX ave_data_out_i0_i3 (.D(accum_adj_117[5]), .SP(latch_result), 
            .CK(clk_in_c), .Q(digital_out_c_2)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(194[5] 200[12])
    defparam ave_data_out_i0_i3.GSR = "ENABLED";
    FD1P3AX ave_data_out_i0_i2 (.D(accum_adj_117[4]), .SP(latch_result), 
            .CK(clk_in_c), .Q(digital_out_c_1)) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(194[5] 200[12])
    defparam ave_data_out_i0_i2.GSR = "ENABLED";
    FD1S3AX raw_data_d1_i11 (.D(accum[11]), .CK(clk_in_c), .Q(raw_data_d1[11])) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(127[5] 137[9])
    defparam raw_data_d1_i11.GSR = "ENABLED";
    FD1S3AX raw_data_d1_i10 (.D(accum[10]), .CK(clk_in_c), .Q(raw_data_d1[10])) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(127[5] 137[9])
    defparam raw_data_d1_i10.GSR = "ENABLED";
    FD1S3AX raw_data_d1_i9 (.D(accum[9]), .CK(clk_in_c), .Q(raw_data_d1[9])) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(127[5] 137[9])
    defparam raw_data_d1_i9.GSR = "ENABLED";
    FD1S3AX raw_data_d1_i8 (.D(accum[8]), .CK(clk_in_c), .Q(raw_data_d1[8])) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(127[5] 137[9])
    defparam raw_data_d1_i8.GSR = "ENABLED";
    FD1S3AX raw_data_d1_i7 (.D(accum[7]), .CK(clk_in_c), .Q(raw_data_d1[7])) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(127[5] 137[9])
    defparam raw_data_d1_i7.GSR = "ENABLED";
    FD1S3AX raw_data_d1_i6 (.D(accum[6]), .CK(clk_in_c), .Q(raw_data_d1[6])) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(127[5] 137[9])
    defparam raw_data_d1_i6.GSR = "ENABLED";
    FD1S3AX raw_data_d1_i5 (.D(accum[5]), .CK(clk_in_c), .Q(raw_data_d1[5])) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(127[5] 137[9])
    defparam raw_data_d1_i5.GSR = "ENABLED";
    FD1S3AX raw_data_d1_i4 (.D(accum[4]), .CK(clk_in_c), .Q(raw_data_d1[4])) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(127[5] 137[9])
    defparam raw_data_d1_i4.GSR = "ENABLED";
    FD1S3AX raw_data_d1_i3 (.D(accum[3]), .CK(clk_in_c), .Q(raw_data_d1[3])) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(127[5] 137[9])
    defparam raw_data_d1_i3.GSR = "ENABLED";
    FD1S3AX raw_data_d1_i2 (.D(accum[2]), .CK(clk_in_c), .Q(raw_data_d1[2])) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(127[5] 137[9])
    defparam raw_data_d1_i2.GSR = "ENABLED";
    FD1S3AX raw_data_d1_i1 (.D(accum[1]), .CK(clk_in_c), .Q(raw_data_d1[1])) /* synthesis LSE_LINE_FILE_ID=39, LSE_LCOL=10, LSE_RCOL=17, LSE_LLINE=189, LSE_RLINE=189 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(127[5] 137[9])
    defparam raw_data_d1_i1.GSR = "ENABLED";
    LUT4 i189_2_lut (.A(count[2]), .B(count[1]), .Z(n284)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i189_2_lut.init = 16'heeee;
    LUT4 i1_2_lut (.A(count[0]), .B(count[1]), .Z(n4)) /* synthesis lut_function=(A+(B)) */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(142[55:67])
    defparam i1_2_lut.init = 16'heeee;
    LUT4 i158_1_lut (.A(count[0]), .Z(n17[0])) /* synthesis lut_function=(!(A)) */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(156[22:27])
    defparam i158_1_lut.init = 16'h5555;
    LUT4 i167_3_lut (.A(count[2]), .B(count[1]), .C(count[0]), .Z(n17[2])) /* synthesis lut_function=(!(A (B (C))+!A !(B (C)))) */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(156[22:27])
    defparam i167_3_lut.init = 16'h6a6a;
    FD1P3AX accum_35__i2 (.D(n65[2]), .SP(accumulate), .CK(clk_in_c), 
            .Q(n114[2])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35__i2.GSR = "ENABLED";
    FD1P3AX accum_35__i3 (.D(n65[3]), .SP(accumulate), .CK(clk_in_c), 
            .Q(accum_adj_117[3])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35__i3.GSR = "ENABLED";
    FD1P3AX accum_35__i4 (.D(n65[4]), .SP(accumulate), .CK(clk_in_c), 
            .Q(accum_adj_117[4])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35__i4.GSR = "ENABLED";
    FD1P3AX accum_35__i5 (.D(n65[5]), .SP(accumulate), .CK(clk_in_c), 
            .Q(accum_adj_117[5])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35__i5.GSR = "ENABLED";
    FD1P3AX accum_35__i6 (.D(n65[6]), .SP(accumulate), .CK(clk_in_c), 
            .Q(accum_adj_117[6])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35__i6.GSR = "ENABLED";
    FD1P3AX accum_35__i7 (.D(n65[7]), .SP(accumulate), .CK(clk_in_c), 
            .Q(accum_adj_117[7])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35__i7.GSR = "ENABLED";
    FD1P3AX accum_35__i8 (.D(n65[8]), .SP(accumulate), .CK(clk_in_c), 
            .Q(accum_adj_117[8])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35__i8.GSR = "ENABLED";
    FD1P3AX accum_35__i9 (.D(n65[9]), .SP(accumulate), .CK(clk_in_c), 
            .Q(accum_adj_117[9])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35__i9.GSR = "ENABLED";
    FD1P3AX accum_35__i10 (.D(n65[10]), .SP(accumulate), .CK(clk_in_c), 
            .Q(accum_adj_117[10])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35__i10.GSR = "ENABLED";
    FD1P3AX accum_35__i11 (.D(n65[11]), .SP(accumulate), .CK(clk_in_c), 
            .Q(accum_adj_117[11])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35__i11.GSR = "ENABLED";
    FD1P3AX accum_35__i12 (.D(n65[12]), .SP(accumulate), .CK(clk_in_c), 
            .Q(accum_adj_117[12])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35__i12.GSR = "ENABLED";
    FD1P3AX accum_35__i13 (.D(n65[13]), .SP(accumulate), .CK(clk_in_c), 
            .Q(accum_adj_117[13])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35__i13.GSR = "ENABLED";
    FD1P3AX accum_35__i14 (.D(n65[14]), .SP(accumulate), .CK(clk_in_c), 
            .Q(accum_adj_117[14])) /* synthesis syn_use_carry_chain=1 */ ;   // z:/fpga_flow_detector/documents/simplesigmadeltaadcsourcecode/source/vhdl/box_ave.vhd(175[13] 180[20])
    defparam accum_35__i14.GSR = "ENABLED";
    
endmodule
