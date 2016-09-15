------------------------------------------------------------------------------------ 
-- Diseño: Registros 
-- Nombre del fichero:R_serie_serie3.vhd 
-- Fecha: 25/05/2011 
-- Versión: 2.0 
-- Resumen: Contiene un registro de entrada y salida serie de 4 bits ,
-- utilizando el biestable d activado por flanco de subida y clear 
-- Se utilizan el tipo de datos STD_LOGIC para todas las señales 
-- La arquitectura se realiza en estilo de flujo de datos 

LIBRARY IEEE;
USE ieee.STD_LOGIC_1164.all;

ENTITY registro_SS IS
	PORT (
		d,clock,clear:IN STD_LOGIC;
		q: OUT STD_LOGIC
		);
END registro_SS;

ARCHITECTURE instancias OF registro_SS IS
	
	SIGNAL e0,e1,e2: STD_LOGIC;

	COMPONENT biestable_D_con_clr
	PORT(
	d,clock,clear : IN STD_LOGIC;
	q: OUT STD_LOGIC);
	END COMPONENT;


FOR ALL: biestable_D_con_clr USE ENTITY WORK.biestable_D_con_clr(flujo_asin);
BEGIN

u1: biestable_D_con_clr PORT MAP (d,clock,clear,e0);
u2: biestable_D_con_clr PORT MAP (e0,clock,clear,e1);
u3: biestable_D_con_clr PORT MAP (e1,clock,clear,e2);
u4: biestable_D_con_clr PORT MAP (e2,clock,clear,q);

END instancias;