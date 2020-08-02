-- Author: Edson Manoel da Silva --
-- Based in the FFT algorithm explained at http://www.dspguide.com/ch12/2.htm
-- File : fft.vhd --
--Design units:
--entity fft
--function: Calculates the spectrum of a time domain signal
--output: real and imaginary components
--architecture behaviour:
-- Data Path and Data Control implementation methodology
--Library/package:
--ieee.std-logic-1164: to use std-logic
-- Synthesis and verification : GHDL
-- Synthesis software: . . . GHDL
--
--
--
--Version 1.0:
--Date: 4/2020

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package frame_packg is
  constant N   : integer := 256;        -- FFT N.o of points
  constant NM1 : integer := 255;        -- N-1
  constant ND2 : integer := 128;        -- N/2
  constant M   : integer := 8;          -- M = log(N)/log(2) // for N=256, M=8
--type frame_typ is array (NM1 downto 0) of signed(15 downto 0);
end package frame_packg;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.frame_packg.all;
use work.dsp_arith.all;

entity fft is
  port
    (
      clock      : in  std_logic;
      acquire    : in  std_logic;
      start      : in  std_logic;
      sample     : in  std_logic_vector(15 downto 0);
      bitrev_rdy : out std_logic;
      fft_rdy    : out std_logic;
      out_addr   : out std_logic_vector(7 downto 0);
      out_we     : out std_logic;
      re_x       : out std_logic_vector(15 downto 0);
      im_x       : out std_logic_vector(15 downto 0)
      );
end entity;

architecture behaviour of fft is


  type state_type is
    (rst, idle, counting, finished);
  signal state_reg, state_next : state_type;

  type state2_type is
    (idle, loop1, loop2, loop3, loop3_2, loop3_3, loop3_4, loop3_5, loop3_6, loop3_7, loop3_8, loop3_9, loop3_10, loop3_11, loop3_12, loop3_13, loop3_14, update_UR_UI, update_TR, update_LE, update_LE_reg, finished);
  signal state2_reg, state2_next : state2_type;

  signal bitrev                                                                                                                                                                                                                                        : unsigned (7 downto 0);
  signal bitrev_start                                                                                                                                                                                                                                  : std_logic;
  signal butterfly_start                                                                                                                                                                                                                               : std_logic;
  signal sub_out, sub2_out, adder0_out, adder1_out, adder2_out, adder3_out, adder6_out, adder4_out                                                                                                                                                     : integer;
  signal sel1_reg, sel2_reg, sel1_next, sel2_next, sel3, sel4, rst_mem, rst_mem2, WE_reg, WE_next, WE2_reg, WE2_next, WE3, WE4, counter0_full, counter1_full, counter_2_full, counter_3_full, counter_4_full, and_port, and_port2, inv_port, inv_port2 : std_logic;
  signal a, b, a2, b2, data_reversed_out, data_reversed, re_wire, re_reg, re_mem, re_next, im_wire, im_reg, im_next                                                                                                                                    : std_logic_vector(15 downto 0);
  signal counter0_reg, counter1_reg, counter3_reg, counter4_reg, counter5_reg                                                                                                                                                                          : integer;
  signal counter2_reg                                                                                                                                                                                                                                  : integer := 1;  -- !!!! LEMBRAR DE TIRAR ESSA INICIALIZACAO DE VALOR !!!!!!!
  signal counter0_next, counter1_next, counter_2_next, counter_3_next, counter_4_next, counter_5_next                                                                                                                                                  : integer;
  signal left_shift_out, right_shift_out, LE_reg, LE_next, LE_D2_reg, LE_D2_next                                                                                                                                                                       : unsigned(7 downto 0);
  signal sin_out, cos_out, inverter_out, adder5_out                                                                                                                                                                                                    : signed(15 downto 0);
  signal butterfly_address_wire, bitrev_address_wire, bitrev_address_reg, read_address_reg, writing_address_reg, writing_address_next, read_address_next, Address3_reg, Address3_next, Address4_wire, Address, Address2                                : std_logic_vector(7 downto 0);
  signal dummy_out1, dummy_out2                                                                                                                                                                                                                        : std_logic_vector(15 downto 0);
  signal sub4_out                                                                                                                                                                                                                                      : signed(15 downto 0);
  signal sub5_out                                                                                                                                                                                                                                      : signed(15 downto 0);
  signal adder8_out                                                                                                                                                                                                                                    : signed(15 downto 0);
  signal adder9_out                                                                                                                                                                                                                                    : signed(15 downto 0);
  signal UR_reg, UR_next, UI_reg, UI_next, SR_reg, SR_next, SI_reg, SI_next, TR_reg, TR_next, TI_reg, TI_next                                                                                                                                          : signed (15 downto 0);
  signal sub3_out, adder10_out, sub6_out, mult1_out, mult2_out, mult3_out, mult4_out, mult5_out, mult6_out, mult7_out, mult8_out, adder7_out                                                                                                           : signed (31 downto 0);



  component bit_reversal_counting is
    generic (
      size : integer := NM1
      );
    port (
      start  : in  std_logic;
      clock  : in  std_logic;
      result : out unsigned(7 downto 0)
      );
  end component;


  component sin_cos_lut is
    port (
      theta   : in  std_logic_vector(7 downto 0);
      cos_out : out std_logic_vector(15 downto 0);
      sin_out : out std_logic_vector(15 downto 0)
      );
  end component;


  component RAM is
    port (
      Clock   : in  std_logic;
      ClockEn : in  std_logic;
      Reset   : in  std_logic;
      WE      : in  std_logic;
      Address : in  std_logic_vector(7 downto 0);
      Data    : in  std_logic_vector(15 downto 0);
      Q       : out std_logic_vector(15 downto 0)
      );
  end component;

  component mux_16bit is
    port (
      a   : in  std_logic_vector(15 downto 0);
      b   : in  std_logic_vector(15 downto 0);
      sel : in  std_logic;
      y   : out std_logic_vector(15 downto 0)
      );
  end component;

  component demux_16bit is
    port (
      a   : out std_logic_vector(15 downto 0);
      b   : out std_logic_vector(15 downto 0);
      sel : in  std_logic;
      d   : in  std_logic_vector(15 downto 0)
      );
  end component;


  component mux_8bit is
    port (
      a   : in  std_logic_vector(7 downto 0);
      b   : in  std_logic_vector(7 downto 0);
      sel : in  std_logic;
      y   : out std_logic_vector(7 downto 0)
      );
  end component;


