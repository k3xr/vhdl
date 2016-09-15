------------------------------------------------------------------------------------ 
-- Diseño: Decodificador 
-- Nombre del fichero: puertas_componentes.vhd
-- Fecha: 18/05/2011 
-- Versión: 2.0 
-- Resumen: Contiene los componentes necesarios para la arquitectura estructural de un decodificador. 
-- utilizando tipo de datos STD_LOGIC. 
-- Se desarrollaran tres arquitecturas para el en los estilos 
-- de comportamiento, flujo de datos y estructural.  
--================================================================================ 

LIBRARY ieee; 
USE ieee.STD_LOGIC_1164.all; 

ENTITY inverter IS 
	GENERIC(retardo:TIME);
	PORT(
	  e0 : IN STD_LOGIC; S : OUT STD_LOGIC 
	    ); 

END inverter; 

ARCHITECTURE flujo OF inverter IS
	BEGIN
		S<= NOT e0 ;

END flujo;


LIBRARY ieee; 
USE ieee.STD_LOGIC_1164.all;

ENTITY AND_1 IS 
	GENERIC(retardo:TIME);
	PORT(
	  e0,e1 : IN STD_LOGIC; S : OUT STD_LOGIC 
	    ); 

END AND_1; 

ARCHITECTURE flujo OF and_1 IS
	BEGIN
		s<= (e0 AND e1);

END flujo;
