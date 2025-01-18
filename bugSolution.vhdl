```vhdl
ENTITY multiplier IS
  PORT ( 
    clk : IN  STD_LOGIC;
    rst : IN  STD_LOGIC;
    a   : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    b   : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    prod: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END ENTITY;

ARCHITECTURE behavioral OF multiplier IS
  SIGNAL temp_prod : UNSIGNED(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL a_unsigned : UNSIGNED(7 DOWNTO 0);
  SIGNAL b_unsigned : UNSIGNED(7 DOWNTO 0);
BEGIN
  a_unsigned <= unsigned(a);
  b_unsigned <= unsigned(b);
  PROCESS (clk, rst) 
  BEGIN
    IF rst = '1' THEN
      temp_prod <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      temp_prod <= a_unsigned * b_unsigned; 
    END IF;
  END PROCESS;
  prod <= std_logic_vector(temp_prod);
END ARCHITECTURE;
```