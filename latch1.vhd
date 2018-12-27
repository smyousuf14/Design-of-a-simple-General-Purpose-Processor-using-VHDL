LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY latch1 IS
		PORT (A: IN std_logic_vector(7 DOWNTO 0); -- 8 bit A input
				resetn, clock : in std_logic; -- 1 bit clock input and 1 bit reset input bit
				Q: out std_logic_vector(7 downto 0));
		End latch1;
		
Architecture behavior of latch1 is 
begin 
	process (resetn, clock) -- Process takes reset and clock as input
	begin 
		if resetn = '0' then -- when reset input is 0 the latch does not operate 
			Q <= "00000000";
		elsif clock'event and clock = '1' then -- level sensitive based on clock
			Q <= A;
			
		end if ;
	end process;
end behavior;
		