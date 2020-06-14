-- Author: Edson Manoel da Silva --
-- File : demux.vhd --
--Design units:
--entity demux
--function: two bit demultiplexer
--output: one bit
--architecture behaviour:
-- simple 2 bit demultiplexer
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

entity demux is
  port
    (
      a   : out std_logic;
      b   : out std_logic;
      sel : in  std_logic;
      d   : in  std_logic
      );
end entity;

architecture arch of demux is

begin

  a <= not(sel) and d;
  b <= sel and d;

end architecture;
