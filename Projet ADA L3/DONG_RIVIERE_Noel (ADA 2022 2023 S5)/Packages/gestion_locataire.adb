WITH Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO,Ada.Characters.Handling,Gestion_KDO;
USE Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO,Ada.Characters.Handling,Gestion_KDO;


PACKAGE BODY Gestion_Locataire IS

   -------------------------------- Verif dispo ------------------------------------------

   FUNCTION Verif_Dispo (Nbr_Place: T_Gestion_Activite; Acti: T_Activite; Sem : T_Semaine) RETURN Boolean IS
      Dispo: Boolean;

   BEGIN
      IF Nbr_Place(Sem, Acti)  <= 0 and Acti /= Rien THEN
         Dispo := False;
      ELSIF Nbr_Place(Sem, Acti) > 0  and Acti /= Rien THEN
         Dispo := True;
      END IF;
      RETURN (Dispo);
   END Verif_Dispo;

   --------------------------------------- Inscription act et initialisation d'activite --------------------------------------

   PROCEDURE Saisie_Act (Choix_Act: IN OUT T_Activite; Nbr_Place: IN OUT T_Gestion_Activite; Choix : OUT T_Activite_Locataire; Sem: IN T_Semaine; Jours : IN T_Semaine) IS
      Mot : T_Mot;
      K: Integer;

      BEGIN
         Choix := (OTHERS => Rien);

