------------------------------------------------------------------------------------ 
-- Diseño: Decodificador 
-- Nombre del fichero: decoder2_4_comporta_arch.vhd 
-- Fecha: 18/05/2011 
-- Versión: 2.0 
-- Resumen: Contiene la arquitectura de comportamiento del decodificador utilizando sentencias CASE. 
-- utilizando tipo de datos STD_LOGIC. 
-- Se desarrollaran tres arquitecturas para el en los estilos 
-- de comportamiento, flujo de datos y estructural. 
--================================================================================ 

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ARCHITECTURE comporta OF deco IS
-- Parte declarativa
BEGIN
PROCESS(c0,c1)

VARIABLE concatena:STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN
-- Descripción de la arquitectura
concatena:= c0 & c1; 
CASE concatena IS
WHEN"00"=>   s0<='1';s1<='0';s2<='0';s3<='0';
when "01" => s0<='0';s1<='1';s2<='0';s3<='0';
when "10" => s0<='0';s1<='0';s2<='1';s3<='0';
when "11" => s0<='0';s1<='0';s2<='0';s3<='1';
when others => s0<='0';s1<='0';s2<='0';s3<='0' ;
END CASE;
END PROCESS;
END comporta;

----------------------------------------------------------------------