begin

  bit_reversal_counting_i : bit_reversal_counting
    generic map (
      size => NM1
      )
    port map (
      start  => bitrev_start,
      clock  => clock,
      result => bitrev
      );

  sin_cos_lut_i : sin_cos_lut
    port map (
      theta   => std_logic_vector(right_shift_out),
      cos_out => dummy_out1,
      sin_out => dummy_out2
      );

  cos_out <= signed(dummy_out1);
  sin_out <= signed(dummy_out2);

  mux_16bit_i : mux_16bit               -- ping pong reading control
    port map (
      a   => a,
      b   => b,
      sel => sel2_reg,
      y   => data_reversed
      );


  demux_16bit_i2 : demux_16bit          -- ping pong writing control
    port map (
      a   => a2,
      b   => b2,
      sel => sel1_reg,
      d   => sample
      );

  mux_8bit_i : mux_8bit                 -- Mem1 address control
    port map (
      a   => writing_address_reg,
      b   => read_address_reg,
      sel => sel1_reg,
      y   => Address
      );

  mux_8bit_i2 : mux_8bit                -- Mem2 address control
    port map (
      a   => writing_address_reg,
      b   => read_address_reg,
      sel => sel2_reg,
      y   => Address2
      );


  mux_8bit_i3 : mux_8bit                -- bitrev address control
    port map (
      a   => Address3_reg,
      b   => Address4_wire,
      sel => sel3,
      y   => bitrev_address_wire
      );

  RAM_i1 : RAM
    port map (
      Clock   => clock,
      ClockEn => '1',
      Reset   => rst_mem,
      WE      => WE_reg,
      Address => Address,
      Data    => a2,
      Q       => a
      );

  RAM_i2 : RAM
    port map (
      Clock   => clock,
      ClockEn => '1',
      Reset   => rst_mem,
      WE      => WE2_reg,
      Address => Address2,
      Data    => b2,
      Q       => b
      );

  RAM_i3 : RAM
    port map (
      Clock   => clock,
      ClockEn => '1',
      Reset   => rst_mem,
      WE      => WE3,
      Address => bitrev_address_reg,
      Data    => data_reversed,
      Q       => data_reversed_out
      );

  mux_16bit_i2 : mux_16bit              -- real data mux
    port map (
      a   => data_reversed_out,
      b   => re_mem,
      sel => sel4,
      y   => re_wire
      );

  RAM_i4 : RAM
    port map (
      Clock   => clock,
      ClockEn => '1',
      Reset   => rst_mem2,
      WE      => WE4,
      Address => butterfly_address_wire,
      Data    => re_reg,
      Q       => re_mem
      );

  RAM_i5 : RAM
    port map (
      Clock   => clock,
      ClockEn => '1',
      Reset   => rst_mem2,
      WE      => WE4,
      Address => butterfly_address_wire,
      Data    => im_reg,
      Q       => im_wire
      );

  re_x <= re_reg;
  im_x <= im_reg;
