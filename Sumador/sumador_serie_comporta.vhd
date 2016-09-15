------------------------------------------------------------------------------------ 
-- Diseño: Sumador Serie
-- Nombre del fichero: sumador_serie_comporta.vhd
-- Fecha: 06/06/2011 
-- Versión: 2.0 
-- Resumen: Contiene la entidad y la arquitectura de un sumador serie.
-- Se utilizan el tipo de datos STD_LOGIC para todas las señales 
-- La arquitectura se realiza en estilo comportamiento 


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY suma_serie IS
	PORT(	clock, reset, B, A  	:   IN STD_LOGIC;      
       	R        			:   OUT STD_LOGIC); 
END suma_serie;


ARCHITECTURE comportamiento OF suma_serie IS
		

	TYPE estado_tipo IS (TE_cero, TE_uno);
	SIGNAL estado_actual, estado_siguiente :estado_tipo;

	BEGIN


		sumador_serie: PROCESS (estado_actual,B,A)
		BEGIN
			CASE estado_actual IS
				WHEN TE_cero=> 	IF 	((A='0' AND B='0')) THEN estado_siguiente<=TE_cero;
								R<='0'; 
							ELSIF ((A='0' AND B='1'))THEN estado_siguiente<=TE_cero;
								R<='1';
 							ELSIF ((A='1' AND B='0'))THEN estado_siguiente<=TE_cero;
								R<='1';
							ELSIF ((A='1' AND B='1'))THEN estado_siguiente<=TE_uno;
								R<='0';
							END IF;
				WHEN TE_uno=> 	IF 	((A='1' AND B='1')) THEN estado_siguiente<=TE_uno;
								R<='1'; 
							ELSIF ((A='0' AND B='1') OR (A='1' AND B='0')) 
							THEN estado_siguiente<= TE_uno; R<='0';
							ELSE estado_siguiente<=TE_cero; R<='1';
							END IF;
			END CASE;
		END PROCESS sumador_serie;


		mem: PROCESS (reset,clock) 
		BEGIN
				IF reset='1' THEN estado_actual<=TE_cero;
				ELSIF rising_edge(clock) THEN
				estado_actual<=estado_siguiente;
				END IF;

		END PROCESS mem;   

END comportamiento;