------------------------------------------------------------------------------------ 
-- Diseño: Sumador Serie
-- Nombre del fichero: sumador_serie_flujo.vhd
-- Fecha: 06/06/2011 
-- Versión: 2.0 
-- Resumen: Contiene la entidad y la arquitectura de un sumador serie.
-- Se utilizan el tipo de datos STD_LOGIC para todas las señales 
-- La arquitectura se realiza en estilo de flujo de datos 

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY suma_serie IS
	PORT(	clock, reset , B, A  	:   IN STD_LOGIC;      
       	R        			:   OUT STD_LOGIC); 
END suma_serie;


ARCHITECTURE flujo OF suma_serie IS
		
	SIGNAL d,q:STD_LOGIC;

	BEGIN
		-- estado futuro
			d<= ((q AND (A XOR B)) OR (A AND B)); 

		-- salida
			R<= A XOR B XOR q;

		-- estado actual
			q<='0' WHEN (reset='1') ELSE d WHEN rising_edge(clock);
		
END flujo;     