------------------- Bit Reverse Time Domain Operation --------------------------

  bitrev_stateREG : process(clock)      -- Control path: state register
  begin
    if (rising_edge(clock)) then
      state_reg <= state_next;
    end if;
  end process;

  bitrev_NextStateLogic : process(state_reg, start, counter0_full, acquire)  -- Control path: next state logic
  begin
    case(state_reg) is

      when rst =>
        if (start = '1') then
          state_next <= idle;
        else
          state_next <= rst;
        end if;

      when idle =>
        if (rising_edge(acquire))then
          state_next <= counting;
        end if;

      when counting =>
        if (counter0_full = '0')then
          state_next <= counting;
        else
          state_next <= finished;
        end if;

      when finished =>
        state_next <= idle;

      when others =>
        state_next <= rst;
    end case;
  end process;

--Bit reversal Control path: Output Logic
  butterfly_start <= '1' when state_reg = finished else '0';
  bitrev_rdy      <= '1' when state_reg = finished else '0';
  bitrev_start    <= '1' when state_reg = counting else '0';
  rst_mem         <= '1'when state_reg = rst       else '0';

  WE3 <= '1' when state_reg = counting else '0';

  bitrev_DataPathReg : process(clock, start, acquire)  -- Data path: data register
  begin
    if (start = '0') then
      counter0_reg        <= 0;
      counter1_reg        <= 0;
      Address3_reg        <= (others => '0');
      writing_address_reg <= (others => '0');
      read_address_reg    <= (others => '0');
      WE_reg              <= '0';
      WE2_reg             <= '0';
      sel1_reg            <= '0';
      sel2_reg            <= '0';
    elsif (rising_edge(acquire))then
      counter0_reg <= counter0_next;
    elsif (rising_edge(clock)) then
      if (counter1_full = '0')then
        counter1_reg <= counter1_next;
      end if;
      WE_reg              <= WE_next;
      WE2_reg             <= WE2_next;
      writing_address_reg <= writing_address_next;
      read_address_reg    <= read_address_next;
      Address3_reg        <= Address3_next;
      sel1_reg            <= sel1_next;
      sel2_reg            <= sel2_next;
      bitrev_address_reg  <= bitrev_address_wire;
    end if;
  end process;

  bitrev_DataPathMux : process(state_reg, counter0_reg, counter1_reg, adder0_out, adder1_out, bitrev, and_port, and_port2)
  begin
    case(state_reg) is

      when rst =>
        counter0_next        <= 0;
        counter1_next        <= 0;
        writing_address_next <= (others => '0');
        read_address_next    <= (others => '0');
        Address3_next        <= (others => '0');
        WE_next              <= '0';
        WE2_next             <= '0';
        sel1_next            <= '0';
        sel2_next            <= '1';

      when idle =>
        counter0_next <= 0;
        counter1_next <= 0;

      when counting =>
        WE_next              <= and_port;
        WE2_next             <= and_port2;
        counter0_next        <= adder0_out;
        counter1_next        <= adder1_out;
        writing_address_next <= std_logic_vector(to_signed(counter0_reg, 8));
        --read_address_next    <= std_logic_vector(shift_right(bitrev, 5));  --!!!! LEMBRAR DE TIRAR ESSE SHIFT !!!!!!!
        read_address_next    <= std_logic_vector(bitrev);
        Address3_next        <= std_logic_vector(to_signed(counter1_reg, 8));

      when finished =>
        counter0_next <= 0;
        counter1_next <= 0;
        WE_next       <= '0';
        WE2_next      <= '0';
        sel1_next     <= inv_port;
        sel2_next     <= sel1_reg;

      when others =>
        counter0_next        <= 0;
        counter1_next        <= 0;
        writing_address_next <= (others => '0');
        read_address_next    <= (others => '0');
        Address3_next        <= (others => '0');
        WE_next              <= '0';
        WE2_next             <= '0';
        sel1_next            <= '0';
        sel2_next            <= '1';

    end case;
  end process;

