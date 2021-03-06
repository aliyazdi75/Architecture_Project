----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:05:07 04/16/2017 
-- Design Name: 
-- Module Name:    ir - Behavioral 
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

entity ir is
    Port ( ir_inp : in  STD_LOGIC_VECTOR (15 downto 0);
           ir_load : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           ir_out : out  STD_LOGIC_VECTOR (15 downto 0));
end ir;

architecture Behavioral of ir is

begin

	SEQ: process(clk)
   begin
      if (rising_edge(clk) and ir_load='1') then
         ir_out <= ir_inp;
      end if;
   end process;

end Behavioral;

