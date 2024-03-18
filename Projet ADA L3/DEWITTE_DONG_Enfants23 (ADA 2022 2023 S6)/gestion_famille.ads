WITH Outils, Gestion_Baby_Sitter;
USE Outils, Gestion_Baby_Sitter;

PACKAGE Gestion_Famille IS

   TYPE T_Age_Enf IS ARRAY(Integer RANGE 1..8) OF Integer RANGE -1..12;

   TYPE T_Famille IS RECORD
      Nom : T_Mot := (OTHERS => ' ');
      Nb_Enfants : Integer RANGE 1..8;
      Age_Enfants : T_Age_Enf := (OTHERS => -1);
      Facture : Integer := 0;
      Last_Bs : T_Pteur := NULL;
   END RECORD;

   -- ABR tri� par nom
   TYPE T_Noeud;
   TYPE T_Arbre IS ACCESS T_Noeud;
   TYPE T_Noeud IS RECORD
      Famille : T_Famille;
      Fg,Fd : T_Arbre;
   END RECORD;

   PROCEDURE New_Fam(Famille : OUT T_Famille; K : OUT Integer);
   PROCEDURE Insert_Fam(Famille : IN OUT T_Famille; K : Integer; A : IN OUT T_Arbre);
   PROCEDURE Visu_Fam(A : IN T_Arbre);
   FUNCTION Nb_Matin (Famille : T_Famille; Liste : T_Pteur) RETURN Integer;
   FUNCTION Nb_Aprem (Famille : T_Famille; Liste : T_Pteur) RETURN Integer;
   FUNCTION Nb_Soir (Famille : T_Famille; Liste : T_Pteur) RETURN Integer;
   PROCEDURE Cal_Facture_Fam (Famille : IN T_Famille;Liste: T_Pteur; Fac : OUT Integer);
   PROCEDURE Visu_Facture_Fam (A : T_Arbre; Liste : T_Pteur; Fac : OUT Integer);
   PROCEDURE Tri_Age (Famille : IN OUT T_Famille);
   PROCEDURE Calcul_Facture(Liste : T_Pteur; A : T_Arbre; Jour : T_Jour_Ouvre);


END Gestion_Famille;