-- Data path combinational Logic
  adder0_out <= counter0_reg + 1;
  adder1_out <= counter1_reg + 1;
  inv_port   <= not(sel1_reg);
  and_port   <= inv_port and acquire;
  inv_port2  <= not(sel2_reg);
  and_port2  <= inv_port2 and acquire;

-- Data path status Logic
  counter0_full <= '0' when state_reg = idle else '1' when counter0_reg = NM1;
  counter1_full <= '0' when state_reg = idle else '1' when counter1_reg = NM1;


-------------- Butterfly Frequncy Domain Operation -----------------------------

  butterfly_stateREG : process(clock)   --Control Path: State Register
  begin
    if (rising_edge(clock)) then
      state2_reg <= state2_next;
    end if;
  end process;

  butterfly_NextStateLogic : process(state2_reg, butterfly_start, counter_2_full, counter_3_full, counter_4_full)  --Control Path: Next State Logic
  begin
    case state2_reg is
      when idle =>
        if rising_edge(butterfly_start) then
          state2_next <= loop1;
        end if;
      when loop1 =>
        if (counter_2_full = '0')then
          state2_next <= loop2;
        else
          state2_next <= finished;
        end if;

      when loop2 =>
        state2_next <= loop3;

      when loop3 =>
        if (counter_4_full = '0')then
          state2_next <= loop3_2;
        else
          state2_next <= update_TR;
        end if;

      when loop3_2 =>
        state2_next <= loop3_3;

      when loop3_3 =>
        state2_next <= loop3_4;

      when loop3_4 =>
        state2_next <= loop3_5;

      when loop3_5 =>
        state2_next <= loop3_6;

      when loop3_6 =>
        state2_next <= loop3_7;

      when loop3_7 =>
        state2_next <= loop3_8;

      when loop3_8 =>
        state2_next <= loop3_9;

      when loop3_9 =>
        state2_next <= loop3_10;

      when loop3_10 =>
        state2_next <= loop3_11;

      when loop3_11 =>
        state2_next <= loop3_12;

      when loop3_12 =>
        state2_next <= loop3_13;

      when loop3_13 =>
        state2_next <= loop3_14;

      when loop3_14 =>
        state2_next <= loop3;

      when update_TR =>
        state2_next <= update_UR_UI;

      when update_UR_UI =>
        if (counter_3_full = '0')then
          state2_next <= loop2;
        else
          state2_next <= update_LE;
        end if;

      when update_LE =>
        state2_next <= update_LE_reg;

      when update_LE_reg =>
        state2_next <= loop1;

      when finished =>
        state2_next <= idle;

      when others =>
        state2_next <= idle;

    end case;
  end process;

