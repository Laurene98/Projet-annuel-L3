WITH Outils, Gestion_Baby_Sitter, Gestion_Famille;
USE Outils, Gestion_Baby_Sitter, Gestion_Famille;

PACKAGE Gestion_Garde IS

   PROCEDURE Demande_Garde(Liste : T_Pteur; A : T_Arbre);
   PROCEDURE Annule_Garde(Liste : T_Pteur; A : T_Arbre; Jour : T_Semaine);
   PROCEDURE Supp_Fam(Liste : T_Pteur; A : IN OUT T_Arbre; Jour : T_Semaine; Pointeur_Fam : OUT T_Arbre);



   --FUNCTION Last_Bs (Pnt_A: T_Arbre) RETURN T_Pteur;
   --FUNCTION Last_Bs (Pnt_F : T_Arbre; Pnt_B : T_Pteur) RETURN T_Pteur;
END Gestion_Garde;
