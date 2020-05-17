library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sin_cos_lut is
  port
  (
  theta: in std_logic_vector(7 downto 0);
  cos_out: out std_logic_vector(7 downto 0);
  sin_out: out std_logic_vector(7 downto 0)
  );
end entity;

architecture arch of sin_cos_lut is

  -- Look up table for values of the sine and cosine function, from pi to pi/128 for use with an 256 point FFT

begin
  cos_out <= 	 "10000001" when theta = x"01" else
      			 "00000000" when theta = x"02" else
      			 "01011010" when theta = x"04" else
      			 "01110110" when theta = x"08" else
      			 "01111110" when theta = x"10" else
      			 "01111111" when theta = x"20" else
      			 "01111111" when theta = x"40" else
      			 "01111111" when theta = x"7F" else
				 "10000001" when theta = x"FF" else
      			 "ZZZZZZZZ";

  sin_out <= 	 "00000000" when theta = x"01" else
      			 "01111111" when theta = x"02" else
      			 "01011010" when theta = x"04" else
      			 "00110001" when theta = x"08" else
      			 "00011001" when theta = x"10" else
      			 "00001101" when theta = x"20" else
      			 "00000110" when theta = x"40" else
      			 "00000011" when theta = x"7F" else
				 "00000000" when theta = x"FF" else
      			 "ZZZZZZZZ";

end architecture;