--Butterfly Control path: output logic
  fft_rdy  <= '1' when state2_reg = finished else '0';
  rst_mem2 <= '1' when state2_reg = idle     else '0';


  butterfly_DataPathReg : process(clock, start)  -- Data Path: data register
  begin
    if (start = '0') then
      --frame_butterfly_reg <= (others => (others => '0'));
      counter2_reg <= 1;
      counter3_reg <= 1;
      counter4_reg <= sub_out;
      counter5_reg <= adder6_out;
      UR_reg       <= x"0148";
      UI_reg       <= x"0000";
      LE_reg       <= (others => '0');
      LE_D2_reg    <= (others => '0');
      TR_reg       <= (others => '0');
      TI_reg       <= (others => '0');
      SR_reg       <= (others => '0');
      SI_reg       <= (others => '0');
      re_reg       <= (others => '0');
      im_reg       <= (others => '0');

    elsif (rising_edge(clock)) then
      counter2_reg <= counter_2_next;
      counter3_reg <= counter_3_next;
      counter4_reg <= counter_4_next;
      counter5_reg <= counter_5_next;
      UR_reg       <= UR_next;
      UI_reg       <= UI_next;
      LE_reg       <= LE_next;
      LE_D2_reg    <= LE_D2_next;
      TR_reg       <= TR_next;
      TI_reg       <= TI_next;
      SR_reg       <= SR_next;
      SI_reg       <= SI_next;
      re_reg       <= re_next;
      im_reg       <= im_next;
    end if;
  end process;

  butterfly_DataPathMux : process(state2_reg, counter4_reg, counter5_reg, adder2_out, left_shift_out, right_shift_out, cos_out, adder5_out, adder3_out, sub2_out, adder6_out, adder4_out, sub3_out, adder7_out, sub4_out, sub5_out, adder8_out, adder9_out, sub6_out, adder10_out, UR_reg)
  begin
    case(state2_reg) is

      when idle =>
        counter_2_next <= 1;
        counter_3_next <= 1;
        counter_4_next <= 0;
        counter_5_next <= 0;
        UR_next        <= (others => '0');
        UI_next        <= (others => '0');
        LE_next        <= left_shift_out;
        LE_D2_next     <= right_shift_out;
        SR_next        <= (others => '0');
        SI_next        <= (others => '0');
        re_next        <= (others => '0');
        im_next        <= (others => '0');
        TR_next        <= (others => '0');
        TI_next        <= (others => '0');

      when loop1 =>
        UR_next        <= x"0148";
        UI_next        <= x"0000";
        LE_next        <= left_shift_out;
        LE_D2_next     <= right_shift_out;
        SR_next        <= cos_out;
        SI_next        <= adder5_out;
        counter_3_next <= 1;

      when loop2 =>
        counter_3_next <= adder3_out;  -- the "j" variable from the second for in the BASIC FFT example
        counter_4_next <= sub2_out;  -- the "i" variable from the second for in the BASIC FFT example
        counter_5_next <= adder6_out;  -- the "ip" variable from the second for in the BASIC FFT example

      when loop3 =>                     -- le de uma posiçao de memoria 3
        Address4_wire          <= std_logic_vector(to_unsigned(counter5_reg, 8));
        butterfly_address_wire <= std_logic_vector(to_unsigned(counter5_reg, 8));

      when loop3_2 =>                   --
        Address4_wire          <= std_logic_vector(to_unsigned(counter5_reg, 8));
        butterfly_address_wire <= std_logic_vector(to_unsigned(counter5_reg, 8));

      when loop3_3 =>
        Address4_wire          <= std_logic_vector(to_unsigned(counter5_reg, 8));
        butterfly_address_wire <= std_logic_vector(to_unsigned(counter5_reg, 8));

      when loop3_4 =>                   -- le de outra posicao de memoria 3
        TR_next                <= round_to_16bit(sub3_out);
        TI_next                <= round_to_16bit(adder7_out);
        Address4_wire          <= std_logic_vector(to_unsigned(counter4_reg, 8));
        butterfly_address_wire <= std_logic_vector(to_unsigned(counter4_reg, 8));

      when loop3_5 =>
        Address4_wire          <= std_logic_vector(to_unsigned(counter4_reg, 8));
        butterfly_address_wire <= std_logic_vector(to_unsigned(counter4_reg, 8));

      when loop3_6 =>
        Address4_wire          <= std_logic_vector(to_unsigned(counter4_reg, 8));
        butterfly_address_wire <= std_logic_vector(to_unsigned(counter4_reg, 8));

      when loop3_7 =>                   -- escrevo em uma posicao de memoria 4
        re_next                <= std_logic_vector(sub4_out);
        im_next                <= std_logic_vector(sub5_out);
        butterfly_address_wire <= std_logic_vector(to_unsigned(counter5_reg, 8));

      when loop3_8 =>                   -- escrevo em uma posicao de memoria 4
        butterfly_address_wire <= std_logic_vector(to_unsigned(counter5_reg, 8));

      when loop3_9 =>                   -- escrevo em uma posicao de memoria 4
        butterfly_address_wire <= std_logic_vector(to_unsigned(counter5_reg, 8));

      when loop3_10 =>                  -- escrevo em uma posicao de memoria 4
        butterfly_address_wire <= std_logic_vector(to_unsigned(counter5_reg, 8));

      when loop3_11 =>  -- escrevo em outra posicao de memoria 4
        butterfly_address_wire <= std_logic_vector(to_unsigned(counter4_reg, 8));
        counter_4_next         <= adder4_out;
        re_next                <= std_logic_vector(adder8_out);
        im_next                <= std_logic_vector(adder9_out);

      when loop3_12 =>  -- escrevo em outra posicao de memoria 4
        re_next <= std_logic_vector(adder8_out);
        im_next <= std_logic_vector(adder9_out);

      when loop3_13 =>  -- escrevo em outra posicao de memoria 4
        re_next <= std_logic_vector(adder8_out);
        im_next <= std_logic_vector(adder9_out);

      when loop3_14 =>  -- escrevo em outra posicao de memoria 4
        counter_5_next <= adder6_out;

      when update_TR =>
        TR_next <= UR_reg;

      when update_UR_UI =>
        counter_4_next <= sub2_out;  -- the "i" variable from the second for in the BASIC FFT example
        UR_next        <= round_to_16bit(sub6_out);
        UI_next        <= round_to_16bit(adder10_out);

      when update_LE =>
        counter_2_next <= adder2_out;  -- the "L" variable from the first for in the the BASIC FFT example
        counter_3_next <= 1;
        counter_4_next <= 0;
        counter_5_next <= 0;
        LE_next        <= left_shift_out;

      when update_LE_reg =>
        LE_next <= left_shift_out;

      when others =>
        counter_2_next <= 1;
        counter_3_next <= 1;
        counter_4_next <= 0;
        counter_5_next <= 0;
        UR_next        <= x"0148";
        UI_next        <= x"0000";
        LE_next        <= (others => '0');
        LE_D2_next     <= (others => '0');
        SR_next        <= (others => '0');
        SI_next        <= (others => '0');

    end case;

  end process;

