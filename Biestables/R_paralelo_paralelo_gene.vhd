------------------------------------------------------------------------------------ 
-- Diseño: Registros 
-- Nombre del fichero:R_paralelo_paralelo_gene.vhd 
-- Fecha: 25/05/2011 
-- Versión: 2.0 
-- Resumen: Contiene un registro de entrada y salida paralelo de 4 bits ,
-- utilizando el biestable d activado por flanco de subida y clear
-- Se utilizan el tipo de datos STD_LOGIC para todas las señales 
-- La arquitectura se realiza en estilo de flujo de datos 

LIBRARY IEEE;
USE ieee.STD_LOGIC_1164.all;

ENTITY registro_PP IS
GENERIC (num_bits:natural); 
    PORT (
			entradatos: IN STD_LOGIC_VECTOR(num_bits DOWNTO 0); 
                  clock, clear: IN STD_LOGIC;  
                  salidatos: OUT STD_LOGIC_VECTOR (num_bits DOWNTO 0)); 
    END registro_PP;




ARCHITECTURE con_generate OF registro_PP IS

COMPONENT biestable_D_con_clr IS  
  			PORT (d, clock,clear: IN STD_LOGIC; 
				q: OUT STD_LOGIC := '0'); 
END COMPONENT; 

FOR ALL: biestable_D_con_clr USE ENTITY WORK.biestable_D_con_clr(flujo_asin);

BEGIN

P1:  FOR x IN 0 TO num_bits GENERATE 
Q1:  biestable_D_con_clr PORT MAP (entradatos(x), clock,clear,salidatos(x)); 
     END GENERATE; 

END con_generate;
