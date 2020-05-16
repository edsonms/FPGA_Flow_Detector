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
    start : in std_logic;
    clock: in std_logic;
    result: out unsigned(7 downto 0)
  );
end entity;

architecture arch of bit_reversal_counting is

  signal counter: integer := 0;
  signal reverse: unsigned (0 to 7) := x"00";


begin

  counting : process(clock,start)

  begin

    if start = '1' then
      if rising_edge(clock) then
        if (counter < size and reverse = x"00") then
          reverse <= reverse + x"01";
          counter <= counter + 1;
        else
          reverse <= (others => '0');
        end if;
      end if;
    else
      reverse <= (others => '0');
    end if;

  end process;

result(7 downto 0) <= reverse (0 to 7);

end architecture;
