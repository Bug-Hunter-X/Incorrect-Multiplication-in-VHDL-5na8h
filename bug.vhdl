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
  SIGNAL temp_prod : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
BEGIN
  PROCESS (clk, rst) 
  BEGIN
    IF rst = '1' THEN
      temp_prod <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      temp_prod <= a * b; -- Incorrect multiplication
    END IF;
  END PROCESS;
  prod <= temp_prod;
END ARCHITECTURE;
```