----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.06.2019 20:05:30
-- Design Name: 
-- Module Name: t_flip_flop - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity t_flip_flop is
    Port ( T : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Q : out STD_LOGIC);
end t_flip_flop;

architecture Behavioral of t_flip_flop is
    signal data : std_logic;
begin

    process(CLK)
        begin
            if (rising_edge(CLK)) then
                if (T='0') then
                    data<=data;
                elsif (T='1') then
                    data<=not data;
                end if;
            end if;
    end process;
    Q<=data;

end Behavioral;
