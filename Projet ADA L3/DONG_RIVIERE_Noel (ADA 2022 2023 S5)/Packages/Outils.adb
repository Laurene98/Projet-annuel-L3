WITH Ada.Text_IO,Ada.Integer_Text_IO, outils,Ada.Characters.Handling,Gestion_KDO,Gestion_Activites,Gestion_Elfes,Gestion_Locataire;
USE Ada.Text_IO,Ada.Integer_Text_IO, outils,Ada.Characters.Handling,Gestion_KDO,Gestion_Activites,Gestion_Elfes,Gestion_Locataire;


PACKAGE BODY Outils IS

PROCEDURE Gestion_Mots (Mot : OUT T_Mot) IS
   K: Integer;
   S: String (1..30);


BEGIN

   Mot := To_Upper (Mot);


END Gestion_Mots;
END Outils;







--   Get_Line (S,K);
--   Mot := T_Mot'Value (S(1..K));
--   Put (T_Mot'Image(Mot));

--   Get_Line (Mot,K);
--   Mot := T_Mot'Image(S(1..K));
--   Put (Mot);









--Mot := (OTHERS => ' ');
--      FOR I IN Mot'range LOOP
--begin
----         Mot(i):= To_Upper (Mot(i));
--      LOOP
--         BEGIN

--         CASE Mot(i) IS
--         WHEN 'A'..'Z'|'a'..'z' => Mot(i) := To_Upper (Mot(i)); EXIT;
--         WHEN OTHERS => NULL;
--         END CASE;
--         Get (Mot(i));
--         END;


--      END LOOP;
--   end;
--         Skip_Line; EXIT;
--      END LOOP;


--END Gestion_Mots;

--END Outils;

















--      FOR I IN Mot'range LOOP

--   LOOP
--         Get (Mot(i));
--         Mot(i):= To_Upper (Mot(i));
--         CASE Mot(i) IS
--         WHEN 'A'..'Z'|'a'..'z' => Mot(i) := To_Upper (Mot(i)); EXIT;
--         WHEN OTHERS => NULL;
--         END CASE;

--      END LOOP;

--Skip_Line;
--      EXIT;

--      END LOOP;


--END Gestion_Mots;

--END Outils;
