-- Author: Edson Manoel da Silva --
-- Zero cross detection
-- File : fft.vhd --
--Design units:
--entity fft
--function: Calculates the number of times a signal cross the zero axis
--input: a frame of 256 samples of the input signal
--output: the number of times the signal crossed zero in that frame
--Library/package:
--ieee.std-logic-1164: to use std-logic
-- Synthesis and verification : GHDL
-- Synthesis software: . . . GHDL
--
--
--
--Version 1.0:
--Date: 5/2020

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package frame_packg is
  constant frame_size           : integer := 256;
  constant frame_size_minus_one : integer := 255;
  type frame_typ is array (frame_size_minus_one downto 0) of std_logic_vector(15 downto 0);
end frame_packg;
use work.frame_packg.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity zcd is
  port
    (
      clk_in     : in  std_logic;
      start      : in  std_logic;
      frame_in   : in  frame_typ;
      rdy        : out std_logic;
      zcd_result : out std_logic_vector (8 downto 0)
      );
end entity;

architecture behaviour of zcd is

  signal frame_buffer    : frame_typ;
  signal counter         : integer := 1;
  signal zcd_result_buff : unsigned (8 downto 0);

begin

  zcd_result <= std_logic_vector(zcd_result_buff);


  calculating : process(clk_in, start)
  begin
    if (start = '0') then
      frame_buffer    <= (others => (others => '0'));
      zcd_result_buff <= (others => '0');
      counter         <= 1;
    elsif (start = '1') then
      if rising_edge(clk_in) then
        frame_buffer <= frame_in;
        if(counter   <= frame_size)then
          if ((frame_buffer(counter)(15)) /= (frame_buffer(counter-1)(15)))then
            zcd_result_buff <= zcd_result_buff + x"01";
          else
            zcd_result_buff <= zcd_result_buff;
          end if;
          rdy     <= '0';
          counter <= counter + 1;
        else
          rdy <= '1';
        end if;
      end if;
    end if;

  end process;

end architecture;
