WITH Ada.Integer_Text_IO, Ada.Text_IO, Outils, Gestion_Baby_Sitter, Gestion_Famille, Initialisation, Gestion_Garde;
USE Ada.Integer_Text_IO, Ada.Text_IO, Outils, Gestion_Baby_Sitter, Gestion_Famille, Initialisation, Gestion_Garde;

PROCEDURE Testl IS
   Jour : T_Semaine := Lundi;
   Liste, pnt : T_Pteur;
   A : T_Arbre;
   Famille : T_Famille;
   K : Integer;
   Bs : T_Baby_Sitter;
   Creneau_Deb : T_Creneau := Matin;
   Creneau_Fin : T_Creneau := Soir;
   Nom_Fam,Nom_Bs,Prenom1,Prenom2,Chaine_Vide : T_Mot := (OTHERS => ' ');
   Bool : Boolean;


BEGIN
   Init_Bs(Liste);
   Init_Famille(A);
Tri_Creneaux(Liste);
Visu_bs(Liste);


   ---Demande_Garde(Liste,A);
--   A.famille.nom(1..5) := "Burma";
--pnt := Last_Bs (A, liste);
-- put (pnt.bs.nom);


   --   Jour_Suiv(Jour);
   --   Put(T_Semaine'Image(Jour)); New_Line;

   --   Ajout_Bs(Bs,Liste);
   --   Ajout_Bs(Bs,Liste);

   --   Init_Bs(Liste);
   --   Init_Famille(A);

   --   Visu_Bs(Liste); New_Line;
   --   Tri(Liste); New_Line;
   --   Visu_Bs(Liste); New_Line;

   --   Visu_P1(Liste);
   --   Visu_P2(Liste);

   --   New_Fam(Famille,K);
   --   Insert_Fam(Famille,K,A);
   --   New_Fam(Famille,K);
   --   Insert_Fam(Famille,K,A);

   ----   Famille.Nom(1..10) := "Montalbano";
--   famille := A.famille;
--   --Famille.Nom(1..5) := "Burma";
--   Visu_Fam(A);
--   Visu_P1(Liste);

--   Put (Nb_Matin(Famille,Liste));
--   New_Line;
--   Put (Nb_Aprem(Famille,Liste));
--   New_Line;
--   Put (Nb_Soir(Famille,Liste));
--   New_Line;


--      Cal_Facture_Fam (Famille, Liste, Fac);
--      New_Line;
--      Put (fac);
----   Famille.Nom(1..10) := "Montalbano";
----Famille.Nom(1..8) := "Le Floch";

----      M := 0;
----      WHILE Liste /= NULL LOOP
----         FOR I IN T_Jour_Ouvre'RANGE LOOP
----            IF Liste.Bs.P1(I,Matin) = Famille.nom THEN
----               M := M + 1;
----            END IF;
----         END LOOP;
----         Liste:= Liste.Suiv;
----      END LOOP;

----put(m);

----   Cal_Facture_Fam (Famille,Fac);
----   New_Line;
----   Put(Fac);
--new_line;

--Visu_Facture_Fam(A, Liste, Fac);


END Testl;


