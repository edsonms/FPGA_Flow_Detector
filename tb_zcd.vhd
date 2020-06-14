--! Standard library.
library ieee;
--! Logic elements.
use ieee.std_logic_1164.all;
--! Arithmetic functions.
use ieee.numeric_std.all;
--
use std.textio.all;
use ieee.std_logic_textio.all;
use work.frame_packg.all;
use work.wr_csv.all;


entity zcd_tb is
end;

architecture bench of zcd_tb is

  -- Generics
  -- clock period
  constant clk_period   : time := 5 ns;
  constant start_period : time := 125 us;

  -- Signal ports
  signal clk_in     : std_logic;
  signal start      : std_logic;
  signal frame_in   : frame_typ;
  signal rdy        : std_logic;
  signal zcd_result : unsigned (8 downto 0);

  component zcd is
    port (
      clk_in     : in  std_logic;
      start      : in  std_logic;
      frame_in   : in  frame_typ;
      rdy        : out std_logic;
      zcd_result : out unsigned (8 downto 0)
      );
  end component;



begin
  -- Instance
  zcd_i : zcd
    port map (
      clk_in     => clk_in,
      start      => start,
      frame_in   => frame_in,
      rdy        => rdy,
      zcd_result => zcd_result
      );

  main : process
    file my_csv_file      : text;
    variable current_line : line;
    variable read_ok      : boolean;
    variable read_char    : character;
    variable x            : work.wr_csv.array_2D;
    variable x_i          : integer;
    variable counter      : integer := 0;

  begin
    file_open(my_csv_file, "SAMPLES.CSV", read_mode);
    wait until rising_edge (start);
    x := read_integer(my_csv_file, 1);
    while counter < 2048 loop
      for i in 0 to 255 loop
        x_i         := x(counter, 0);
        frame_in(i) <= to_signed(x_i, 16);
        counter     := counter+1;
      end loop;
      wait for 125 us;
    end loop;
  end process;

  clk_process : process
  begin
    clk_in <= '1';
    wait for clk_period/2;
    clk_in <= '0';
    wait for clk_period/2;
  end process;

  start_process : process
  begin
    start <= '1';
    wait for start_period/2;
    start <= '0';
    wait for start_period/2;
  end process;

end;
