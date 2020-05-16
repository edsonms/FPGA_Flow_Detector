--! Standard library.
library ieee;
--! Logic elements.
use ieee.std_logic_1164.all;
--! Arithmetic functions.
use ieee.numeric_std.all;
--


entity sin_cos_lut_tb is
end;

architecture bench of sin_cos_lut_tb is

  -- Generics
  -- clock period
  constant clk_period : time := 5 ns;
  signal clk : std_logic;
  -- Signal ports
  signal theta   : unsigned(7 downto 0):= (others => '0');
  signal cos_out : std_logic_vector(8 downto 0) := (others => '0');
  signal sin_out : std_logic_vector(8 downto 0) := (others => '0');

  component sin_cos_lut is
    port (
      theta   : in  unsigned(7 downto 0);
      cos_out : out std_logic_vector(8 downto 0);
      sin_out : out std_logic_vector(8 downto 0)
    );
  end component;


begin
  -- Instance
  sin_cos_lut_i : sin_cos_lut
  port map (
    theta   => theta,
    cos_out => cos_out,
    sin_out => sin_out
  );

  main : process
  variable counter : integer := 0;
  begin
    while counter < 9 loop
      case( counter ) is

        when 0 => theta <= (others => '0');
        when 1 => theta <= x"01";
        when 2 => theta <= x"02";
        when 3 => theta <= x"04";
        when 4 => theta <= x"08";
        when 5 => theta <= x"10";
        when 6 => theta <= x"20";
        when 7 => theta <= x"40";
        when 8 => theta <= x"80";
        when 9 => theta <= x"FF";
        when others => theta <= (others => '0');

      end case;
      wait until rising_edge (clk);
      counter := counter + 1;
    end loop;
  end process;

   clk_process :process
   begin
     clk <= '1';
     wait for clk_period/2;
     clk <= '0';
     wait for clk_period/2;
   end process;

end;
