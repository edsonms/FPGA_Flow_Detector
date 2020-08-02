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
  cos_out <= x"8001" when theta = x"01" else  -- cos(pi)*(2^15 - 1)
             x"0000" when theta = x"02" else  -- cos(pi/2)*(2^15 - 1)
             x"5A82" when theta = x"04" else  -- cos(pi/4)*(2^15 - 1)
             x"7641" when theta = x"08" else  -- cos(pi/8)*(2^15 - 1)
             x"7D89" when theta = x"10" else  -- cos(pi/16)*(2^15 - 1)
             x"7F61" when theta = x"20" else  -- cos(pi/32)*(2^15 - 1)
             x"7FD7" when theta = x"40" else  -- cos(pi/64)*(2^15 - 1)
             x"7FF5" when theta = x"7F" else  -- cos(pi/128)*(2^15 - 1)
             x"7FFD" when theta = x"FF" else  -- cos(pi/256)*(2^15 - 1)
             x"0000";

  sin_out <= x"0000" when theta = x"01" else
             x"7FFF" when theta = x"02" else
             x"5A82" when theta = x"04" else
             x"30FB" when theta = x"08" else
             x"18F9" when theta = x"10" else
             x"0C8C" when theta = x"20" else
             x"0648" when theta = x"40" else
             x"0324" when theta = x"7F" else
             x"0192" when theta = x"FF" else
             x"0000";

end architecture;
