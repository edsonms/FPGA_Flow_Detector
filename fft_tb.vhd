--! Standard library.
library ieee;
--! Logic elements.
use ieee.std_logic_1164.all;
--! Arithmetic functions.
use ieee.numeric_std.all;
--
package frame_packg is
  constant N   : integer := 256;          -- FFT N.o of points
  constant NM1 : integer := 255;          -- N-1
  constant ND2 : integer := 128;          -- N/2
  constant M   : integer := 8;          -- M = log(N)/log(2) // for N=256, M=8
--type frame_typ is array (NM1 downto 0) of signed(15 downto 0);
end package frame_packg;

--! Standard library.
library ieee;
--! Logic elements.
use ieee.std_logic_1164.all;
--! Arithmetic functions.
use ieee.numeric_std.all;

library std;
use std.textio.all;

use work.rw_csv.all;
use work.frame_packg.all;
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
  signal clock      : std_logic                     := '0';
  signal acquire    : std_logic                     := '0';
  signal start      : std_logic                     := '0';
  signal sample     : std_logic_vector(15 downto 0) := x"0000";
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
      sample     => sample,
      bitrev_rdy => bitrev_rdy,
      fft_rdy    => fft_rdy,
      out_addr   => out_addr,
      out_we     => out_we,
      re_x       => re_x,
      im_x       => im_x
      );

  process(clock, acquire)
  begin
    clock   <= not(clock)   after 30 ns; -- 33.33MHz
    acquire <= not(acquire) after 500 us;  -- 1khz
  end process;


  process
    file my_csv_file : text;
    variable x       : work.rw_csv.array_2D;
    variable counter : integer := 0;
  begin
    file_open(my_csv_file, "SAMPLE_Corrigida.CSV", read_mode);
    x := read_integer(my_csv_file, 1);
    wait until acquire = '1' and acquire'event;
    while not(counter > 2048) loop
      sample  <= std_logic_vector(to_signed(x(counter, 0), 16));
      counter := counter+1;
      wait for 1 ms;
    end loop;
    file_close(my_csv_file);
  end process;

  main : process
    file outfile        : text;
    variable out_line   : line;
    variable aux1, aux2 : integer := 1;
    variable ack        : boolean;
    variable counter2   : integer:=0;
    variable add_last_value : std_logic_vector(7 downto 0):= x"FF";
    variable re_last_value : std_logic_vector(15 downto 0) := (others => 'X');
    variable im_last_value : std_logic_vector(15 downto 0) := (others => 'X');
    variable y_real : work.rw_csv.array_2D;
    variable y_imag : work.rw_csv.array_2D;

  begin
    start <= '1' after 500 ns;

      wait until rising_edge (clock);
      if(fft_rdy='1')then
        aux1:=0;
      end if;

      if (out_we = '1' and aux1=0) then
          if((add_last_value /= out_addr) or (re_last_value /= re_x) or (im_last_value /= im_x))then
            y_real(to_integer(unsigned(out_addr)),0):=to_integer(signed(re_x));
            y_imag(to_integer(unsigned(out_addr)),0):=to_integer(signed(im_x));
            counter2:=counter2+1;
            add_last_value := out_addr;
            re_last_value := re_x;
            im_last_value := im_x;
          end if;
      end if;

      if(fft_rdy='1' and aux1=0)then
        file_open(outfile, "fft_output.csv", write_mode);
        ack := complex_write(outfile,work.frame_packg.N, y_real,y_imag);
        file_close(outfile);
      end if;

  end process;

end;
