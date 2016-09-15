------------------------------------------------------------------------------------ 
-- Diseño: Sumador Serie
-- Nombre del fichero: sumador_serie_estruct.vhd
-- Fecha: 06/06/2011 
-- Versión: 2.0 
-- Resumen: Contiene la entidad y la arquitectura de un sumador serie.
-- Se utilizan el tipo de datos STD_LOGIC para todas las señales 
-- La arquitectura se realiza en estilo estructural. 

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY suma_serie IS
	PORT		(clock, reset, B, A  	:   IN STD_LOGIC;      
       		R        			:   OUT STD_LOGIC); 
END suma_serie;


ARCHITECTURE estructural OF suma_serie IS

	COMPONENT inversor PORT (e: IN STD_LOGIC;
					 s: OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT puerta_and PORT (c1, c0: IN STD_LOGIC;
					s: OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT puerta_or PORT (c1, c0: IN STD_LOGIC;
					s: OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT puerta_xor PORT (c1, c0: IN STD_LOGIC;
					s: OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT biestable_d IS
		GENERIC (retardo:TIME:=0ns);
		PORT (clock,reset, e: IN STD_LOGIC;
          		sal             : OUT STD_LOGIC);
	END COMPONENT;
		

	SIGNAL q, d, s_and_1, s_xor_1, s_and_2, s_xor_2, r_suma:STD_LOGIC;
	BEGIN
	
		and_1		:puerta_and PORT MAP (c1=>A, c0=>B, s=> s_and_1);
		xor_1		:puerta_xor PORT MAP (c1=>A, c0=>B, s=> s_xor_1);
		and_2		:puerta_and PORT MAP (c1=>q, c0=>s_xor_1, s=>s_and_2);
		or_1		:puerta_or PORT MAP (c1=>s_and_1, c0=>s_and_2, s=> d);
		biestable_1	:biestable_D PORT MAP (clock=>clock, reset=>reset, e=>d, sal=>q);
		
		xor_2		:puerta_xor PORT MAP (c1=>A, c0=>B, s=> s_xor_2);
		xor_3		:puerta_xor PORT MAP (c1=>s_xor_2, c0=>q, s=> r_suma);
		R<=r_suma;

END estructural;     
