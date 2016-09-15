------------------------------------------------------------------------------------ 
-- Diseño: Registros 
-- Nombre del fichero:R_paralelo_paralelo_tb.vhd 
-- Fecha: 25/05/2010 
-- Versión: 2.0 
-- Resumen: Contiene el test realizado para probar el funcionamiento del esquema de registro paralelo de 4 bits
-- Se utilizan el tipo de datos STD_LOGIC para todas las señales 
-- La arquitectura se realiza en estilo de flujo de datos 


LIBRARY IEEE;
USE ieee.STD_LOGIC_1164.all;

ENTITY regPPtest IS
END regPPtest;

ARCHITECTURE regPPtestArch OF regPPtest IS

COMPONENT registro_PP IS
	GENERIC (num_bits:natural); 
    	PORT (
			entradatos: IN STD_LOGIC_VECTOR(num_bits DOWNTO 0); 
                  clock, clear: IN STD_LOGIC;  
                  salidatos: OUT STD_LOGIC_VECTOR ( num_bits DOWNTO 0)); 
END COMPONENT;


SIGNAL entradatos,salidatos : STD_LOGIC_VECTOR (4 DOWNTO 0) ;
SIGNAL clear:STD_LOGIC;
SIGNAL clock:STD_LOGIC:='0';
CONSTANT periodo: TIME := 12ns;

FOR G1: registro_PP USE ENTITY WORK.registro_PP(con_generate);

BEGIN 

G1: registro_PP GENERIC MAP (4) PORT MAP(entradatos=>entradatos,
                        clock => clock,
				clear=>clear,				
				salidatos=>salidatos);

clock <= NOT clock AFTER periodo/2;

entradatos <=   ("00000") AFTER 0 NS,  
			("00001") AFTER 2 NS,
			("00000") AFTER 6 NS,
			("00001") AFTER 26 NS,
			("00000") AFTER 36 NS,
			("00001") AFTER 46 NS,
			("00000") AFTER 56 NS,
			("00001") AFTER 62 NS,
			("00000") AFTER 87 NS;



clear<='0',
	'1' AFTER 52 NS,
	'0' AFTER 62 NS;



END regPPtestArch;
