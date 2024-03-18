WITH Ada.Integer_Text_IO, Ada.Text_IO, Ada.Characters.Handling;
USE Ada.Integer_Text_IO, Ada.Text_IO, Ada.Characters.Handling;

PACKAGE BODY Outils IS

   PROCEDURE Ctrl_Entier (Int : IN OUT Integer) IS
   BEGIN
      LOOP
         BEGIN
            Get(Int);
            Skip_Line;
            EXIT;
         EXCEPTION
            WHEN Data_Error =>
               Skip_Line;
               Put_Line("Erreur de saisie, recommencez");
         END;
      END LOOP;
   END Ctrl_Entier;

   PROCEDURE Ctrl_String (Chaine : IN OUT T_Mot) IS
      K : Integer;
   BEGIN
      Chaine := (OTHERS=>' ');
      LOOP
         BEGIN
            Get_Line(Chaine,K);
            Chaine := To_Lower(Chaine);
            Chaine(1) := To_Upper(Chaine(1));
            EXIT;
         EXCEPTION
            WHEN Constraint_Error =>
               Put_Line("Erreur de saisie, recommencez");
         END;
      END LOOP;
   END Ctrl_String;

   PROCEDURE Jour_Suiv(Jour : IN OUT T_Semaine) IS
   BEGIN
      IF Jour = T_Semaine'Last THEN
         Jour := T_Semaine'First;
      ELSE
         Jour := T_Semaine'Succ(Jour);
      END IF;
   END Jour_Suiv;

END Outils;


