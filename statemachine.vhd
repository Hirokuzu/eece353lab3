LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- ensure components in other 'vhd' project files can be included  
LIBRARY WORK;
USE WORK.ALL;

ENTITY statemachine IS
	PORT(

	    slow_clock : IN STD_LOGIC;
		resetb : IN STD_LOGIC;
		
		dscore, pscore : IN STD_LOGIC_VECTOR(3 downto 0);
		pcard3 : IN STD_LOGIC_VECTOR(3 downto 0);
		
		load_pcard1, load_pcard2, load_pcard3 : OUT STD_LOGIC;
		load_dcard1, load_dcard2, load_dcard3 : OUT STD_LOGIC;
		
  		LEDG : OUT STD_LOGIC_VECTOR(1 downto 0)	
	);
END statemachine;


ARCHITECTURE behavioural OF statemachine IS

-- Your code goes here.  This is the most challenge of all the files
-- to write.

    process(slow_clock, resetb) --asynchronous reset?
        type game_state is (reset, deal_player_1, deal_player_2, deal_player_3, deal_dealer_1, deal_dealer_2, deal_dealer_3, determine_victor);
        variable current_game_state: game_state := reset;
    begin
        if(rising_edge(resetb)) then
            current_game_state := reset;
        else if(rising_edge(slow_clock)) then
            case(current_game_state) is
                when 
        end if
    end process;

END;
