-- Author: Edson Manoel da Silva --
-- File : demux.vhd --
--Design units:
--entity mux
--function: two bit multiplexer
--output: one bit
--architecture behaviour:
-- simple 2 bit multiplexer
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

entity mux is
  port
    (
      a   : in  std_logic;
      b   : in  std_logic;
      sel : in  std_logic;
      y   : out std_logic
      );
end entity;

architecture arch of mux is

begin

  y <= a when sel = '0' else b;

end architecture;
