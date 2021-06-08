-- Binary Multiplier with n = 4: VHDL Description

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity control_unit is
   port(CLK, RESET,G : in std_logic;
     INA,INB,INC,IND,INE,INF,ING,INH,INI,INJ: in std_logic_vector(7 downto 0);
     S_IN: in std_logic_vector(2 downto 0);
     Cin_in: in std_logic;
     SUM_OUT,SUM_OUT1,SUM_OUT2,SUM_OUT3,SUM_OUT4: out std_logic_vector(7 downto 0);
     Cout_OUT,Cout_OUT1,Cout_OUT2,Cout_OUT3,Cout_OUT4: out std_logic);
end control_unit;

architecture behavior_4 of control_unit is
component eight 
Port (
        A_e_Alu : in STD_LOGIC_VECTOR(7 downto 0);
        B_e_Alu : in STD_LOGIC_VECTOR(7 downto 0);
        S_e_Alu : in STD_LOGIC_VECTOR(2 downto 0);
        Cin_e_Alu : in STD_LOGIC;
        Output_e : out STD_LOGIC_VECTOR(7 downto 0);
        Cout_e_Alu : out STD_LOGIC);
end component;
   type state_type is (IDLE, MUL0);
   signal state, next_state : state_type;
   signal A,B,A1,B1,A2,B2,A3,B3,A4,B4,Sum,Sum1,Sum2,Sum3,Sum4,O,O1,O2,O3,O4,O5: std_logic_vector(7 downto 0);
   signal C,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,Z: std_logic;
   Signal Counter : integer:=0;
   signal P: std_logic_vector(2 downto 0);
   signal S,S1,S2,S3,S4: std_logic_vector(2 downto 0);

begin
AL : eight port map(A_e_Alu =>A,B_e_Alu =>B,S_e_Alu =>S,Cin_e_Alu =>C,Output_e =>O,Cout_e_Alu =>C1); 
AL1 : eight port map(A_e_Alu =>A1,B_e_Alu =>B1,S_e_Alu =>S,Cin_e_Alu =>C,Output_e =>O1,Cout_e_Alu =>C3); 
AL2 : eight port map(A_e_Alu =>A2,B_e_Alu =>B2,S_e_Alu =>S,Cin_e_Alu =>C,Output_e =>O2,Cout_e_Alu =>C5);
AL3 : eight port map(A_e_Alu =>A3,B_e_Alu =>B3,S_e_Alu =>S,Cin_e_Alu =>C,Output_e =>O3,Cout_e_Alu =>C7); 
AL4 : eight port map(A_e_Alu =>A4,B_e_Alu =>B4,S_e_Alu =>S,Cin_e_Alu =>C,Output_e =>O4,Cout_e_Alu =>C9);   
 state_register: process (CLK, RESET)
   begin
    if (RESET = '1') then
        state <= IDLE;
    elsif (CLK'event and CLK = '1') then
        state <= next_state;
    end if;
   end process;
 
   next_state_func: process (state)
   begin
     case state is
        when IDLE =>
          if G = '1' then
            next_state <= MUL0;
          else
            next_state <= IDLE;
          end if;
 
        when MUL0 =>
           next_state <= MUL0;
     end case;
   end process;
 
   datapath_func: process (CLK)
   variable CA: std_logic_vector(4 downto 0);
   begin
      if (CLK'event and CLK = '1') then
        
 
      case state is
      
           when IDLE =>
             if G = '1' then
                A <= INA;
                B <= INB;
                S <= S_IN;
                C <= Cin_IN;
                Sum <= O;
                C2 <= C1;
                A1 <= INC;
                B1 <= IND;
                Sum1 <= O1;
                C4 <= C3;                        
                A2 <= INE;
                B2 <= INF;
                Sum2 <= O2;
                C6 <= C5;                        
                A3 <= ING;
                B3 <= INH;
                Sum3 <= O3;
                C8 <= C7;                        
                A4 <= INI;
                B4 <= INJ;
                Sum4 <= O4;
                C10 <= C9; 
                
             end if;
           when MUL0 =>
             P <= "111";

            
      end case;
    end if;
   end process;
      SUM_OUT<=Sum;
      SUM_OUT1<=Sum1;
      SUM_OUT2<=Sum2;
      SUM_OUT3<=Sum3;
      SUM_OUT4<=Sum4;
      Cout_OUT <= C2;
      Cout_OUT1 <= C4;
      Cout_OUT2 <= C6;
      Cout_OUT3 <= C8;
      Cout_OUT4 <= C10;
end behavior_4;