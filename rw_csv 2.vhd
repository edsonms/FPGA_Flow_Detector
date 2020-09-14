--! Standard library.
library ieee;
--! Logic elements.
use ieee.std_logic_1164.all;
--! Arithmetic functions.
use ieee.numeric_std.all;
--
use std.textio.all;
--use ieee.std_logic_textio.all;

package rw_csv is

  constant row_max                                 : integer := 2048;  -- This number has to be adapted according to the file to be read, because the function needs to define the return type in the function delcaration
  constant col_max                                 : integer := 1;  -- This number has to be adapted according to the file to be read, because the function needs to define the return type in the function delcaration
  type array_2D is array (row_max-1 downto 0, col_max-1 downto 0)of integer;
  impure function complex_write(file file_variable : text; n_line : integer; value : array_2D; value2 : array_2D)return boolean;
  impure function read_integer(file file_variable  : text; n_cols : integer) return array_2D;
  --function read_std_logic_vector(file_address: text, n_rows: integer,n_cols:integer) return array of std_logic_vector;

end package;

package body rw_csv is

  impure function complex_write(file file_variable : text; n_line : integer; value : array_2D; value2 : array_2D) return boolean is
    variable current_line : line;
    file dummy_file       : text open write_mode is "dummy_file.txt";
    variable write_ack    : boolean := true;
    variable i            : integer := 0;

  begin
    for i in 0 to n_line-1 loop
        write(current_line, integer'image(value(i,0)));
        write(current_line, string'(","));
        write(current_line, integer'image(value2(i,0)));
        writeline(file_variable, current_line);
    end loop;
    return write_ack;
  end function complex_write;


  -- read_integer
  -- read a csv file composed of integer (2^32) values.
  -- file_variable: the text file to be read. Should be opened before calling this function using file_open
  -- n_cols: number of columns of the csv file
  -- return an array of integer corresponding to all the values of the csv file
  impure function read_integer(file file_variable : text; n_cols : integer) return array_2D is
    variable current_line : line;
    variable dummy_char   : character;
    variable read_out     : array_2D;
    variable read_ack     : boolean := true;
    variable i            : integer := 0;

  begin

    while not(endfile(file_variable)) loop
      -- read a line from the input file
      readline(file_variable, current_line);
      for j in 0 to (n_cols-1) loop
        if(read_ack = true)then
          read(current_line, read_out(i, j), read_ack);
        end if;
        if(read_ack = false)then        -- comma carachter
          read(current_line, dummy_char, read_ack);
          read(current_line, read_out(i, j), read_ack);
        elsif(not(read_ack = true))then
          exit;
        end if;
      end loop;
      i := i + 1;
    end loop;

    return read_out;

  end function read_integer;

end package body;
