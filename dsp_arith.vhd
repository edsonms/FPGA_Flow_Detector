LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

package dsp_arith is

  CONSTANT MIN_16 : signed (15 DOWNTO 0) := X"8000";
  CONSTANT MAX_16 : signed (15 DOWNTO 0) := X"7FFF";
  CONSTANT MIN_32 : signed (31 DOWNTO 0) := X"80000000";
  CONSTANT MAX_32 : signed (31 DOWNTO 0) := X"7FFFFFFF";

  function add_16bit_WithOverflowControl(var1,var2:signed) return signed;
  function sub_16bit_WithUnderflowControl(var1,var2:signed) return signed;
  function add_32bit_WithOverflowControl(var1,var2:signed) return signed;
  function sub_32bit_WithUnderflowControl(var1,var2:signed) return signed;
  function round_to_16bit(var1:signed) return signed;

end package dsp_arith;

package body dsp_arith is

  function add_16bit_WithOverflowControl(var1,var2:signed) return signed is
    variable temp : signed (15 downto 0);
    variable temp2 : signed (15 downto 0);
    variable comparator1 : std_logic;
    variable comparator2 : std_logic;
    begin

      temp := var1+var2;
      comparator1 := var1(15) xnor var2(15);
      comparator2 := var1(15) xnor temp(15);

      if (comparator2='1' or comparator1='0')then
        temp2 := temp;
      elsif (var1(15) = '1') then
        temp2:= MIN_16;
      else
        temp2:= MAX_16;
      end if;
      return temp2;

  end function add_16bit_WithOverflowControl;

  function sub_16bit_WithUnderflowControl(var1,var2:signed) return signed is
    variable temp : signed (15 downto 0);
    variable temp2 : signed (15 downto 0);
    variable comparator1 : std_logic;
    variable comparator2 : std_logic;
    begin
      temp := var1-var2;
      comparator1 := var1(15) xor var2(15);
      comparator2 := var1(15) xnor temp(15);
      if (comparator2='1' or comparator1='0')then
        temp2 := temp;
      elsif (var1(15) = '1') then
        temp2:= MIN_16;
      else
        temp2:= MAX_16;
      end if;
      return temp2;
  end function sub_16bit_WithUnderflowControl;

  function add_32bit_WithOverflowControl(var1,var2:signed) return signed is
    variable temp : signed (31 downto 0);
    variable temp2 : signed (31 downto 0);
    variable comparator1 : std_logic;
    variable comparator2 : std_logic;
    begin

      temp := var1+var2;
      comparator1 := var1(31) xnor var2(31);
      comparator2 := var1(31) xnor temp(31);

      if (comparator2='1' or comparator1='0')then
        temp2 := temp;
      elsif (var1(31) = '1') then
        temp2:= MIN_32;
      else
        temp2:= MAX_32;
      end if;
      return temp2;

  end function add_32bit_WithOverflowControl;

  function sub_32bit_WithUnderflowControl(var1,var2:signed) return signed is
    variable temp : signed (31 downto 0);
    variable temp2 : signed (31 downto 0);
    variable comparator1 : std_logic;
    variable comparator2 : std_logic;
    begin
      temp := var1-var2;
      comparator1 := var1(31) xor var2(31);
      comparator2 := var1(31) xnor temp(31);

      if (comparator2='1' or comparator1='0')then
        temp2 := temp;
      elsif (var1(31) = '1') then
        temp2:= MIN_32;
      else
        temp2:= MAX_32;
      end if;
      return temp2;

  end function sub_32bit_WithUnderflowControl;

  function round_to_16bit(var1:signed) return signed is
    variable temp : signed (31 downto 0);
    begin
      temp := add_32bit_WithOverflowControl(var1, X"00008000");
      return temp(31 downto 16);
  end function round_to_16bit;

end package body;
