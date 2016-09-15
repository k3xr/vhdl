----------------------------------------------------------------
-- © Universidad Politécnica de Madrid
-- Se permite copia para fines de estudio
----------------------------------------------------------------
-- Proyecto           : Práctica S2: Biestables y registros
-- Diseño             : Biestable D. Test
-- Nombre del fichero : D_Fsube_Casin_tb.vhd
-- Autor              : V. Rodellar
-- Fecha              : 1/12/2010
-- Versión            : 1.0
-- Resumen            : Este fichero contiene la entidad y 
--                      arquitectura para testear un biestable D
--                      activado por flanco de subida de reloj 
--                      y clear asincrono activo a nivel alto.
--		            El tipo de datos utilizado es STD_LOGIC
--
--
-- Modificaciones:
--
-- Fecha        Autor        Versión         Descripción del cambio
-------------------------------------------------------------------
--
-------------------------------------------------------------------

-- Librerias y paquetes

LIBRARY IEEE;
USE ieee.STD_LOGIC_1164.all;

-- Entidad

ENTITY biestable_D_test IS
END biestable_D_test;

-- Arquitectura

ARCHITECTURE test_general OF biestable_D_test IS

-- PARTE DECLARATIVA

-- Declaración del componente

  COMPONENT biestable_D_con_clr IS
    PORT (clock,clear, d: IN STD_LOGIC;
          q             : OUT STD_LOGIC := '0');
  END COMPONENT;

 
-- Declaracón de señales y constantes auxilares
   SIGNAL entrada,q, poner_cero: STD_LOGIC;
   SIGNAL reloj: STD_LOGIC := '0' ;
   CONSTANT periodo: TIME := 6 ns;

--Configuración del componente
FOR U1: biestable_D_con_clr USE ENTITY WORK.biestable_D_con_clr(flujo_asin);

-- COMIENZO DE LA ARQUITECTURA

  BEGIN

-- Instanciación del componente
   
    U1:biestable_D_con_clr PORT MAP (clock => reloj, 
                                     clear => poner_cero,
                                     d     => entrada, 
                                     q     => q);

-- Generación de la señal de reloj
    
reloj <= NOT reloj AFTER periodo/2;

-- Descripción de los drivers de las señales de entrada

    entrada <='0',
       '1'AFTER 2 NS,
       '0'AFTER 7 NS,
       '1'AFTER 8 NS,
       '0'AFTER 10 NS,
       '1'AFTER 12 NS,
       '0'AFTER 13 NS,
       '1'AFTER 14 NS,
     	 '1'AFTER 17 NS,
       '1'AFTER 18 NS,
	 '1'AFTER 19 NS,
       '1'AFTER 22 NS,
	 '0'AFTER 23 NS,
       '1'AFTER 24 NS,
	 '0'AFTER 26 NS;

poner_cero <= '0', '1' AFTER 10 ns, '0' AFTER 20 ns;
       
 END test_general;