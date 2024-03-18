WITH Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Aleatoire;
USE Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Aleatoire;

-- revoir quand il y a annulation de réservation quand on récupère le cadeau (stat_kdo)

PACKAGE BODY Gestion_KDO IS

   ---------------------- Afficher le stock des kdo ---------------------------------------

   PROCEDURE Affichage_Stock (Nbr_Stock : IN T_Gestion_KDO) IS
      BEGIN
         Put_Line ("Etat des stocks : ");
         FOR i IN T_Gestion_KDO'RANGE LOOP
            Put ("Le stock de ");
            Put (T_Kdo'image(I));
            Put (" est ");
            Put (Nbr_Stock(I));
            New_Line;
         END LOOP;
      END Affichage_Stock;

   --------------------------- Initialiser le stock de kdo ------------------------------------

   PROCEDURE Init_Stock (Nbr_Stock : OUT T_Gestion_KDO) IS

--   BEGIN
--      Nbr_Stock(Boissons) := 6;
--      Nbr_Stock(Biscuits) := 4;
--      Nbr_Stock(Chocolats) := 8;
--      Nbr_Stock(Fruits_Confits) := 5;
--   END Init_Stock;

   BEGIN
      Nbr_Stock(Boissons) := 2;
      Nbr_Stock(Biscuits) := 0;
      Nbr_Stock(Chocolats) := 1;
      Nbr_Stock(Fruits_Confits) := 3;
   END Init_Stock;


--   PROCEDURE Init_Stock (KDO: IN OUT T_KDO; Nbr_Stock : OUT T_Gestion_KDO) IS
--   BEGIN
--      Put_Line ("Veuillez saisir le stock initial.");
--         FOR I IN T_Kdo'RANGE LOOP
--         Put ("Stock de");
--         Put (T_Kdo'image(I));
--         Put (":"); new_line;
--            FOR J IN T_Gestion_Kdo'RANGE LOOP
--               Get (Nbr_Stock(J)); Skip_Line;
--            END LOOP;
--         END LOOP;
--   END Init_Stock;

   ------------------------ Distribuer les cadeaux et calcul du bilan distribue ----------------------------------------

   PROCEDURE Distribution_KDO (KDO_Tirage: IN OUT T_KDO; Nbr_Stock : IN OUT T_Gestion_KDO;Bilan_Kdo:IN OUT T_Gestion_KDO) IS

      Total : Integer;
      Pboissons, Pbiscuits, Pchocolats, Pfruits_Confits: Integer;
      N : Integer;

   BEGIN
      Total := 0;
      FOR I IN T_Gestion_KDO'RANGE LOOP
         Total := Total + (Nbr_Stock(I));
      END LOOP;

      Pboissons := (100 * Nbr_Stock(Boissons)) / Total;
      Pbiscuits := (100 * Nbr_Stock(Biscuits)) / Total;
      Pchocolats := (100 * Nbr_Stock(Chocolats)) / Total;
      Pfruits_Confits := (100 * Nbr_Stock(Fruits_Confits)) / Total;

--      Put (Pboissons); new_line;
--      Put (Pbiscuits); new_line;
--      Put (Pchocolats); new_line;
--      Put (Pfruits_Confits); new_line;

      Initialise(0,100);
      N := Random;

      Put (N); New_Line;

      IF N <= (Pbiscuits) THEN
         Nbr_Stock(Biscuits) := Nbr_Stock(Biscuits) - 1;
         KDO_Tirage := Biscuits;

      ELSIF N <= (Pbiscuits + Pfruits_Confits) THEN
         Nbr_Stock(Fruits_Confits) := Nbr_Stock(Fruits_Confits) - 1;
         KDO_Tirage := Fruits_Confits;

      ELSIF N <= (Pbiscuits + Pfruits_Confits + Pboissons) THEN
         Nbr_Stock(Boissons) := Nbr_Stock(Boissons) - 1;
         KDO_Tirage := Boissons;

      ELSIF N <= 100 THEN
         Nbr_Stock(Chocolats) := Nbr_Stock(Chocolats) - 1;
         KDO_Tirage := Chocolats;
      END IF;

      Bilan_Kdo(KDO_Tirage):= Bilan_Kdo(KDO_Tirage) + 1; ---- Pour calculer le bilan des cadeaux distribuees
      Put_Line ("Le tirage au sort a ete effectue.");
      Put (T_KDO'image(KDO_Tirage)); New_Line;

      Affichage_Stock(Nbr_Stock);
      New_Line;

   END Distribution_KDO;

   --------------------- Réapprovisionner les kdo ------------------------------------

   PROCEDURE Reassort (Nbr_stock : IN OUT T_Gestion_KDO) IS

   Ajout_Stock: integer;

   BEGIN
      Put_line ("Veuillez saisir le stock de reassort.");
      FOR I IN T_Gestion_Kdo'RANGE LOOP
         Put ("Reassort de ");
         Put (T_KDO'image(I));
         Put (":"); new_line;
            LOOP
               BEGIN
               Get (Ajout_stock); Skip_Line; exit;
               EXCEPTION
               WHEN Data_Error => Skip_Line;
               Put_Line ("Erreur de saisie. Veuillez ressaisir le stock correspond.");
               END;
            END LOOP;
         Nbr_Stock(I):= Nbr_Stock(I) + Ajout_Stock;
      END LOOP;
   END Reassort;


   ------------------- Bilan des kdo (revoir pour annulation) -----------------------------------
   PROCEDURE Stat_KDO (KDO_Tirage: IN T_KDO; Bilan_Kdo : IN OUT T_Gestion_KDO) IS

   BEGIN
--      Bilan_Kdo := (OTHERS => 0);
      Bilan_Kdo(KDO_Tirage):=Bilan_Kdo(KDO_Tirage)+1;

--      FOR I IN T_Gestion_Kdo'RANGE LOOP
--         IF KDO_Tirage = (I) THEN
--            Bilan_Kdo(I) := Bilan_Kdo(I) + 1;
--         ELSIF Nbr_Stock(I) = Nbr_Stock(I) + 1 THEN
--            Bilan_Kdo(I) := Bilan_Kdo(I) - 1;
-- Voir avec annulation des réservations
--         END IF;

--         Put (Bilan_Kdo(I));
--         Put (" de ");
--         Put (T_Kdo'image(I));
--         Put (" ont ete distribue.");
--         New_Line;

--      END LOOP;

   END Stat_Kdo;



   -------------------- Affich stat KDO ------------------------------

   PROCEDURE Affic_Stat_KDO (Bilan_Kdo : IN T_Gestion_KDO) IS

   BEGIN
      FOR I IN T_Gestion_Kdo'RANGE LOOP
         Put (Bilan_Kdo(I));
         Put (" de ");
         Put (T_Kdo'image(I));
         Put (" ont ete distribue.");
         New_Line;
      END LOOP;

   END Affic_Stat_KDO;

END Gestion_Kdo;