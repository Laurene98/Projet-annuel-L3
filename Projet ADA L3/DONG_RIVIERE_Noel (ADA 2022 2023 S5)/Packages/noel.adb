WITH Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Outils, Gestion_Activites, Gestion_Fichier,Gestion_Locataire, Gestion_Kdo, Gestion_Igloo, Gestion_Elfes;
USE Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Outils, Gestion_Activites, Gestion_Fichier, Gestion_Locataire, Gestion_Kdo, Gestion_Igloo, Gestion_Elfes;


PROCEDURE Noel IS
   Mon_choix,igl, visual, activ, sta,Numigloo, Numloc, reserv, sauv:integer;
   Nbr_Stock: T_Gestion_KDO;
   Bilan_KDO: T_Gestion_KDO := (0,0,0,0);
   Nbr_Place: T_Gestion_Activite;
   Choix : T_Activite_Locataire;
   Infoloc: T_Info_Locataire;
   Liste_E: T_Elfes;
   Nbr_Pers_Jour: T_Nbrper_Elfes;
   Igloo: T_Info_Igloo;
   Liste_Igloo:T_Igloo;
   Choix_Act : T_Activite;
   Sem, Jours : T_Semaine;
   KDO_Tirage: T_KDO;


BEGIN

   ---------------------------- Donnees d'initialisation -------------------------
   Initial_Act (Nbr_Place);
   Init_Stock (Nbr_Stock);
   Non_Cree (Igloo,Liste_Igloo);
   Initial_Igloo (Igloo,Liste_Igloo);
   Liste_Elfes (Liste_E);
   Elfes (Liste_E, Nbr_Pers_Jour);

   -------------------------------------------------------------------------------

   Put_Line ("Le projet Ada : DONG Laurene et RIVIERE Jade"); New_Line;

   LOOP
      Put_Line (" ----- Menu principal -----"); New_Line;
      Put_Line ("1 : Visualisation des donnees de depart");
      Put_Line ("2 : Gestion des igloos");
      Put_Line ("3 : Gestion des activites");
      Put_Line ("4 : Ajouter / Annuler une reservation");
      Put_Line ("5 : Reaprovisionner les cadeaux");
      Put_Line ("6 : Voir les statistiques");
      Put_Line ("7 : Sauvegarde et restauration");
      Put_Line ("0 : Sortir");

      Put_Line ("Saissisez votre choix."); New_Line; New_Line;

      LOOP
         BEGIN
            Get(Mon_Choix); Skip_Line; EXIT;
            EXCEPTION
            WHEN Data_Error => Skip_Line; Put_Line ("Erreur de saisie. Recommencez");
         END;
      END LOOP;
      New_Line;
      New_Line;

   -------------------------------- Case MENU PRINCIPAL --------------------------------------

   CASE Mon_Choix IS

   --------------------------------- Visualisation des donnees de depart --------------------
      WHEN 1=> -- Visualisation des donnees de depart

            LOOP
               Put_Line (" ----- Visualisation des donnees -----"); New_Line;
               Put_Line ("1 : Liste de tous les locataires");
               Put_Line ("2 : Liste de tous les igloos");
               Put_Line ("3 : Liste igloos et ses locataires");
               Put_Line ("4 : Disponibilite des activites");
               Put_Line ("5 : Stock des cadeaux");
               Put_Line ("0 : Sortir");

               Put_Line ("Saissisez votre choix."); New_Line;  New_Line;

               LOOP
                  BEGIN
                     Get(Visual); Skip_Line; EXIT;
                     EXCEPTION
                     WHEN Data_Error => Skip_Line; Put_Line ("Erreur de saisie. Recommencez");
                  END;
               END LOOP;

               CASE Visual IS
                  WHEN 1 => -- Liste de tous les locataires
                     Liste_loca (Igloo,Liste_Igloo); New_Line; New_Line;
                  WHEN 2 => -- Liste de tous les igloos
                     ListeIgloo (Igloo,Liste_Igloo); New_Line; New_Line;
                  WHEN 3 => -- Liste igloos et ses locatairess
                     Affich_Igloo (Igloo,Liste_Igloo); New_Line; New_Line;
                  WHEN 4 => -- Disponibilité des activites
                     Put_line ("Voici les disponibilites des activites."); New_line;
                     Affich_tab (Nbr_Place); New_Line; New_Line;
                  WHEN 5 => -- Stock des cadeaux
                     Put_line ("Voici le stock des cadeaux."); New_line;
                     Affichage_Stock (Nbr_Stock); New_Line; New_Line;
                  WHEN 0 => EXIT;
               WHEN OTHERS => NULL;
               END CASE;
            END LOOP;
            New_Line;
            New_Line;

   --------------------------------- Gestion des igloos ---------------------------------

      WHEN 2 => -- Gestion des igloos

            LOOP
               Put_Line (" ----- Gestion des igloos -----"); New_Line;
               Put_Line ("1 : Creation d'un igloo");
               Put_Line ("2 : Affichage des igloos");
               Put_Line ("0 : Sortir");

               Put_Line ("Saissisez votre choix."); New_Line;  New_Line;

               LOOP
                  BEGIN
                     Get(Igl); Skip_Line; EXIT;
                     EXCEPTION
                     WHEN Data_Error => Skip_Line; Put_Line ("Erreur de saisie. Recommencez");
                  END;
               END LOOP;

               CASE Igl IS
                  WHEN 1 => -- Creation d'un igloo
                     Crea_Igloo (Igloo,Liste_Igloo); New_Line; New_Line;
                  WHEN 2 => -- Affichage des igloos
                     ListeIgloo (Igloo,Liste_Igloo); New_Line; New_Line;
                  WHEN 0 => EXIT;
               WHEN OTHERS => NULL;
               END CASE;
            END LOOP;
            New_Line;
            New_Line;

   --------------------------------- Gestion des activites ---------------------------------

      WHEN 3 => -- Gestion des activites

            LOOP
               Put_Line (" ----- Gestion des Activites -----"); New_Line;
               Put_Line ("1 : Reservation des activites");
               Put_Line ("2 : Modification des activites");
               Put_Line ("0 : Sortir");

               Put_Line ("Saissisez votre choix."); New_Line;  New_Line;

               LOOP
                  BEGIN
                     Get(Activ); Skip_Line; EXIT;
                     EXCEPTION
                     WHEN Data_Error => Skip_Line; Put_Line ("Erreur de saisie. Recommencez");
                  END;
               END LOOP;

               CASE Activ IS
                  WHEN 1 => -- Reservation des activites
                     Verifloc_Ins (Infoloc,Igloo, Liste_Igloo, Numigloo, Numloc, Choix_Act, Nbr_Place, Choix, Sem, Jours);
                     New_Line; New_Line;
