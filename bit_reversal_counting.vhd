library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bit_reversal_counting is
  generic
    (
      size : integer := 255
      );
  port
    (
      start  : in  std_logic;
      clock  : in  std_logic;
      result : out unsigned(7 downto 0)
      );
end entity;

architecture arch of bit_reversal_counting is

  signal counter : integer               := 0;
  signal reverse : unsigned (7 downto 0) := x"00";


begin

  counting : process(clock, start)

  begin

    if start = '1' then
      if rising_edge(clock) then
        if (counter < size) then
          reverse <= reverse + x"01";
          counter <= counter + 1;
        end if;
      end if;
    else
      reverse <= (others => '0');
      counter <= 0;
    end if;

  end process;

  result <= reverse(0) & reverse(1) & reverse(2) & reverse(3) & reverse(4) & reverse(5) & reverse(6) & reverse(7);

end architecture;
