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
  constant N : integer := 512; -- FFT N.o of points
  constant NM1 : integer := 511; -- N-1
  constant ND2 : integer := 256; -- N/2
  constant M: integer := 9; -- M = log(N)/log(2) // for N=512, M=9
  type frame_typ is array (NM1 downto 0) of signed(15 downto 0);
end package frame_packg;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.frame_packg.all;

entity fft is
  port
  (
    clock : in std_logic;
    start : in std_logic;
    frame_in: in frame_typ;
    bitrev_rdy : out std_logic;
    fft_rdy : out std_logic;
    re_x : out frame_typ;
    im_x : out frame_typ
  );
end entity;

architecture behaviour of fft is


  type state_type is
    (idle,counting);
  signal state_reg,state_next:state_type;

  type state2_type is
    (idle, loop1, loop2, loop3);
  signal state2_reg,state2_next:state2_type;

  signal bitrev: unsigned (7 downto 0);
  signal bitrev_start: std_logic;
  signal butterfly_start: std_logic;
  signal frame_reversed_reg: frame_typ;
  signal counter_reg,counter2_reg:integer := 0;


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


  component sine_cos_lut is
  port (
    theta   : in  unsigned(7 downto 0);
    cos_out : out signed(7 downto 0);
    sin_out : out signed(7 downto 0)
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

  sine_cos_lut_i : sine_cos_lut
port map (
  theta   => right_shift_out,
  cos_out => cos_out,
  sin_out => sin_out
);



------------------- Bit Reverse Time Domain Operation --------------------------

bitrev_stateREG : process(sensitivity_list) -- Control path: state register
begin
  if (rising_edge(clock)) then
    state2_reg <= state2_next;
  end if;
end process;

bitrev_NextStateLogic : process(start,counter_reg) -- Control path: next state logic
begin
case( state_reg ) is

  when idle =>
    if (start = '1')then
      state_next <= counting;
    else
      state_next <= idle;
    end if;

  when counting =>
    if (counter_full = '1')then
      state_next <= counting;
    else
      state_next <= finished;
    end if;

  when finished =>
    state_next <= idle;

  when others =>
    state_next <= idle;
end case;
end process;

--Bit reversal Control path: Output Logic
butterfly_start <= '1' when state_reg = finished else '0';
bitrev_rdy <= '1' when state_reg = finished else '0';
bitrev_start <= '1' when state_next = counting else '0';

bitrev_DataPathReg : process(clock,counter_next,frame_reversed_next) -- Data path: data register
begin
  if (start = '0') then
    counter_reg <= 0;
    frame_reversed_reg <= (others =>'0');
    frame_in_reg <= frame_in;
  elsif (rising_edge(clock)) then
    counter_reg <= counter_next;
    frame_reversed_reg <= frame_reversed_next;
  end if;
end process;

bitrev_DataPathMux : process(state_reg,adder_out)
begin
  case( state_reg ) is

    when idle =>
      counter_next <= counter_reg;
      frame_reversed_next <= frame_reversed_reg;

    when counting =>
      counter_next <= adder_out;
      frame_reversed_next(counter_next) <= frame_in_reg(integer(bitrev));

    when finished =>
      counter_next <= (others => '0');
      frame_reversed_next <= (others => (others => '0'));

    when others =>
      counter_next <= (others => '0');
      frame_reversed_next <= (others => (others => '0'));
  end case;
end process;

-- Data path combinational Logic
adder_out <= counter_reg + 1;

-- Data path status Logic
counter_full <= '1' when counter_next = NM1 else '0';


-------------- Butterfly Frequncy Domain Operation -----------------------------

butterfly_stateREG : process(clock) --Control Path: State Register
begin
  if (rising_edge(clock)) then
    state2_reg <= state2_next;
  end if;
end process;

butterfly_NextStateLogic : process(butterfly_start,state2_reg) --Control Path: Next State Logic
begin
  case state2_reg is
    when idle =>
      if rising_edge(butterfly_start) then
        state2_next <= loop1;
      end if;
    when loop1 =>
      if (counter_2_full = '1')then
        state2_next <= loop2;
      else
        state2_next <= loop1;
      end if;
    when loop2 =>
      if (counter_3_full = '1')then
        state2_next <= loop3;
      else
        state2_next <= loop1;
      end if;
    when loop3 =>
      if (counter_4_full = '1')then
        state2_next <= finished;
      else
        state2_next <= loop1;
      end if;
    when finished =>
        state2_next <= idle;
    when others =>
        state2_next <= idle;
  end case;
end process;

--Butterfly Control path: output logic
fft_rdy <= '1' when state2_reg = finished else '0';


butterfly_DataPathReg : process(clock,start) -- Data Path: data register
begin
  if (start = '0') then
    frame_reversed_reg <= (others =>'0');
    counter2_reg <= 1;
    counter3_reg <= 1;
    counter4_reg <= sub_out;
    UR_reg <= x"01";
    UI_reg <= x"00";
  elsif (rising_edge(clock)) then
    frame_reversed_reg <= frame_reversed_next;
    counter2_reg <= counter2_next;
    counter3_reg <= counter3_next;
    counter4_reg <= counter4_next;
    UR_reg <= UR_next;
    UI_reg <= UI_next;
    LE_reg <= LE_next;
    LE_D2_reg <= LE_D2_next;
  end if;
end process;

butterfly_DataPathMux : process(state2_reg,frame_reversed_reg)
begin
  case( state2_reg ) is

    when idle =>
      frame_reversed_next <= frame_reversed_reg;

    when loop1 =>
      counter_2_next <= adder2_out;
      LE_next <= left_shift_out;
      LE_D2_next <= right_shift_out;

    when loop2 =>
    counter_3_next <= adder3_out;

    when loop3 =>
    counter_4_next <= adder4_out;

    when others =>


  end case;

end process;

-- Data path combinational logic
adder2_out <= counter2_reg + 1;
left_shift_out <= shift_left(x"02",unsigned(counter_2));
right_shift_out <= shift_right(LE,x"02");
adder3_out <= counter3_reg + 1;
sub_out <= counter_3_reg - 1;
adder4_out <= counter4_reg + left_shift_out;

-- Data path status Logic
counter_2_full <= '1' when counter2_next = M else '0';
counter_3_full <= '1' when counter3_next = LE_D2_reg else '0';
counter_4_full <= '1' when counter4_next = NM1 else '0';

end architecture;
