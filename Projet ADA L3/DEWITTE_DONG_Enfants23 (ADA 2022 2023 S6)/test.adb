WITH Ada.Integer_Text_IO, Ada.Text_IO, Outils, Gestion_Baby_Sitter, Gestion_Famille, Gestion_Garde, Initialisation;
USE Ada.Integer_Text_IO, Ada.Text_IO, Outils, Gestion_Baby_Sitter, Gestion_Famille, Gestion_Garde, Initialisation;

PROCEDURE Test IS
   Jour : T_Semaine := Lundi;
   Liste : T_Pteur;
   A : T_Arbre;
   Famille : T_Famille;
   K : Integer;
   Bs : T_Baby_Sitter;
   Creneau_Deb : T_Creneau := Matin;
   Creneau_Fin : T_Creneau := Soir;
   Nom_Fam,Nom_Bs,Prenom1,Prenom2,Chaine_Vide : T_Mot := (OTHERS => ' ');
   Bool : Boolean;

BEGIN
--   Jour_Suiv(Jour);
--   Put(T_Semaine'Image(Jour)); New_Line;


--   Ajout_Bs(Bs,Liste);

   Init_Bs(Liste);
   Init_Famille(A);

--   Visu_Bs(Liste); New_Line;
--   Tri(Liste); New_Line;
--   Ajout_Bs(Bs,Liste);
--   Ajout_Bs(Bs,Liste);
--   Tri(Liste); New_Line;


--   Visu_P1(Liste);
--   Visu_P2(Liste);

--   New_Fam(Famille,K);
--   Insert_Fam(Famille,K,A);
--   New_Fam(Famille,K);
--   Insert_Fam(Famille,K,A);
--   Visu_Fam(A);
--   Visu_Facture_Fam(A);

--   Visu_Facture_Veille(Liste);
--   Visu_Facture_Bs(Liste);
--   Visu_Planning_Bs(Liste);
--   Visu_Garde_Jour(Liste,Jour);

--   Supp_Bs(Liste);
--   Demande_Depart_Bs(Liste);
--   Visu_Bs(Liste); New_Line;

--   Maj_Planning(Liste);
   Visu_P1(Liste);
--   Visu_P2(Liste);

--   Visu_Garde(Liste);

   Visu_Fam(A);
--   Supp_Fam(Liste,A,Jour);
--   Visu_Fam(A);


--   Compte_Creneaux(Liste);
--   Tri_Creneaux2(Liste);
--   Visu_Bs(Liste); New_Line;
--   Demande_Garde(Liste,A);
--   Visu_P2(Liste);

   Put(T_Semaine'Image(Jour)); New_Line;

   Calcul_Facture(Liste,A,Jour);
   Put_Line("visu facture veille");
   Visu_Facture_Veille(Liste);
   Put_Line("visu facture semaine");
   Visu_Facture_Bs(Liste);
   Put_Line("visu facture famille");
   Visu_Facture_Fam(A);
   Jour := Mardi;
   Put(T_Semaine'Image(Jour)); New_Line;

   Calcul_Facture(Liste,A,Jour);
   Put_Line("visu facture veille");
   Visu_Facture_Veille(Liste);
   Put_Line("visu facture semaine");
   Visu_Facture_Bs(Liste);
   Put_Line("visu facture famille");
   Visu_Facture_Fam(A);
   Jour := Mercredi;
   Put(T_Semaine'Image(Jour)); New_Line;

   Calcul_Facture(Liste,A,Jour);
   Put_Line("visu facture veille");
   Visu_Facture_Veille(Liste);
   Put_Line("visu facture semaine");
   Visu_Facture_Bs(Liste);
   Put_Line("visu facture famille");
   Visu_Facture_Fam(A);


END Test;


