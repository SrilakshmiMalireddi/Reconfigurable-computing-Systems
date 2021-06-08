library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity tb_control_unit is
end tb_control_unit;

architecture bench of tb_control_unit is

component control_unit is
   port(CLK, RESET,G : in std_logic;
  INA,INB,INC,IND,INE,INF,ING,INH,INI,INJ: in std_logic_vector(7 downto 0);
  S_IN: in std_logic_vector(2 downto 0);
  Cin_in: in std_logic;
  SUM_OUT,SUM_OUT1,SUM_OUT2,SUM_OUT3,SUM_OUT4: out std_logic_vector(7 downto 0);
  Cout_OUT,Cout_OUT1,Cout_OUT2,Cout_OUT3,Cout_OUT4: out std_logic);
end component;

  signal CLK, RESET,G: std_logic;
  signal INA: std_logic_vector(7 downto 0);
  signal INB,INC,IND,INE,INF,ING,INH,INI,INJ: std_logic_vector(7 downto 0);
  signal S_IN: std_logic_vector(2 downto 0);
  signal Cin_IN: std_logic;
  signal SUM_OUT,SUM_OUT1,SUM_OUT2,SUM_OUT3,SUM_OUT4: std_logic_vector(7 downto 0);
  signal Cout_OUT,Cout_OUT1,Cout_OUT2,Cout_OUT3,Cout_OUT4: std_logic;
  

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  -- Insert values for generic parameters !!
  uut: control_unit    port map (      CLK      => CLK,
                                       RESET    => RESET,
                                       G        =>     G,
                                       INA    => INA,
                                       INB    => INB,
                                       INC =>    INC,
                                       IND    => IND,
                                       INE =>    INE,
                                       INF    => INF,
                                       ING =>    ING,
                                       INH    => INH,
                                       INI =>    INI,
                                       INJ    => INJ,                                       
                                       S_IN => S_IN,
                                       Cin_IN => Cin_IN,                                       
                                       SUM_OUT => SUM_OUT,
                                       SUM_OUT1 => SUM_OUT1,
                                       SUM_OUT2 => SUM_OUT2,
                                       SUM_OUT3 => SUM_OUT3,
                                       SUM_OUT4 => SUM_OUT4,                                       
                                       Cout_OUT => Cout_OUT,
                                       Cout_OUT1 => Cout_OUT1,
                                       Cout_OUT2 => Cout_OUT2,
                                       Cout_OUT3 => Cout_OUT3,
                                       Cout_OUT4 => Cout_OUT4);

  stimulus: process
  begin
  
    -- Put initialisation code here
    wait for 10ns;
    G<='1';
    INA <="00001101";
    INB <="00001011";
    INC <="00000101";
    IND <="00000001";
    INE <="00001111";
    INF <="00000001";
    ING <="00000101";
    INH <="00000001";
    INI <="00001111";
    INJ <="00000001";

    S_IN <= "001";
    Cin_IN <= '0';
    CLK<='1';
    RESET<='0';
    wait for 200ns;
    G<='0';
    RESET<='1';
    


    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      CLK <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end bench;