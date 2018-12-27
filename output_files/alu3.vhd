library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity alu3 is
port (clock : in std_logic;
		a,b : in unsigned(7 downto 0);
	   student_id: in unsigned (3 downto 0); 
	   op: in unsigned (15 downto 0);
	   results: out unsigned (3 downto 0)); 
end alu3;

architecture calculation of alu3 is 
signal reg1,reg2, result: unsigned(7 downto 0):= (others => '0');
signal reg4: unsigned (0 to 7);
begin 
reg1 <= a;
reg2 <= b;

process(clock,op)
begin 
	if(rising_edge(clock)) then 
	
	   -- Check if any digit is less than fsm output
		if("0011" < student_id) then
		
			results <= "0000";
		elsif("1001" < student_id) then
		
			results <= "0000";
			
		else 
		
			results <= "0001";
		end if;
			

		
		
	
			end if;
			end process;
			
end calculation;

 