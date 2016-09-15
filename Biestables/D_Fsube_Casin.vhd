------------------------------------------------------------------------------------ 
-- Diseño: Registros 
-- Nombre del fichero: D_Fsube_Casin.vhd 
-- Fecha: 25/05/2011 
-- Versión: 2.0 
-- Resumen: Contiene una entidad y una arquitectura 
-- de un biestable tipo D activado 
-- por flanco de subida de reloj y señal clear asíncrona 
-- activa a nivel alto 
-- Se utilizan el tipo de datos STD_LOGIC para todas las señales 
-- La arquitectura se realiza en estilo de flujo de datos 

LIBRARY IEEE;
USE ieee.STD_LOGIC_1164.all;

ENTITY biestable_D_con_clr IS
	PORT(
	      d,clock,clear : IN STD_LOGIC;
	                   q: OUT STD_LOGIC
	);
END biestable_D_con_clr;

ARCHITECTURE flujo_asin OF biestable_D_con_clr IS

	BEGIN
	q<= '0' WHEN (clear = '1')
	ELSE d WHEN rising_edge(clock);

END flujo_asin;