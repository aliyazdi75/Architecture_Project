----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:53:29 04/12/2017 
-- Design Name: 
-- Module Name:    alu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           cin : in  STD_LOGIC;
           opr : in  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           alu_out : out  STD_LOGIC_VECTOR (15 downto 0);
           zout : out  STD_LOGIC);
end alu;

architecture Behavioral of alu is

component ali16BFA is
   Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component comprator1Bit is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           l : in  STD_LOGIC;
           e : in  STD_LOGIC;
           g : in  STD_LOGIC;
           lt : out  STD_LOGIC;
           eq : out  STD_LOGIC;
           gta : out  STD_LOGIC);
end component comprator1Bit;

	signal alu_and, alu_or, alu_src, alu_slc, alu_cmp, alu_xor, alu_add, alu_sub : STD_LOGIC_VECTOR (15 downto 0);  
	signal cout_add, cout_sub, alu_cmp_eq, alu_cmp_gt, alu_cmp_lt : STD_LOGIC;
begin
	
	alu_and <= a and b;
	alu_or <= a or b;
	alu_xor <= a xor b;
	adder: ali16BFA port map(a,b,cin,cout_add,alu_add);
	sub: ali16BFA port map(a,not(b),cin,cout_sub,alu_sub);
	cmp: comprator1Bit port map(a,b,'0','1','0',alu_cmp_lt,alu_cmp_eq,alu_cmp_gt);
	
end Behavioral;

