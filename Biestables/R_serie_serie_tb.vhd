------------------------------------------------------------------------------------ 
-- Diseño: Registros 
-- Nombre del fichero:R_serie_serie_tb.vhd 
-- Fecha: 25/05/2010 
-- Versión: 2.0 
-- Resumen: Contiene el test realizado para probar el funcionamiento del esquema de registro serie de 4 bits
-- Se utilizan el tipo de datos STD_LOGIC para todas las señales 
-- La arquitectura se realiza en estilo de flujo de datos 

LIBRARY IEEE;
USE ieee.STD_LOGIC_1164.all;

ENTITY regSStest IS
END regSStest;

ARCHITECTURE test OF regSStest IS

COMPONENT registro_SS IS
	PORT (
	d,clock,clear:IN STD_LOGIC;
	q: OUT STD_LOGIC := '0'
	);
END COMPONENT;


SIGNAL d,q,clear : STD_LOGIC;
SIGNAL clock:STD_LOGIC:='0';
CONSTANT periodo: TIME := 10ns;

FOR G1: registro_SS USE ENTITY WORK.registro_SS(instancias);

BEGIN 

G1: registro_SS PORT MAP(d=>d,
                        clock => clock,
				clear=>clear,				
				q=>q);

clock <= NOT clock AFTER periodo/2;

d<= '0', 
	'1' AFTER 2 NS,
	'0' AFTER 6 NS,
	'1' AFTER 26 NS,
	'0' AFTER 36 NS,
	'1' AFTER 46 NS,
	'0' AFTER 56 NS,
	'1' AFTER 62 NS,
	'0' AFTER 87 NS;

clear<='0',
	'1' AFTER 52 NS,
	'0' AFTER 62 NS;



END test;