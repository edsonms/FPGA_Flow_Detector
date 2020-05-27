--! Standard library.
library ieee;
--! Logic elements.
use ieee.std_logic_1164.all;
--! Arithmetic functions.
use ieee.numeric_std.all;
--
--use work.frame_packg.all;

library std;
use std.textio.all;
--
--library src_lib;
--use src_lib.types_declaration_fft_pkg.all;
-- vunit
--library vunit_lib;
--context vunit_lib.vunit_context;
-- use vunit_lib.array_pkg.all;
-- use vunit_lib.lang.all;
-- use vunit_lib.string_ops.all;
-- use vunit_lib.dictionary.all;
-- use vunit_lib.path.all;
-- use vunit_lib.log_types_pkg.all;
-- use vunit_lib.log_special_types_pkg.all;
-- use vunit_lib.log_pkg.all;
-- use vunit_lib.check_types_pkg.all;
-- use vunit_lib.check_special_types_pkg.all;
-- use vunit_lib.check_pkg.all;
-- use vunit_lib.run_types_pkg.all;
-- use vunit_lib.run_special_types_pkg.all;
-- use vunit_lib.run_base_pkg.all;
-- use vunit_lib.run_pkg.all;

entity fft_tb is
  --vunit
  --generic (runner_cfg : string);
end;

architecture bench of fft_tb is

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



  -- Signal ports
    signal clock      : std_logic := '0';
  signal acquire    : std_logic := '0';
  signal start      : std_logic := '0';
  signal sample     : unsigned(15 downto 0) := x"0000";
  signal bitrev_rdy : std_logic;
  signal fft_rdy    : std_logic;
  signal out_addr   : std_logic_vector(7 downto 0);
  signal out_we     : std_logic;
  signal re_x       : std_logic_vector(15 downto 0);
  signal im_x       : std_logic_vector(15 downto 0);

begin
  -- Instance
  fft_i : fft
  port map (
    clock      => clock,
    acquire    => acquire,
    start      => start,
    sample     => std_logic_vector(sample),
    bitrev_rdy => bitrev_rdy,
    fft_rdy    => fft_rdy,
    out_addr   => out_addr,
    out_we     => out_we,
    re_x       => re_x,
    im_x       => im_x
  );

  process(clock,acquire)
	begin
		clock  <= NOT(clock) AFTER 20 ns;
		acquire <= NOT(acquire) AFTER 500 ns;
	end process;


  main : process
  begin
    start <= '1' after 40 ns;
    wait until rising_edge (clock);
    if (sample = x"0000")then
      sample <= x"0001" after 400 ns;
    elsif (sample < x"0004")then
      sample <= (sample + x"0001") after 1 us;
    else
      sample <= x"0001" after 1 us;
    end if;

    --test_runner_setup(runner, runner_cfg);
    --while test_suite loop
      --if run("test_alive") then
        --info("Hello world test_alive");
        --wait for 100 ns;
        --test_runner_cleanup(runner);

      --elsif run("test_0") then
        --info("Hello world test_0");
        --wait for 100 ns;
        --test_runner_cleanup(runner);
      --end if;
  --  end loop;
  end process;

end;
