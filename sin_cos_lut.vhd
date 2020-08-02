library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sin_cos_lut is
  port
    (
      theta   : in  std_logic_vector(7 downto 0);
      cos_out : out std_logic_vector(15 downto 0);
      sin_out : out std_logic_vector(15 downto 0)
      );
end entity;

architecture arch of sin_cos_lut is

  -- Look up table for values of the sine and cosine function, from pi to pi/128 for use with an 256 point FFT

begin
  cos_out <= x"FEB8" when theta = x"01" else  -- (cos(pi)*(2^15 - 1))/100 - To avoid saturation it is divided by 100
             x"0000" when theta = x"02" else  -- cos(pi/2)*(2^15 - 1)/100
             x"00E8" when theta = x"04" else  -- cos(pi/4)*(2^15 - 1)/100
             x"012F" when theta = x"08" else  -- cos(pi/8)*(2^15 - 1)/100
             x"0141" when theta = x"10" else  -- cos(pi/16)*(2^15 - 1)/100
             x"0146" when theta = x"20" else  -- cos(pi/32)*(2^15 - 1)/100
             x"0147" when theta = x"40" else  -- cos(pi/64)*(2^15 - 1)/100
             x"0148" when theta = x"7F" else  -- cos(pi/128)*(2^15 - 1)/100
             x"0148" when theta = x"FF" else  -- cos(pi/256)*(2^15 - 1)/100
             x"0000";

  sin_out <= x"0000" when theta = x"01" else
             x"0148" when theta = x"02" else
             x"00E8" when theta = x"04" else
             x"007D" when theta = x"08" else
             x"0040" when theta = x"10" else
             x"0020" when theta = x"20" else
             x"0010" when theta = x"40" else
             x"0008" when theta = x"7F" else
             x"0004" when theta = x"FF" else
             x"0000";

end architecture;