-- Data path combinational logic
  adder2_out      <= counter2_reg + 1;
  left_shift_out  <= shift_left(x"02", counter2_reg-1);
  right_shift_out <= shift_right(LE_reg, 1);
  adder3_out      <= counter3_reg + 1;
  sub_out         <= counter3_reg - 1;
  adder4_out      <= counter4_reg + to_integer(LE_reg);
  inverter_out    <= not(sin_out);
  adder5_out      <= inverter_out + x"0001";
  adder6_out      <= to_integer(right_shift_out) + counter4_reg;
  sub2_out        <= counter3_reg - 1;

  mult1_out  <= shift_left(signed(re_wire)*(UR_reg), 1);  -- shift compensates constants normalization error
  mult2_out  <= shift_left(signed(im_wire)*UI_reg, 1);  -- the imaginary part is considered zero. This time domain signal is only real
  sub3_out   <= sub_32bit_WithUnderflowControl(mult1_out, mult2_out);
  mult3_out  <= shift_left(signed(re_wire)*(UI_reg), 1);  -- shift compensates constants normalization error
  mult4_out  <= shift_left(signed(im_wire)*UR_reg, 1);  -- the imaginary part is considered zero. This time domain signal is only real
  adder7_out <= add_32bit_WithOverflowControl(mult3_out, mult4_out);

  sub4_out   <= sub_16bit_WithUnderflowControl(signed(re_wire), TR_reg);
  sub5_out   <= sub_16bit_WithUnderflowControl(signed(im_wire), TI_reg);
  adder8_out <= add_16bit_WithOverflowControl(signed(re_wire), TR_reg);
  adder9_out <= add_16bit_WithOverflowControl(signed(im_wire), TI_reg);


  mult5_out   <= shift_left(TR_reg*SR_reg, 1);  --shift compensates constants normalization error
  mult6_out   <= shift_left(UI_reg*SI_reg, 1);
  mult7_out   <= shift_left(TR_reg*SI_reg, 1);
  mult8_out   <= shift_left(UI_reg*SR_reg, 1);
  sub6_out    <= sub_32bit_WithUnderflowControl(mult5_out, mult6_out);
  adder10_out <= add_32bit_WithOverflowControl(mult7_out, mult8_out);

-- Data path status Logic
  counter_2_full <= '1' when counter2_reg >= M                                                                                                                                                                                   else '0';
  counter_3_full <= '1' when counter3_reg > to_integer(LE_D2_reg)                                                                                                                                                                else '0';
  counter_4_full <= '1' when counter4_reg > NM1                                                                                                                                                                                  else '0';
  sel3           <= '0' when state2_reg = idle                                                                                                                                                                                   else '1';
  sel4           <= '0' when state2_reg = idle                                                                                                                                                                                   else '1' when state2_reg = update_TR;
  WE4            <= '1' when (state2_reg = loop3_7 or state2_reg = loop3_8 or state2_reg = loop3_9 or state2_reg = loop3_10 or state2_reg = loop3_11 or state2_reg = loop3_12 or state2_reg = loop3_13 or state2_reg = loop3_14) else '0';
  out_we         <= WE4;

-- Data path output
  out_addr <= butterfly_address_wire;

end architecture;