--         Put_line ("Voici les disponibilites des activites."); New_line;
--         Affich_Tab (Nbr_Place);

         FOR Jour IN T_Semaine LOOP
         EXIT WHEN Jour = Samedi;

            Put ("Veuillez choisir une activite pour ");
            Put (T_Semaine'image(Jour));
            Put (" : ");

            LOOP
               BEGIN
                  Get_Line (Mot,K);
                  Choix_Act := T_Activite'Value (Mot(1..K));
                  Choix(Jour) := Choix_Act;

                  IF Verif_Dispo (Nbr_Place, Choix_Act, Jour) AND THEN NOT Verif (Choix_Act, Choix, Jour) THEN
                     Nbr_Place(Jour, Choix_Act) := Nbr_Place(Jour, Choix_Act) - 1;
                     Put_Line (T_Activite'Image(Choix(Jour))); EXIT;
                  ELSIF NOT Verif_Dispo (Nbr_Place, Choix_Act, Jour) AND THEN NOT Verif (Choix_Act, Choix, Jour) THEN
                     Put_Line ("Il n'y a plus de place. Recommencez.");
                  ELSIF NOT Verif_Dispo (Nbr_Place, Choix_Act, Jour) AND THEN Verif (Choix_Act, Choix, Jour) THEN
                     Put_Line ("Il n'y a plus de place. Recommencez.");
                  ELSIF Verif_Dispo (Nbr_Place, Choix_Act, Jour) AND THEN Verif (Choix_Act, Choix, Jour) THEN
                     Put_Line ("Vous avez deja choisi cette activite. Choississez une autre activite.");
                  END IF;

                     EXCEPTION
                     WHEN Constraint_Error => Put_Line ("Erreur de saisie. Veuillez ressaisir l'activite voulue.");
               END;
            END LOOP;
         END LOOP;

      FOR P IN T_Activite_Locataire'range LOOP
         Put (T_Activite'image(Choix(P))); Put(",");
      END LOOP;
   END Saisie_Act;


      ---------------------------------- Verification donnees -------------------------------------------
      FUNCTION Verif (Choix_Act: T_Activite; Choix : T_Activite_Locataire; Jours : T_Semaine) RETURN Boolean IS
         Deja_Pris: Boolean := False;

      BEGIN
         IF Jours = Lundi THEN Return (False);
         ELSE
            FOR Jour IN Lundi..T_Semaine'Pred(jours) LOOP
               IF Choix_Act = Choix(Jour) AND Choix(Jour) /= Rien THEN Deja_Pris := True;
               END IF;
            END LOOP;
         END IF;

            RETURN (Deja_Pris);
      END Verif;

   ------------------------------------- Enregistrement (Affichage) d'activite -------------------------------------

   PROCEDURE Save_Loc (Choix_Act: IN OUT T_Activite; Nbr_Place: IN OUT T_Gestion_Activite; Choix : IN OUT T_Activite_Locataire; Sem : IN T_Semaine) IS


   BEGIN
--      Saisie_Act (Choix_Act, Nbr_Place, Choix, Sem);

      FOR J IN T_Activite_Locataire'RANGE LOOP
         Put ("Vous etes inscrit a l'activite - ");
         Put (T_Activite'image(Choix(J)));
            Put (" - le ");
            Put (T_Semaine'Image(J)); New_Line;
         END LOOP;

   END Save_Loc;


   ------------------------------------- Remplir donn�es loc --------------------------------------
   PROCEDURE Saisie_Loc (Infoloc: IN OUT T_Info_Locataire) IS
      K: Integer;
      Nom :  T_Mot:=(OTHERS =>' ');
      Prenom :  T_Mot:=(OTHERS =>' ');

   BEGIN
      Put_Line ("Saissisez votre nom.");
      Get_Line (nom, K);
      Put_Line ("Saissisez votre prenom.");
      Get_Line (Prenom, K);
   Infoloc.Nom_locataire:= To_Upper(Nom);
   Infoloc.prenom_locataire:= To_Upper(Prenom);
      Put ("Votre nom est ");
      Put (Infoloc.Nom_Locataire); Put (".");
      New_Line;
      Put ("Votre prenom est ");
      Put (Infoloc.Prenom_Locataire); Put (".");
      New_Line;

   END Saisie_Loc;

   ------------------------------------- Affiliation kdo -----------------------------------------------------

   PROCEDURE Affil_KDO (KDO_Tirage: IN OUT T_KDO; Nbr_Stock : IN OUT T_Gestion_KDO; Infoloc: IN OUT T_Info_Locataire; Bilan_Kdo:IN OUT T_Gestion_KDO) IS

   BEGIN
      Distribution_KDO (KDO_Tirage, Nbr_Stock, Bilan_KDO);
     Infoloc.Cadeau  := KDO_Tirage;
      Put ("Le cadeau affecte est ");
         Put (T_KDO'Image(Infoloc.Cadeau));
      Put_Line (".");
   END Affil_KDO;



--------------------------------- affichage donnes locataire a la saisie -------------------------------

----   PROCEDURE Affichage_Locataire (KDO_Tirage: IN OUT T_KDO; Infoloc : IN OUT T_Info_Locataire; Activite_Jour : IN OUT T_Activite_Locataire; Nbr_stock : IN OUT T_Gestion_KDO) IS
----      Nom_Locataire: Character;
----      Prenom_Locataire: Character;
----      Cadeau: T_KDO;
----      Veille: Boolean;
----      Activite_Jour: T_Activite_Locataire;

----   BEGIN
----
----      Put (Nom_Locataire);
----      Put (Prenom_Locataire);
----
----      Distribution_KDO (KDO_Tirage, Nbr_Stock);
----      Cadeau := KDO_Tirage;
----      Put (T_KDO'image(Cadeau));
----         FOR J IN T_Activite_Locataire'RANGE LOOP
----            Put (Info_Loc(Activite_Jour)(I).Choix_Act(J));
----         END LOOP;
----      Put (Info_Loc(Veille)(I));



----   PROCEDURE Affichage_Locataire (Info_Loc: IN OUT T_Locataire; Choix_Act : IN OUT T_Activite_Locataire) IS
----      Nom: Character;
----      Prenom_Locataire: Character;
----      Cadeau: T_KDO;
----      Veille: Boolean;
----      Activite_Jour: T_Activite_Locataire;
----
----   BEGIN
----      FOR I IN T_Locataire'RANGE LOOP
----         Put (Info_Loc.Nom_Locataire(Nom)(I));
----         Put (Info_Loc(Prenom_Locataire)(I));
----         Put (Info_Loc(Cadeau)(I));
----            FOR J IN T_Activite_Locataire'RANGE LOOP
----               Put (Info_Loc(Activite_Jour)(I).Choix_Act(J));
----            END LOOP;
----         Put (Info_Loc(Veille)(I));
----      END LOOP;
----
----   END Affichage_Locataire;

-------------------------------------------------------------------------------------------------------------





---- PROCEDURE Modif_activie
--   -- verifiaction nom prenom (condition) et descinscritpion (condition il faut qu'il se soit deja inscrit dans une activite,
--   --enlver une place dans le sdipso et la liste des elfes et raffichae les palnning mis a jour, et faire appel a la procedure inscription
-- --  PROCEDURE Stat_Locataire -- nbr de personne � la veillee, nbr personne qui participe � l'evenement et affichage

END Gestion_Locataire;
