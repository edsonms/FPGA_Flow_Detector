-- Author: Edson Manoel da Silva --
-- File : demux_8bit.vhd --
--Design units:
--entity demux
--function: 8 bit demultiplexer
--output: 8 bit vector
--architecture behaviour:
-- instatiation of 8 simple 2 bit demultiplexer
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

entity demux_8bit is
  port
    (
      a   : out std_logic_vector(7 downto 0);
      b   : out std_logic_vector(7 downto 0);
      sel : in  std_logic;
      d   : in  std_logic_vector(7 downto 0)
      );
end entity;

architecture arch of demux_8bit is

  component demux is
    port (
      a   : out std_logic;
      b   : out std_logic;
      sel : in  std_logic;
      d   : in  std_logic
      );
  end component;

  signal a_wire, b_wire, d_wire : std_logic_vector (7 downto 0);

begin

  gen_mux :
  for i in 0 to 7 generate
    demux_i : demux
      port map (
        a   => a_wire(i),
        b   => b_wire(i),
        sel => sel,
        d   => d_wire(i)
        );

  end generate;

  a      <= a_wire;
  b      <= b_wire;
  d_wire <= d;

end architecture;
