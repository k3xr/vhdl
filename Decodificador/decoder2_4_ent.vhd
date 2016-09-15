------------------------------------------------------------------------------------ 
-- Diseño: Decodificador 
-- Nombre del fichero: decoder2_4_ent.vhd 
-- Fecha: 18/05/2011 
-- Versión: 2.0 
-- Resumen: Contiene una entidad de un decodificador de 2 a 4. 
-- utilizando tipo de datos STD_LOGIC. 
-- Se desarrollaran tres arquitecturas para el en los estilos 
-- de comportamiento, flujo de datos y estructural. 
--================================================================================ 

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

entity deco is 
  port (
c0,c1: in std_logic; 
        s0,s1,s2,s3: out std_logic); 
end deco; 

