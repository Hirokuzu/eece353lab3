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
                when reset => -- the loads are done this way to make sense of the order
                    load_pcard1 <= '0';
                    load_dcard1 <= '0';
                    load_pcard2 <= '0';
                    load_dcard2 <= '0';
                    load_pcard3 <= '0';
                    load_dcard3 <= '0';
                    LEDG <= "00";
                    current_game_state := deal_player_1;
                when deal_player_1 =>
                    load_pcard1 <= '1';
                    current_game_state := deal_dealer_1;
                when deal_dealer_1 =>
                    load_pcard1 <= '0';
                    load_dcard1 <= '1';
                    current_game_state := deal_player_2;
                when deal_player_2 =>
                    load_dcard1 <= '0';
                    load_pcard2 <= '1';
                    current_game_state := deal_dealer_2;
                when deal_dealer_2 =>
                    load_pcard2 <= '0';
                    load_dcard2 <= '1';
                    if((dscore > "1000") or (pscore > "1000")) then
                        current_game_state := determine_victor;
                    else if((pscore >= "0000") and (pscore <= "0101")) then
                        current_game_state := deal_player_3;
                    else if((pscore >= "0110") and (pscore <= "0111")) then
                        if((dscore >= "0000") and (dscore <= "0101")) then
                            current_game_state := deal_dealer_3;
                        end if;
                    end if;
                when deal_player_3 =>
                    load_dcard_2 <= '0';
                    load_pcard_3 <= '1';
                    -- tons of crap here...
                    if((dscore >= "0000") and (dscore <= "0010") then
                        current_game_state := deal_dealer_3;
                    else if(dscore = "0011") then
                        if(pcard3 = 8) then
                            current_game_state := determine_winner;
                        else
                            current_game_state := deal_dealer_3;
                        end if;
                    else if(dscore = "") then
                    else if(dscore = "") then
                    else if(dscore = "") then
                    else if(dscore = "") then
                    end if;
                when deal_dealer_3 =>
                    load_pcard_2 <= '0'; -- dunno which state it came from, so gotta make sure its zero
                    load_pcard_3 <= '0';
                    load_dcard_3 <= '1';
                when determine_victor =>
            end case;
        end if;
    end process;

END;