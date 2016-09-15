------------------------------------------------------------------------------------ 
-- Diseño: Decodificador 
-- Nombre del fichero: decoder2_4_estructura_ret_arch.vhd 
-- Fecha: 18/05/2011 
-- Versión: 2.0 
-- Resumen: Contiene la arquitectura de esctructura del decodificador.
-- utilizando tipo de datos STD_LOGIC. 
-- Se desarrollaran tres arquitecturas para el en los estilos 
-- de comportamiento, flujo de datos y estructural. 
-- ==================================================================================


LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

architecture estructural_ret of deco is

signal  c0_n, c1_n : STD_LOGIC;

COMPONENT inverter
GENERIC (retardo:time);
port (e0 :  in STD_LOGIC;
	        s:  out STD_LOGIC);
end COMPONENT;


COMPONENT AND_1
GENERIC (retardo:time);
port (e0,e1    :  in STD_LOGIC;
       s:  out STD_LOGIC);
end COMPONENT;

FOR all: inverter USE ENTITY WORK.inverter(flujo);
FOR all: AND_1 USE ENTITY WORK.AND_1(flujo);

begin
U1 : inverter generic map (0ns) port map (c0, c0_n);
U2 : inverter generic map (0ns) port map (c1, c1_n);
U3 : AND_1 generic map (1ns) port map (c0_n, c1_n, s0);
U4 : AND_1 generic map (2ns) port map (c0_n,c1, s1);
U5 : AND_1 generic map (3ns) port map (c0,c1_n,s2);
U6 : AND_1 generic map (4ns) port map (c0,c1,s3);
end architecture estructural_ret;

