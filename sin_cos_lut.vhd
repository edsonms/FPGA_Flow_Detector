library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sine_cos_lut is
  port
  (
  theta: in unsigned(7 downto 0);
  cos_out: out signed(7 downto 0);
  sin_out: out signed(7 downto 0)
  );
end entity;

architecture arch of sine_cos_lut is

  -- Look up table for values of the sine function, from pi to pi/128 for use with an 256 point FFT

begin
  cos_out <= x"FF" when theta = x"01" else
      			 x"00" when theta = x"02" else
      			 x"5A" when theta = x"04" else
      			 x"76" when theta = x"08" else
      			 x"7C" when theta = x"10" else
      			 x"7D" when theta = x"20" else
      			 x"7E" when theta = x"40" else
      			 x"7F" when theta = x"80" else
             x"7F" when theta = x"FF" else
      			 "ZZZZZZZZ";

  sin_out <= x"00" when theta = x"01" else
      			 x"7F" when theta = x"02" else
      			 x"5A" when theta = x"04" else
      			 x"31" when theta = x"08" else
      			 x"19" when theta = x"10" else
      			 x"0C" when theta = x"20" else
      			 x"06" when theta = x"40" else
      			 x"03" when theta = x"80" else
             x"7F" when theta = x"FF" else
      			 "ZZZZZZZZ";

end architecture;
