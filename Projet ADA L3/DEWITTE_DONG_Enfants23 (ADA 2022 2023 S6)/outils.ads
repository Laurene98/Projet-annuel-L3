PACKAGE Outils IS

   SUBTYPE T_Mot IS String(1..15);
   Chaine_Vide : CONSTANT T_Mot := (OTHERS => ' ');
   TYPE T_Semaine IS(Lundi, Mardi, Mercredi, Jeudi, Vendredi, Samedi, Dimanche);

   PROCEDURE Ctrl_Entier(Int : IN OUT Integer);
   PROCEDURE Ctrl_String(Chaine : IN OUT T_Mot);
   PROCEDURE Jour_Suiv(Jour : IN OUT T_Semaine);

END Outils;
