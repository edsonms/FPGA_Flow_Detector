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
  constant N : integer := 256; -- FFT N.o of points
  constant NM1 : integer := 255; -- N-1
  constant ND2 : integer := 128; -- N/2
  constant M: integer := 8; -- M = log(N)/log(2) // for N=256, M=8
  --type frame_typ is array (NM1 downto 0) of signed(15 downto 0);
end package frame_packg;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.frame_packg.all;

entity fft is
  port
  (
    clock : in std_logic;
    acquire: in std_logic;
    start : in std_logic;
    sample: in std_logic_vector(15 downto 0);
    bitrev_rdy : out std_logic;
    fft_rdy : out std_logic;
    re_x : out std_logic_vector(15 downto 0);
    im_x : out std_logic_vector(15 downto 0)
  );
end entity;

architecture behaviour of fft is


  type state_type is
    (rst,idle,counting,finished);
  signal state_reg,state_next:state_type := rst;

  type state2_type is
    (idle, loop1, loop2, loop3,update_UR_UI,update_TR,finished);
  signal state2_reg,state2_next:state2_type;

  signal bitrev: unsigned (7 downto 0);
  signal bitrev_start: std_logic;
  signal butterfly_start: std_logic;
  signal sub_out,sub2_out,adder_out,adder2_out,adder3_out,adder6_out,adder4_out: integer;
  signal counter_full,counter_2_full,counter_3_full,counter_4_full: std_logic;
  signal frame_reversed_reg,frame_reversed_next,frame_in_reg,frame_butterfly_reg,frame_butterfly_next,re_reg,re_next,im_reg,im_next: std_logic_vector(15 downto 0);
  signal counter_reg,counter2_reg,counter3_reg,counter4_reg,counter5_reg:integer;
  signal counter_next,counter_2_next,counter_3_next,counter_4_next,counter_5_next:integer;
  signal left_shift_out,right_shift_out, LE_reg, LE_next,LE_D2_reg,LE_D2_next: signed(7 downto 0);
  signal adder5_out: signed(7 downto 0);
  signal cos_out: signed(7 downto 0);
  signal sin_out,inverter_out: signed(7 downto 0);
  signal dummy_out1: std_logic_vector(7 downto 0);
  signal dummy_out2: std_logic_vector(7 downto 0);
  signal sub4_out: signed(15 downto 0);
  signal sub5_out: signed(15 downto 0);
  signal adder8_out: signed(15 downto 0);
  signal adder9_out: signed(15 downto 0);
  signal UR_reg, UR_next, UI_reg, UI_next,SR_reg,SR_next,SI_reg,SI_next,TR_reg,TR_next,TI_reg,TI_next : signed (15 downto 0);
  signal sub3_out, adder10_out,sub6_out, mult1_out,mult2_out,mult3_out,mult4_out,mult5_out,mult6_out,mult7_out,mult8_out,adder7_out : signed (31 downto 0);



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
      cos_out : out std_logic_vector(7 downto 0);
      sin_out : out std_logic_vector(7 downto 0)
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

  component demux_8bit is
    port (
      a   : out std_logic_vector(7 downto 0);
      b   : out std_logic_vector(7 downto 0);
      sel : in  std_logic;
      d   : in  std_logic_vector(7 downto 0)
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

mux_16bit_i : mux_16bit -- ping pong reading control
port map (
  a   => a,
  b   => b,
  sel => sel1,
  y   => data_reversed
);

demux_8bit_i : demux_8bit -- ping pong reading address control
port map (
  a   => Address,
  b   => Address2,
  sel => sel1,
  d   => read_address_reg
);

demux_16bit_i : mux_16bit -- ping pong writing control
port map (
  a   => a2,
  b   => b2,
  sel => sel2,
  d   => sample
);

demux_8bit_i2 : demux_8bit -- ping pong writing address control
port map (
  a   => Address,
  b   => Address2,
  sel => sel2,
  d   => writing_address_reg
);

mux_8bit_i : mux_8bit -- ping pong writing address control
port map (
  a   => Address4_reg,
  b   => Address3_reg,
  sel => butterfly_start,
  y   => bitrev_address_reg
);

RAM_i1 : RAM
port map (
  Clock   => clock,
  ClockEn => '1',
  Reset   => rst_mem,
  WE      => WE,
  Address => Address,
  Data    => a2,
  Q       => a
);

RAM_i2 : RAM
port map (
  Clock   => clock,
  ClockEn => '1',
  Reset   => rst_mem,
  WE      => WE2,
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

------------------- Bit Reverse Time Domain Operation --------------------------

bitrev_stateREG : process(clock,state_next) -- Control path: state register
begin
  if (rising_edge(clock)) then
    state_reg <= state_next;
  end if;
end process;

bitrev_NextStateLogic : process(start,counter_reg,counter_full,state_reg) -- Control path: next state logic
begin
case( state_reg ) is

  when rst =>
    state_next <= idle;

  when idle =>
    if (start = '1')then
      state_next <= counting;
    else
      state_next <= idle;
    end if;

  when counting =>
    if (counter_full = '0')then
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
bitrev_rdy <= '1' when state_reg = finished else '0';
bitrev_start <= '1' when state_reg = counting else '0';
rst_mem <= '1'when state_reg = rst else '0';
sel1 <= not (sel1) when state_reg = finished else '0' when state_reg = rst;
sel2 <= not (sel1);
sel3 <= '1' when state_reg = counting else '0';

WE <= '1' when sel3 = '0' else '0';
WE2<= '1' when sel3 = '1' else '0';

bitrev_DataPathReg : process(clock,counter_next,start) -- Data path: data register
begin
  if (start = '0') then
    counter_reg <= 0;
  elsif (rising_edge(clock)) then
    counter_reg <= counter_next;
    writing_address_reg <= writing_address_next;
    read_address_reg <= read_address_next;
    Address3_reg <= Address3_next;
  end if;
end process;

bitrev_DataPathMux : process(state_reg,adder_out,counter_reg,bitrev)
begin
  case( state_reg ) is

    when rst =>
      couter_next <= 0;

    when idle =>
      counter_next <= counter_reg;

    when counting =>
      counter_next <= adder_out;
      writing_address_next <= std_logic_vector(to_signed(counter_reg,8));
      read_address_next <= bitrev;
      data_reversed <= y;
      Address3_next <= std_logic_vector(to_signed(counter_reg,8));

    when finished =>
      counter_next <= 0;

    when others =>
      counter_next <= 0;
  end case;
end process;

-- Data path combinational Logic
adder_out <= counter_reg + 1;


-- Data path status Logic
counter_full <= '1' when counter_next = NM1 else '0';


-------------- Butterfly Frequncy Domain Operation -----------------------------

butterfly_stateREG : process(clock,state2_next) --Control Path: State Register
begin
  if (rising_edge(clock)) then
    state2_reg <= state2_next;
  end if;
end process;

butterfly_NextStateLogic : process(butterfly_start,state2_reg,counter_2_full,counter_3_full,counter_4_full) --Control Path: Next State Logic
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
      if (counter_3_full = '0')then
        state2_next <= loop3;
      else
        state2_next <= loop1;
      end if;
    when loop3 =>
      if (counter_4_full = '0')then
        state2_next <= finished;
      else
        state2_next <= update_UR_UI;
      end if;

    when update_UR_UI =>
      state2_next <= loop2;

    when update_TR =>
      state2_next <= update_TR;

    when finished =>
        state2_next <= idle;
    when others =>
        state2_next <= idle;
  end case;
end process;

--Butterfly Control path: output logic
fft_rdy <= '1' when state2_reg = finished else '0';


butterfly_DataPathReg : process(clock,start,sub_out,adder6_out) -- Data Path: data register
begin
  if (start = '0') then
    frame_butterfly_reg <= (others => (others => '0'));
    counter2_reg <= 1;
    counter3_reg <= 1;
    counter4_reg <= sub_out;
    counter5_reg <= adder6_out;
    UR_reg <= x"0001";
    UI_reg <= x"0000";
  elsif (rising_edge(clock)) then
    frame_butterfly_reg <= frame_butterfly_next;
    counter2_reg <= counter_2_next;
    counter3_reg <= counter_3_next;
    counter4_reg <= counter_4_next;
    counter5_reg <= counter_5_next;
    UR_reg <= UR_next;
    UI_reg <= UI_next;
    LE_reg <= LE_next;
    LE_D2_reg <= LE_D2_next;
    TR_reg <= TR_next;
    TI_reg <= TI_next;
    SR_reg <= SR_next;
    SI_reg <= SI_next;
    re_reg <= re_next;
    im_reg <= im_next;
  end if;
end process;

butterfly_DataPathMux : process(state2_reg,frame_butterfly_reg,frame_reversed_reg,counter4_reg,counter5_reg,adder2_out,left_shift_out,right_shift_out,cos_out,adder5_out,adder3_out,sub2_out,adder6_out,adder4_out,sub3_out,adder7_out,sub4_out,sub5_out,adder8_out,adder9_out,sub6_out,adder10_out,UR_reg)
begin
  case( state2_reg ) is

    when idle =>
      frame_butterfly_next <= (others => (others => '0'));

    when loop1 =>
      frame_butterfly_next <= frame_reversed_reg;
      counter_2_next <= adder2_out;
      UR_next <= x"0001";
      UI_next <= x"0000";
      LE_next <= left_shift_out;
      LE_D2_next <= right_shift_out;
      SR_next <= resize(cos_out,16);
      SI_next <= resize(adder5_out,16);

    when loop2 =>
      counter_3_next <= adder3_out;
      counter_4_next <= sub2_out;
      counter_5_next <= adder6_out;

    when loop3 => -- le de uma posiçao de memoria 3
      counter_4_next <= adder4_out;
      TR_next <= resize(sub3_out,16);
      TI_next <= resize(adder7_out,16);

    when loop3_2 =>  -- le de outra posicao de memoria 3


    when loop3_3 => -- escrevo em uma posicao de memoria 4
      re_next(counter5_reg) <= sub4_out;
      im_next(counter5_reg) <= sub5_out;

    when loop3_3 => -- escrevo em outra posicao de memoria 4
      re_next(counter4_reg) <= adder8_out;
      im_next(counter4_reg) <= adder9_out;

    when update_TR =>
      TR_next <= UR_reg;

    when update_UR_UI =>
      UR_next <= resize(sub6_out,16);
      UI_next <= resize(adder10_out,16);

    when others =>
      frame_butterfly_next <= (others => (others => '0'));
      counter_2_next <= 0;
      counter_3_next <= 0;
      counter_4_next <= 0;
      counter_5_next <= 0;
      UR_next <= x"0001";
      UI_next <= x"0000";
      LE_next <= (others => '0');
      LE_D2_next <= (others => '0');
      SR_next <= (others => '0');
      SI_next <= (others => '0');

  end case;

end process;

-- Data path combinational logic
adder2_out <= counter2_reg + 1;
left_shift_out <= shift_left(to_signed(counter2_reg,8),2);
right_shift_out <= shift_right(LE_reg,2);
adder3_out <= counter3_reg + 1;
sub_out <= counter3_reg - 1;
adder4_out <= counter4_reg + to_integer(left_shift_out);
inverter_out <= not(sin_out);
adder5_out <= inverter_out + x"01";
adder6_out <= to_integer(right_shift_out) + counter4_reg;
sub2_out <= counter3_reg - 1;

mult1_out <= frame_in(counter5_reg)*(UR_reg);
mult2_out <= x"0000"*UI_reg; -- the imaginary part is considered zero. This time domain signal is only real
sub3_out <= mult1_out - mult2_out;
mult3_out <= frame_in(counter5_reg)*(UI_reg);
mult4_out <= x"0000"*UR_reg; -- the imaginary part is considered zero. This time domain signal is only real
adder7_out <= mult1_out + mult2_out;

sub4_out <= frame_in(counter4_reg)-TR_reg;
sub5_out <= frame_in(counter4_reg)-TI_reg;
adder8_out <= frame_in(counter4_reg)+TR_reg;
adder9_out <= frame_in(counter4_reg)+TI_reg;


mult5_out <= TR_reg*SR_reg;
mult6_out <= UI_reg*SI_reg;
mult7_out <= TR_reg*SI_reg;
mult8_out <= UI_reg*SR_reg;
sub6_out <= mult5_out - mult6_out;
adder10_out <= mult7_out + mult8_out;

-- Data path status Logic
counter_2_full <= '1' when counter_2_next = M else '0';
counter_3_full <= '1' when counter_3_next = to_integer(LE_D2_reg) else '0';
counter_4_full <= '1' when counter_4_next = NM1 else '0';

-- Data path output
re_x <= re_reg;
im_x <= im_reg;

end architecture;
