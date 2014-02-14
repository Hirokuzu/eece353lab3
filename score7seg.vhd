LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY score7seg IS
	PORT(
		score : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);  -- score (0 to 9)
		seg7 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)   -- top seg 'a' = bit0, proceed clockwise
	);
END;


ARCHITECTURE behavioral OF score7seg IS
BEGIN
    
    case(score) is
        when "0000" => seg7 <= "1000000";
        when "0001" => seg7 <= "1111001";
        when "0010" => seg7 <= "0100100";
        when "0011" => seg7 <= "0110000";
        when "0100" => seg7 <= "0011001";
        when "0101" => seg7 <= "0010010";
        when "0110" => seg7 <= "0000010";
        when "0111" => seg7 <= "1111000";
        when "1000" => seg7 <= "0000000";
        when "1001" => seg7 <= "0010000";
        when others => seg7 <= "0000110"; -- error with a big E for 14,15,16
    end case
   -- your code goes here.  Hint: this is a simple combinational block
   -- like you did in Lab 1.  If you find this difficult, you are on the
   -- wrong track.


END;
