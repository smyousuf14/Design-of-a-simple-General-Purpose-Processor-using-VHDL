LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ssegMod IS
	PORT (bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			leds : OUT STD_LOGIC_VECTOR(0 TO 6)
			);
	END ssegMod;
		
ARCHITECTURE Behavior OF ssegMod IS
BEGIN
PROCESS ( bcd )
BEGIN
CASE bcd IS        -- abcdefg
WHEN "0000"  =>leds<=not"0111011"; -- Yes
WHEN "0001"  =>leds<=not"0010101"; -- NO
WHEN OTHERS => leds <= "-------";
END CASE;
END PROCESS;
END Behavior;