-- l'affectation dans la visualisation ne fonctionne pas
-- la mise a jour du tableau de disponibilite fonctionne les autres ne sont pas realise
                  WHEN 2 => -- Modification des activites
                     Recherche (Infoloc, Igloo, Liste_Igloo, Numigloo, Numloc);
                     New_Line; New_Line;
---- mettre une procedure annulation qui recalcule les disponibilites
                     Put_line ("Vos reservations sont annulees. Veuillez ressaisir vos activites.");
                     Put_line ("Voici les disponibilites des activites."); New_line;
                     Affich_Tab (Nbr_Place); New_Line; New_Line;
                     Saisie_Act (Choix_Act, Nbr_Place, Choix, Sem, Jours); New_Line; New_Line;
-- meme chose que pour l'inscription
                  WHEN 0 => EXIT;
               WHEN OTHERS => NULL;
               END CASE;
            END LOOP;
            New_Line;
            New_Line;

   --------------------------------- Ajouter ou annuler une réservation ---------------------------------

      WHEN 4 => NULL;-- Ajouter ou annuler une réservation

            LOOP
               Put_Line (" ----- Ajouter ou annuler une reservation -----"); New_Line;
               Put_Line ("1 : Ajouter une reservation");
               Put_Line ("2 : Annuler une reservation");
               Put_Line ("0 : Sortir");

               Put_Line ("Saissisez votre choix."); New_Line;  New_Line;

               LOOP
                  BEGIN
                     Get(Reserv); Skip_Line; EXIT;
                     EXCEPTION
                     WHEN Data_Error => Skip_Line; Put_Line ("Erreur de saisie. Recommencez");
                  END;
               END LOOP;

               CASE Reserv IS
                  WHEN 1 => -- Ajouter une réservation
                     Reservation_Igloo (Igloo,Liste_Igloo, Numigloo); New_Line;
