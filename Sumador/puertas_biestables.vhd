------------------------------------------------------------------------------------ 
-- Diseño: Sumador Serie
-- Nombre del fichero: puertas_biestables.vhd
-- Fecha: 06/06/2011 
-- Versión: 2.0 
-- Resumen: Contiene las puertas necesarias para el  sumador serie.

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

	ENTITY inverter IS
		PORT (e:IN STD_LOGIC;
			s: OUT STD_LOGIC);
	END inverter;

	ARCHITECTURE flujo OF inverter IS
		BEGIN
			s <= NOT e;
	END flujo;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


	ENTITY puerta_and IS
		PORT (c1, c0: IN STD_LOGIC;
			s: OUT STD_LOGIC);
	END puerta_and;

	ARCHITECTURE flujo OF puerta_and IS
		BEGIN
			s <= c1 AND c0;
	END flujo;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

	ENTITY puerta_or IS
		PORT (c1, c0:IN STD_LOGIC;
			s: OUT STD_LOGIC);
	END puerta_or;

	ARCHITECTURE flujo OF puerta_or IS
		BEGIN
			s <= c1 OR c0;
	END flujo;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

	ENTITY puerta_xor IS
		PORT (c1, c0:IN STD_LOGIC;
			s: OUT STD_LOGIC);
	END puerta_xor;

	ARCHITECTURE flujo OF puerta_xor IS
		BEGIN
			s <= c1 XOR c0;
	END flujo;


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

	ENTITY biestable_d IS
		GENERIC (retardo:TIME:=0ns);
		PORT (clock,reset, e: IN STD_LOGIC;
          		sal             : OUT STD_LOGIC);
	END biestable_d;

	ARCHITECTURE flujo_asin OF biestable_d IS
	
		BEGIN
			sal<= '0' WHEN reset = '1' ELSE e WHEN rising_edge(clock);
	END flujo_asin;
