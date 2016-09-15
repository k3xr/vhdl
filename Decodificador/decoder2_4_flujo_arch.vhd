------------------------------------------------------------------------------------ 
-- Diseño: Decodificador 
-- Nombre del fichero: decoder2_4_flujo_arch.vhd 
-- Fecha: 18/05/2011 
-- Versión: 2.0 
-- Resumen: Contiene la arquitectura de flujo del decodificador.
-- utilizando tipo de datos STD_LOGIC. 
-- Se desarrollaran tres arquitecturas para el en los estilos 
-- de comportamiento, flujo de datos y estructural. 
--================================================================================ 

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
ARCHITECTURE flujo OF deco IS
-- Parte declarativa



BEGIN
-- Descripción de la arquitectura


 s0<= NOT c0 AND NOT c1;
 s1<= NOT c0 AND c1 ;
 s2<= NOT c1 AND c0 ;
 s3<= c1 AND c0;
END flujo;

----------------------------------------------------------------------
