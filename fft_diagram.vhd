
library ieee;
use ieee.std_logic_1164.all;

package fft_diagram is

component fft is
  port (
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
end component;
end package;
