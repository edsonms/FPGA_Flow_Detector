--! Standard library.
library ieee;
--! Logic elements.
use ieee.std_logic_1164.all;
--! Arithmetic functions.
use ieee.numeric_std.all;
--
library std;
use std.textio.all;
--
library src_lib;
-- use src_lib.types_declaration_zcd_pkg.all;
-- vunit
library vunit_lib;
context vunit_lib.vunit_context;
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

entity zcd_tb is
  --vunit
  generic (runner_cfg : string);
end;

architecture bench of zcd_tb is

  -- Generics
  -- clock period
  constant clk_period : time := 5 ns;
  -- Signal ports

begin
  -- Instance
  zcd_i : entity src_lib.zcd;

  main : process
  begin
    test_runner_setup(runner, runner_cfg);
    while test_suite loop
      if run("test_alive") then
        info("Hello world test_alive");
        wait for 100 ns;
        test_runner_cleanup(runner);

      elsif run("test_0") then
        info("Hello world test_0");
        wait for 100 ns;
        test_runner_cleanup(runner);
      end if;
    end loop;
  end process;

  -- clk_process :process
  -- begin
  --   clk <= '1';
  --   wait for clk_period/2;
  --   clk <= '0';
  --   wait for clk_period/2;
  -- end process;

end;
