---------------------------------------------------
-- Simple ALU Module (ESD book Figure 2.5)		
-- by Weijun Zhang, 04/2001
--
-- ALU stands for arithmatic logic unit.
-- It perform multiple operations according to 
-- the control bits.
-- we use 2's complement subraction in this example
-- two 2-bit inputs & carry-bit ignored
---------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

---------------------------------------------------

entity ALU is

port(	A:	in std_logic_vector(7 downto 0);
	B:	in std_logic_vector(7 downto 0);
	Sel:	in std_logic_vector(2 downto 0);
	Res:	out std_logic_vector(7 downto 0)  
);

end ALU;

---------------------------------------------------

architecture behv of ALU is
begin					   

    process(A,B,Sel)
    begin
    
	-- use case statement to achieve 
	-- different operations of ALU

	case Sel is
	    when "000" =>
		Res <= A + B;
	    when "001" =>						
	        Res <= A + (not B) + 1;
            when "010" =>
		Res <= A and B;
	    when "011" =>	 
		Res <= A or B;
		when "100" =>
		Res <= A xor B;
		when "101" =>
		Res <= not (A xor B);
	    when others =>	 
		Res <= "XXXXXXXX";
        end case;

    end process;

end behv;

----------------------------------------------------
