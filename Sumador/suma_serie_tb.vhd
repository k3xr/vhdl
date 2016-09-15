---------------------------------------------------------------------------------------------------------------
-- � Universidad Polit�cnica de Madrid
-- Se permite copia para fines de estudio
--------------------------------------------------------------------------------------------------------------
-- Proyecto                 : Maquinas de estados finitos
-- Dise�o                   : Sumador serie
-- Nombre del fichero       : sumador_serie_tb.vhd
-- Autor                    : V. Rodellar
-- Fecha                    : 18/12/2010
-- Versi�n                  : 2.0
-- Resumen                  : Este fichero contiene la entidad y arquitectura de
--                            para testear un sumador serie entidad (suma_serie) y 
--		                 arquitectura (comportamiento)
--                            Estan en el fichero sumador_serie_comporta.vhd
--                            
-- Modificaciones:
--
-- Fecha        Autor        Versi�n         Descripci�n del cambio
------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;


ENTITY sum_serie_test IS
END sum_serie_test;

ARCHITECTURE sum_serie_test_arch OF sum_serie_test IS 

-- PARTE DECLARATIVA

-- Declaraci�n del componente

COMPONENT suma_serie IS
 PORT (clock    :   IN STD_LOGIC;    -- Reloj activo por flanco de bajada
       reset    :   IN STD_LOGIC;    -- Clear activa a nivel alto
       B,A      :   IN STD_LOGIC;    -- Entradas
       R        :   OUT STD_LOGIC);  -- Salida

END COMPONENT;

-- Declaraci�n de s�ales auxiliares

SIGNAL clock                  : STD_LOGIC:= '0'; -- inicializaci�n
SIGNAL reset,R                : STD_LOGIC; 
SIGNAL A, B                   : STD_LOGIC:= '1';

CONSTANT clock_periodo        : TIME := 4 ns;
CONSTANT A_periodo            : TIME := 8 ns;
CONSTANT B_periodo            : TIME := 24 ns;


-- Configuraci�n de la arquitectura

FOR U1: suma_serie USE ENTITY WORK.suma_serie(comportamiento);
--FOR U1: suma_serie USE ENTITY WORK.suma_serie(flujo);
--FOR U1: suma_serie USE ENTITY WORK.suma_serie(estructural);

BEGIN

------------------------------------
-- Instanciaci�n del componente
------------------------------------

U1:suma_serie PORT MAP (clock => clock, reset => reset, B => B, A => A , R => R);

------------------------------------
-- Generaci�n de la se�al de reloj
------------------------------------

clock <= NOT clock AFTER clock_periodo/2;

-------------------------------------
-- Drivers reset y se�ales de entrada
-------------------------------------

reset <= '0', '1' AFTER 5 ns, '0' AFTER 7 ns;

A     <= NOT A AFTER A_periodo/2;
B     <= NOT B AFTER B_periodo/2;

END sum_serie_test_arch;
