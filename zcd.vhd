package frame_packg is
  constant frame_size : integer := 255
  type frame_typ is array (frame_size downto 0) of signed(15 downto 0);
end package frame_packg;

library.ieee;
use iee.std_logic_1164.all;
use iee.numeric_std.all;
use work.frame_packg.all;

entity zcd is
  port
    (
      clk_in: in std_logic;
      start: in std_logic;
      frame_in: in frame_typ;
      rdy : out;
      zcd_result: out unsigned (8 downto 0)
    );

architecture behaviour of zcd is

  signal frame_buffer : frame_typ;
  signal counter: range frame_size downto 0 := 1;
  signal zcd_result_buff: unsigned (8 downto 0);

begin

  frame_buffer <= frame_in;
  zcd_result <= zcd_result_buff;


  reset : process(start)
  begin
    if (start'event and start = '0')then
      frame_buffer <= (others => (others => '0'));
      zcd_result_buff <= (others => '0');
      counter <= 1;
    end if;
  end process;

  computing : process(clk_in)
  begin
    if (clk_in'event and clk_in = '1')then
      if(counter < frame_size + 1)then
        zcd_result_buff <= zcd_result_buff + '1' when frame_buffer(counter)(15)!=frame_buffer(counter-1)(15) else
          zcd_result_buff;
        counter <= counter + 1;
      else
        zcd_result_buff <= zcd_result_buff;
      end if;
    end if;

  end process;

end architecture;
