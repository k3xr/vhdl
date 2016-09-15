------------------------------------------------------------------------------------ 
-- Diseño: Decodificador 
-- Nombre del fichero: decoder2_4_tb.vhd 
-- Fecha: 18/05/2011 
-- Versión: 2.0 
-- Resumen: Contiene una entidad de un decodificador de 2 a 4. 
-- utilizando tipo de datos STD_LOGIC. 
-- Se desarrollaran tres arquitecturas para el en los estilos 
-- de comportamiento, flujo de datos y estructural. 
--================================================================================ 

--========test1 arquitectura comportamiento========
 LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY test_deco is
 END test_deco;

 ARCHITECTURE comporta_test of test_deco is
-- Parte declarativa

-- Declaración del componente que se va a testear

 COMPONENT deco PORT (
				 c0,c1: in std_logic;
				 s0,s1,s2,s3: out std_logic
				);
 END COMPONENT;
 for p1: deco use entity WORK.deco(comporta);
 
-- Declaración de señales
  
 SIGNAL c0,c1: std_logic:='0';
 SIGNAL s0,s1,s2,s3: std_logic; 
BEGIN
 p1: deco port map (
		c0 => c0,
		c1 => c1,
		s0 => s0,
            s1 => s1,
            s2 => s2,
            s3 => s3
);



c0<=NOT c0 AFTER 2ns;
c1<=NOT c1 AFTER 4ns;
 end comporta_test;

--========test2 arquitectura flujo========

   LIBRARY ieee;
   USE ieee.STD_LOGIC_1164.all;

   ENTITY test_deco2 is
   END test_deco2;

   ARCHITECTURE flujo_test of test_deco2 is

   COMPONENT deco PORT (
				 c0,c1: in std_logic;				
				 s0,s1,s2,s3: out std_logic
				);
   END COMPONENT;

   for p2: deco use entity WORK.deco(flujo);

   SIGNAL c0,c1: std_logic:='0';
   SIGNAL s0,s1,s2,s3: std_logic; 
   BEGIN
   p2: deco port map (
		c0 => c0,
		c1 => c1,
		s0 => s0,
 	      s1 => s1,
            s2 => s2,
            s3 => s3
 );


  c0<=NOT c0 AFTER 2ns;
  c1<=NOT c1 AFTER 4ns;
  

   end flujo_test;




--========test3 arquitectura estructural========

   LIBRARY ieee;
   USE ieee.STD_LOGIC_1164.all;

   ENTITY test_deco3 is
   END test_deco3;

   ARCHITECTURE estructura_test of test_deco3 is

   COMPONENT deco PORT (
				 c0,c1: in std_logic;				
				 s0,s1,s2,s3: out std_logic
				);
   END COMPONENT;

   for p3: deco use entity WORK.deco(estructural);

   SIGNAL c0,c1: std_logic:='0';
   SIGNAL s0,s1,s2,s3: std_logic; 
   BEGIN
   p3: deco port map (
		c0 => c0,
		c1 => c1,
		s0 => s0,
 	      s1 => s1,
            s2 => s2,
            s3 => s3
 );


  c0<=NOT c0 AFTER 2ns;
  c1<=NOT c1 AFTER 4ns;
  

   end estructura_test;


--========test4 arquitectura estructural con retardo========

LIBRARY ieee;
   USE ieee.STD_LOGIC_1164.all;

   ENTITY test_deco4 is
   END test_deco4;

   ARCHITECTURE estructura_ret_test of test_deco4 is

   COMPONENT deco PORT (
				 c0,c1: in std_logic;				
				 s0,s1,s2,s3: out std_logic
				);
   END COMPONENT;

   for p4: deco use entity WORK.deco(estructural_ret);

   SIGNAL c0,c1: std_logic:='0';
   SIGNAL s0,s1,s2,s3: std_logic; 
   BEGIN
   p4: deco port map (
		c0 => c0,
		c1 => c1,
		s0 => s0,
 	      s1 => s1,
            s2 => s2,
            s3 => s3
 );


  c0<=NOT c0 AFTER 2ns;
  c1<=NOT c1 AFTER 4ns;
  

   end estructura_ret_test;
