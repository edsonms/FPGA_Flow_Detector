-- Author: Edson Manoel da Silva --
-- File : mux_16bit.vhd --
--Design units:
--entity mux
--function: 16 bit multiplexer
--output: 16 bit vector
--architecture behaviour:
-- instatiation of 16 simple 2 bit multiplexer
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

entity mux_16bit is
  port
  (
    a : in std_logic_vector(15 downto 0);
    b : in std_logic_vector(15 downto 0);
    sel : in std_logic;
    y : out std_logic_vector(15 downto 0)
  );
end entity;

architecture arch of mux_16bit is

  component mux is
    port (
      a      : in  std_logic;
      b      : in  std_logic;
      sel    : in  std_logic;
      y : out std_logic
    );
  end component;


begin

  gen_mux:
  for I in 0 to 15 generate
    mux_i : mux
    port map (
      a      => a(i),
      b      => b(i),
      sel    => sel,
      y => y(i)
  );
  end generate;

end architecture;
