library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity alu2 is
port (clock : in std_logic;
		a,b : in unsigned(7 downto 0);
	   student_id: in unsigned (3 downto 0); 
	   op: in unsigned (15 downto 0);
	   neg: out std_logic;
	   r1: out unsigned (3 downto 0);
	   r2: out unsigned (3 downto 0)); 
end alu2;

architecture calculation1 of alu2 is 
signal reg1,reg2, result: unsigned(7 downto 0):= (others => '0');
signal reg4: unsigned (0 to 7);
begin 
reg1 <= a;
reg2 <= b;

process(clock,op)
begin 
	if(rising_edge(clock)) then 
	
	neg <= '0';
		case op is 
			when "0000000000000001" =>
				-- inverse the bit significance order of A.
				result(7) <= reg1(0);
				result(6) <= reg1(1);
				result(5) <= reg1(2);
				result(4) <= reg1(3);
				result(3) <= reg1(4);
				result(2) <= reg1(5);
				result(1) <= reg1(6);
				result(0) <= reg1(7);
				
				
				
			when "0000000000000010" =>
			--shift A to left by 4 bits
			result(7) <= reg1(3);
			result(6) <= reg1(2);
			result(5) <= reg1(1);
			result(4) <= reg1(0);
			result(3) <= reg1(7);
			result(2) <= reg1(6);
			result(1) <= reg1(5);
			result(0) <= reg1(4);
			
			
				-- Shift A to left by 4 bits, input bit = 1(SHL)
				
			
		    when "0000000000000100" =>
			
				-- invert upper four bits of B
				result(7) <= (reg2(7));
				result(6) <= (reg2(6));
				result(5) <= (reg2(5));
				result(4) <= (reg2(4));
				result(3) <= not(reg2(3));
				result(2) <= not(reg2(2));
				result(1) <= not(reg2(1));
				result(0) <= not(reg2(0));
				
				
			when "0000000000001000" =>
				
				-- Find the smaller value of A and B and produce the results (MIN(A,B))
				if(reg1 > reg2) then
					
					result <= reg2;
					
				else
				
					result <= reg1;
				end if;	
				
				
			when "0000000000010000" =>
			-- Summation and then add 4 
				result <= reg1 + reg2 + (00000100);
			
			when "0000000000100000" =>
			-- Increment A by 3 
			result <= reg1 + 00000011;
				
				
			when "0000000001000000" =>
			
			--replace even bits of a by even bits of b
			result(0) <= reg2(0);
			result(2) <= reg2(2);
		   result(4) <= reg2(4);
		   result(6) <= reg2(6);
		   result <= reg1; 
				
				
			when "0000000010000000" =>
			-- XNOR of AB
			result <= reg1 xnor reg2;			
			
			
			when "0000000100000000" =>
			--Rotate B 3 units to right
			result(5) <= reg1(0);
				result(6) <= reg2(1);
				result(7) <= reg2(2);
				result(0) <= reg2(3);
				result(1) <= reg2(4);
				result(2) <= reg2(5);
				result(3) <= reg2(6);
				result(4) <= reg2(7);
			
			when others => result <= result;
			end case;
			
			end if;
			end process;
			
			r1 <= result(3 downto 0);
			r2 <= result(7 downto 4);
			
end calculation1;

 