LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- ensure components in other 'vhd' project files can be included  
LIBRARY WORK;
USE WORK.ALL;

ENTITY reg4 IS

    PORT(
        slow_clock : IN STD_LOGIC;
        resetb : IN STD_LOGIC;
        en : IN STD_LOGIC;
        card_in : IN STD_LOGIC_VECTOR(3 downto 0);
        card_store : OUT STD_LOGIC_VECTOR(3 downto 0)
    );
END reg4;

ARCHITECTURE behavioural OF reg4 IS
BEGIN
    process(slow_clock,resetb)
    begin
        if(falling_edge(resetb)) then
            card_store <= "0000";
        elsif(rising_edge(slow_clock)) then
            if(en = '1') then
                card_store <= card_in;
            end if;
        end if;
    end process;
END behavioural;