--- connecter les entrees et l'attribution
                     Saisie_Loc (Infoloc); New_Line;
                     Distribution_KDO (KDO_Tirage, Nbr_Stock, Bilan_Kdo); New_Line;
                     Affil_KDO (KDO_Tirage,Nbr_Stock, Infoloc,Bilan_Kdo); New_Line;
                     Inscription_Veille (Igloo, Liste_Igloo, Numigloo,Numloc);
                     New_Line; New_Line;
                  WHEN 2 => -- Annuler une réservation
                     Recherche (Infoloc, Igloo, Liste_Igloo, Numigloo, Numloc);
--- mettre une procedure qui initialise tout
                     New_Line; New_Line;
                  WHEN 0 => EXIT;
               WHEN OTHERS => NULL;
               END CASE;
            END LOOP;
            New_Line;
            New_Line;



   --------------------------------- Reaprovisionner les cadeaux ---------------------------------

      WHEN 5 => -- Reaprovisionner les cadeaux");
            Reassort (Nbr_Stock);
            New_Line;
            New_Line;
            Affichage_Stock (Nbr_Stock);
            New_Line; New_Line;

   --------------------------------- Statistiques ---------------------------------

      WHEN 6 => NULL;-- Voir les statistiques");

            LOOP
               Put_Line (" ----- Statistiques -----"); New_Line;
               Put_Line ("1 : Elfes");
               Put_Line ("2 : Nombre de personnes inscrit a la veille");
               Put_Line ("3 : Cadeaux distribues");
               Put_Line ("4 : Bilan des activites");
               Put_Line ("5 : Meilleur activite");
               Put_Line ("6 : Nombre de reservation");
               Put_Line ("0 : Sortir");

               Put_Line ("Saissisez votre choix."); New_Line;  New_Line;

               LOOP
                  BEGIN
                     Get(Sta); Skip_Line; EXIT;
                     EXCEPTION
                     WHEN Data_Error => Skip_Line; Put_Line ("Erreur de saisie. Recommencez");
                  END;
               END LOOP;

               CASE Sta IS
                  WHEN 1 => -- Elfes
                     Put_Line ("Voici les donnes des elfes et le nombre de personnes qu'ils encadrent.");
                     Visualisation_Elfes (Liste_E,Nbr_Pers_Jour); New_Line; New_Line;
                  WHEN 2 => -- Nombre de personnes inscrit a la veille
                     Veille (Igloo,Liste_Igloo); New_Line; New_Line;
                  WHEN 3 => NULL;-- Cadeaux distribues
                  WHEN 4 => NULL;-- Bilan des activites
                  WHEN 5 => NULL;-- Meilleur activite
                  WHEN 6 => NULL;-- Nombre de reservation
                  WHEN 0 => EXIT;
                  WHEN OTHERS => NULL;
               END CASE;
            END LOOP;
            New_Line;
            New_Line;


            ---------------------------------- Sauvegarde et Restauration -------------------------------------------

      WHEN 7 => -- Sauvegarde et restauration");
            LOOP
               Put_Line (" ----- Statistiques -----"); New_Line;
               Put_Line ("1 : Sauvegarder");
               Put_Line ("2 : Restaurer");
               Put_Line ("0 : Sortir");

               Put_Line ("Saissisez votre choix."); New_Line;  New_Line;

               LOOP
                  BEGIN
                     Get(Sauv); Skip_Line; EXIT;
                     EXCEPTION
                     WHEN Data_Error => Skip_Line; Put_Line ("Erreur de saisie. Recommencez");
                  END;
               END LOOP;

               CASE Sauv IS
                  WHEN 1 => -- Sauvegarder
                     Enregistrer_Reg_Igloo(Liste_Igloo);
                     New_Line; New_Line;
                  WHEN 2 => -- Restaurer
                     Restaurer_Reg_Igloo(Liste_Igloo);
                     New_Line; New_Line;
                  WHEN 0 => EXIT;
               WHEN OTHERS => NULL;
               END CASE;
            END LOOP;
            New_Line;
            New_Line;

            -------------------------------------- Retour menu principal ------------------------------------------

      WHEN 0 => EXIT; -- Sortir
      WHEN OTHERS => NULL;

   END CASE;

            END LOOP;
               Put_Line ("Merci de votre visite!!!");
END Noel;



--CASE Mon_Choix IS
--WHEN 1 =>
--WHEN 2 =>
--WHEN 3 =>
--WHEN 4 =>
--WHEN 0 => EXIT;
--WHEN OTHERS => NULL;
