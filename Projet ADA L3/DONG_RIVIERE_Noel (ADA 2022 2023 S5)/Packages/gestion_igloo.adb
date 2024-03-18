WITH Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Outils, Gestion_KDO, Gestion_Activites,  Gestion_Locataire;
USE Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Outils, Gestion_KDO, Gestion_Activites, Gestion_Locataire;

PACKAGE BODY Gestion_Igloo IS

   ----------------------- Initialisation igloo non cree ----------------------------
   PROCEDURE Non_Cree (Igloo: IN OUT T_Info_Igloo; Liste_Igloo: IN OUT T_Igloo) IS

   BEGIN
      FOR I IN T_Igloo'RANGE LOOP
         Liste_Igloo(I).Id_Igloo := -1;
         Liste_Igloo(I).Capacite := -1;
         Liste_Igloo(I).Nb_Locataire := -1;
      END LOOP;

   END Non_Cree;

   ---------------------- recherche personne -----------------------------------------------

   PROCEDURE Recherche (Infoloc : IN OUT T_Info_Locataire ;Igloo: IN OUT T_Info_Igloo; Liste_Igloo: IN OUT T_Igloo; numigloo : IN OUT integer; numloc : IN OUT integer) IS


   BEGIN

      Saisie_Loc(Infoloc);
      NumIgloo:= -2;
      NumLoc:=-2;
      FOR I IN Liste_Igloo'RANGE LOOP
         FOR J IN Liste_Igloo(I).liste_locataires'range LOOP
            IF Liste_Igloo(I).Liste_Locataires(J).Nom_Locataire = Infoloc.Nom_Locataire AND Liste_Igloo(I).Liste_Locataires(J).Prenom_Locataire = Infoloc.Prenom_Locataire THEN
               NumIgloo:= I;
               NumLoc:= J;
            END IF;
         END LOOP;
      END LOOP;

--      Put (NumIgloo);
--      New_Line;
--      Put(NumLoc);


   END Recherche;

   ---------------------- Verif locataire -----------------------------------------------


   PROCEDURE verifloc_ins (Infoloc : IN OUT T_Info_Locataire ;Igloo: IN OUT T_Info_Igloo; Liste_Igloo: IN OUT T_Igloo; numigloo : IN OUT integer; numloc : IN OUT integer; Choix_Act: IN OUT T_Activite; Nbr_Place: IN OUT T_Gestion_Activite; Choix : OUT T_Activite_Locataire; Sem: IN T_Semaine; Jours : IN T_Semaine) IS
      I, J: Integer;



   BEGIN
      Recherche (Infoloc, Igloo, Liste_Igloo, Numigloo, Numloc);


         IF NumIgloo = -2 AND THEN NumLoc =-2 THEN
         Put_Line (" Le locataire n'a pas ete retrouve. Recommencez.");
      ELSE

FOR Jour IN T_Semaine'RANGE LOOP -- affichage activites locataires

         IF (Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(Jour) = Raquette
               OR Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(Jour) = Patinoire
               OR Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(Jour) = Traineau
               OR Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(Jour) = Biscuits
               OR Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(Jour) = Deco
               OR Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(Jour) = Igloos
               OR Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(Jour) = Rennes
               OR Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(Jour) = Ateliers)
            AND
               (Jour = Lundi XOR Jour = Mardi XOR Jour = Mercredi XOR Jour = Jeudi XOR Jour = Vendredi) THEN
               Put_Line (" Vous etes deja inscrit a des activites."); EXIT;

      ELSIF Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(Jour) = Rien
                        AND
                           (Jour = Lundi OR Jour = Mardi OR Jour = Mercredi OR Jour = Jeudi OR Jour = Vendredi)
                              THEN




                                 Put_Line ("Vous avez decide de vous inscrire a des activites");
                                 Put_line ("Voici les disponibilites des activites."); New_line;
                        Affich_Tab (Nbr_Place); New_Line; New_Line;
                        Saisie_Act (Choix_Act, Nbr_Place, Choix, Sem, Jours);
                        Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(Jour) := Choix (Jour);

                           New_Line;
                           New_Line;


               Put (" Locataire ");
               Put (Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Nom_Locataire); -- affichage nom
               Put (" ");
               Put (Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Prenom_Locataire); -- affichage prenom
               new_line;
                           Put_Line ("Vous etes inscrit :");
       FOR I IN Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour'RANGE LOOP -- affichage activites locataires
                     put(T_semaine'image(I)); put (" : "); -- affichage jour
                     Put(T_Activite'Image(Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(I))); -- affichage activite
                     New_Line;
      END LOOP;

                EXIT;
                  END IF;
            END LOOP;


-- END LOOP;

            END IF;

   END verifloc_ins;




--FOR Z IN T_Semaine'RANGE LOOP -- affichage activites locataires

--         IF (Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(Z) = Raquette
--               OR Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(Z) = Patinoire
--               OR Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(z) = Traineau
--               OR Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(Z) = Biscuits
--               OR Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(z) = Deco
--               OR Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(Z) = Igloos
--               OR Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(z) = Rennes
--               OR Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(Z) = Ateliers)
--            AND
--               (Z = Lundi XOR Z = Mardi XOR Z = Mercredi XOR Z = Jeudi XOR Z = Vendredi) THEN
--               Put_Line (" Vous etes deja inscrit a des activites."); EXIT;
--
--      ELSIF Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(Z) = Rien
--                        AND
--                           (Z = Lundi OR Z = Mardi OR Z = Mercredi OR Z = Jeudi OR Z = Vendredi)
--                              THEN




--                                 Put_Line ("Vous avez decide de vous inscrire a des activites");
--                                 Put_line ("Voici les disponibilites des activites."); New_line;
--                        Affich_Tab (Nbr_Place); New_Line; New_Line;
--                        Saisie_Act (Choix_Act, Nbr_Place, Choix, Sem, Jours);
--                        Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(Z) := Choix (Z);

--                           New_Line;
--                           New_Line;


--               Put (" Locataire ");
--               Put (Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Nom_Locataire); -- affichage nom
--               Put (" ");
--               Put (Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Prenom_Locataire); -- affichage prenom
--               new_line;
--                           Put_Line ("Vous etes inscrit :");
-- FOR I IN Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour'RANGE LOOP -- affichage activites locataires
--                     put(T_semaine'image(I)); put (" : "); -- affichage jour
--                     Put(T_Activite'Image(Liste_Igloo(NumIgloo).Liste_Locataires(NumLoc).Activite_Jour(I))); -- affichage activite
--                     New_Line;
--      END LOOP;

--                EXIT;
--                  END IF;
--            END LOOP;
--

---- END LOOP;

--            END IF;

--   END verifloc_ins;


   ------------------------------------- Inscription veille -----------------------------------------------------

   PROCEDURE Inscription_Veille (Igloo: IN OUT T_Info_Igloo; Liste_Igloo: IN OUT T_Igloo; numigloo : IN OUT integer; numloc : IN OUT integer) IS
   veil : Integer;
   BEGIN

      LOOP
      Put_Line ("Voulez vous Participer A La Veille : Saississez 0 => OUI Et 1 => NON");
         BEGIN
            Get(veil); Skip_Line; EXIT WHEN veil = 0 or veil = 1;
            EXCEPTION
            WHEN Data_Error => Skip_Line; Put_Line ("Erreur de saisie. Recommencez");
         END;
      END LOOP;

      FOR numigloo IN Liste_Igloo'RANGE LOOP
         FOR numloc IN Liste_Igloo(numigloo).Liste_Locataires'RANGE LOOP
            IF Veil = 0 THEN
               Liste_Igloo(numigloo).Liste_Locataires(numloc).Veille := True;
               ELSE
               Liste_Igloo(numigloo).Liste_Locataires(numloc).Veille := False;
            END IF;
         END LOOP;
      END LOOP;

   END Inscription_Veille;


--   PROCEDURE Inscription_Veille (Igloo: IN OUT T_Info_Igloo; Liste_Igloo: IN OUT T_Igloo) IS
--   veil : Integer;
--   BEGIN
--
--      LOOP
--      Put_Line ("Voulez vous Participer A La Veille : Saississez 0 => OUI Et 1 => NON");
--         BEGIN
--            Get(veil); Skip_Line; EXIT WHEN veil = 0 or veil = 1;
--            EXCEPTION
--            WHEN Data_Error => Skip_Line; Put_Line ("Erreur de saisie. Recommencez");
--         END;
--      END LOOP;

--      FOR I IN Liste_Igloo'RANGE LOOP
--         FOR J IN Liste_Igloo(I).Liste_Locataires'RANGE LOOP
--            IF Veil = 0 THEN
--               Liste_Igloo(I).Liste_Locataires(J).Veille := True;
--               ELSE
--               Liste_Igloo(I).Liste_Locataires(J).Veille := False;
--            END IF;
--         END LOOP;
--      END LOOP;
--
--   END Inscription_Veille;

   ------------------------- Affichage igloo --------------------------------------------
   PROCEDURE Affich_Igloo (Igloo: IN OUT T_Info_Igloo; Liste_Igloo: IN OUT T_Igloo) IS

   BEGIN
      FOR I IN Liste_Igloo'RANGE LOOP

      Put ("Pour l'igloo n");
      Put (Liste_Igloo(I).Id_Igloo);
      Put (", on a: ");
      New_Line;

      Put ("Capacite : ");
      Put (Liste_Igloo(I).Capacite);
      New_Line;

      Put ("Nombre de locataire : ");
      Put (Liste_Igloo(I).Nb_Locataire);
      New_Line;


         IF Liste_Igloo(I).Nb_Locataire > 0 THEN
            Put_Line ("La liste des locataires");
            FOR J IN Liste_Igloo(I).liste_locataires'range LOOP
               EXIT WHEN J = Liste_Igloo(I).Nb_Locataire;
               Put ("Nom : ");
               Put (Liste_Igloo(I).Liste_Locataires(J).Nom_Locataire); -- affichage nom
               New_Line;
               Put ("Prenom : ");
               Put (Liste_Igloo(I).Liste_Locataires(J).Prenom_Locataire); -- affichage prenom
               new_line;
               Put ("Cadeau: ");
               Put (T_KDO'Image(Liste_Igloo(I).Liste_Locataires(J).Cadeau)); -- affichage cadeau
               New_Line;

                  FOR Z IN Liste_Igloo(I).Liste_Locataires(J).Activite_Jour'RANGE LOOP -- affichage activites locataires
                     put(T_semaine'image(Z)); put (" : "); -- affichage jour
                     Put(T_Activite'Image(Liste_Igloo(I).Liste_Locataires(J).Activite_Jour(Z))); -- affichage activite
                     New_Line;
                  END LOOP;

                  IF Liste_Igloo(I).Liste_Locataires(J).Veille THEN -- participe a la veille ?
                     Put("Participe a la veille.");
                  ELSE
                     Put("Ne participe pas a la veille."); New_Line;
                  END IF;

               New_Line;
            END LOOP; New_Line;
         ELSIF Liste_Igloo(I).Nb_Locataire = 0 THEN
            Put_Line ("Pas de locataire.");
         ELSIF Liste_Igloo(I).Nb_Locataire < 0 THEN
            Put_Line ("Igloo non construit.");
         END IF;
         New_Line;New_Line;
      END LOOP;

   END Affich_Igloo;


   ------------------------- Comptage de veille --------------------------------------------
   PROCEDURE Veille (Igloo: IN OUT T_Info_Igloo; Liste_Igloo: IN OUT T_Igloo) IS
   BEGIN

      Put ("Le nombre de personnes qui participe a la veille est de ");
      Put (Nb_veille (Igloo,Liste_Igloo));
      Put (".");
   END Veille;

                        ----------------------------------------------------

   FUNCTION Nb_Veille (Igloo: T_Info_Igloo; Liste_Igloo: T_Igloo) RETURN Integer IS
      nbdeveille : integer := 0;

   BEGIN
      FOR I IN Liste_Igloo'RANGE LOOP

       IF Liste_Igloo(I).Nb_Locataire > 0 THEN
            FOR J IN Liste_Igloo(I).liste_locataires'range LOOP
            EXIT WHEN J = Liste_Igloo(I).Nb_Locataire;
               IF Liste_Igloo(I).Liste_Locataires(J).Veille THEN -- participe a la veille ?
                  nbdeveille := nbdeveille + 1;
               END IF;
            END LOOP;
         END IF;
      END LOOP;
      RETURN (Nbdeveille);

   END nb_veille;


   ------------------------- Liste igloo --------------------------------------------
   PROCEDURE ListeIgloo (Igloo: IN OUT T_Info_Igloo; Liste_Igloo: IN OUT T_Igloo) IS

   BEGIN
      FOR I IN Liste_Igloo'RANGE LOOP
         IF Liste_Igloo(I).Id_Igloo /= -1 THEN

            Put ("Pour l'igloo n");
            Put (Liste_Igloo(I).Id_Igloo);
            Put (", on a: ");
            New_Line;

            Put ("Capacite : ");
            Put (Liste_Igloo(I).Capacite);
            New_Line;

            Put ("Nombre de locataire : ");
            Put (Liste_Igloo(I).Nb_Locataire);
            New_Line; New_Line; New_Line;
         END IF;

      END LOOP;

   END ListeIgloo;

   ----------------------------- Affichage infos locataire (Initial) ------------------------------------------------

   PROCEDURE Liste_loca (Igloo: IN OUT T_Info_Igloo; Liste_Igloo: IN OUT T_Igloo) IS

   BEGIN
      FOR I IN Liste_Igloo'RANGE LOOP
         IF Liste_Igloo(I).Nb_Locataire > 0 THEN
            Put ("La liste des locataires, pour l igloo "); put (i); Put_Line (":");
            FOR J IN Liste_Igloo(I).liste_locataires'range LOOP
               EXIT WHEN J = Liste_Igloo(I).Nb_Locataire;
               Put ("- ");
               Put (Liste_Igloo(I).Liste_Locataires(J).Nom_Locataire); -- affichage nom
               Put (" ");
               Put (Liste_Igloo(I).Liste_Locataires(J).Prenom_Locataire); -- affichage prenom
               New_Line;
            END LOOP; New_Line;
         ELSIF Liste_Igloo(I).Nb_Locataire = 0 THEN
            Put_Line ("Pas de locataire.");
         ELSIF Liste_Igloo(I).Nb_Locataire < 0 THEN
            Put_Line ("Igloo non construit.");
         END IF;
         New_Line;New_Line;
      END LOOP;

   END Liste_loca;


   --------------------------------- Création d'igloo ---------------------------------------

   PROCEDURE Crea_Igloo (Igloo: IN OUT T_Info_Igloo; Liste_Igloo: IN OUT T_Igloo) is
      N:Integer;
      Z: Integer;

   BEGIN

      Put ("Vous voulez creer un igloo."); New_Line;

      LOOP
         BEGIN
            Put ("Saisir la capacite de l'igloo de 2, 4 ou 6. "); New_Line;
            Get(N); Skip_Line;
            EXIT WHEN N=2 OR N=4 OR N=6;
            Put("La capacite saisie est incorrect. Recommencez."); New_Line;
         EXCEPTION WHEN Data_Error=> Skip_Line; Put ("Erreur de saisie. Veuillez saisir un entier."); New_Line;
         END;
      END LOOP;

      FOR I IN T_Igloo'RANGE LOOP
         IF Liste_Igloo(I).Id_Igloo = -1 THEN
            Liste_Igloo(I) := Igloo;
            Liste_Igloo(I).Id_Igloo := I;
            Liste_Igloo(I).Capacite := N;
            Liste_Igloo(I).Nb_Locataire := 0;
            Put ("L igloo n");
            Put (Liste_Igloo(I).Id_Igloo);
            Put (" est ouverte a la location, sa capacite est de ");
               Put (Liste_Igloo(I).Capacite);
               Put (".");
            New_Line;
            ELSIF Liste_Igloo(I).Id_Igloo /= -1 THEN
            Put_Line ("Creation impossible, cette emplacement est occupe.");
            END IF;

      END LOOP;

   END Crea_Igloo;

------------------------------------------------------------------------------------
   PROCEDURE Reservation_Igloo (Igloo: IN OUT T_Info_Igloo; Liste_Igloo: IN OUT T_Igloo; numigloo: IN OUT integer) IS
      N:Integer;

      Begin
         LOOP
            BEGIN
               numigloo := 0;
               Put_Line("Preciser le nombre de couchages requis.");
               Get(N); Skip_Line;
               EXIT WHEN N < 6;
               Put("Le nombre de couchage est invalide");
            EXCEPTION WHEN Data_Error=> Put ("Erreur de saisie, la capacite des igloos est de 6 personnes maximum.");
            END;
         END LOOP;

         FOR I IN Liste_Igloo'RANGE LOOP
            IF Liste_Igloo(I).Loue=False AND Liste_Igloo(I).Capacite=N THEN
               Liste_Igloo(I).Loue:=True;
               Put("Attribution de l'igloo.");Put(I);New_Line;
               numigloo := i;
               EXIT;
            ELSIF Liste_Igloo(I).Loue=False AND Liste_Igloo(I).Capacite/=N THEN
               IF Liste_Igloo(I).Loue=False AND Liste_Igloo(I).Capacite=N+1 THEN
                  Liste_Igloo(I).Loue:=True;
                  Put("Attribution de l'igloo.");Put(I);New_Line;EXIT;
                  numigloo := i;
               END IF;
            END IF;

         END LOOP;
         FOR I IN Liste_Igloo'RANGE LOOP
            IF Liste_Igloo(I).Loue=False THEN
               Put("Pas d'igloo de capacite suffisante.");New_Line; Exit;
            END IF;
         END LOOP;

         Put (Numigloo);

      END Reservation_Igloo;

---------------------------------------------------------

   PROCEDURE Initial_Igloo (Igloo: IN OUT T_Info_Igloo; Liste_Igloo: IN OUT T_Igloo) IS

   Infoloc1,Infoloc2,Infoloc3,Infoloc4,Infoloc5,Infoloc6,Infoloc7,Infoloc8,Infoloc9,Infoloc10,Infoloc11,Infoloc12,Infoloc13,Infoloc14,Infoloc15,Infoloc16,Infoloc17:T_Info_Locataire;


   BEGIN

Liste_Igloo(1).Id_Igloo:=1;
Liste_Igloo(1).Capacite:=4;
Liste_Igloo(1).Nb_Locataire:=3;
Liste_Igloo(1).Loue:=True;

Liste_Igloo(2).Id_Igloo:=2;
Liste_Igloo(2).Capacite:=6;
Liste_Igloo(2).Nb_Locataire:=5;
Liste_Igloo(2).Loue:=True;


Liste_Igloo(3).Id_Igloo:=3;
Liste_Igloo(3).Capacite:=2;
Liste_Igloo(3).Nb_Locataire:=2;
Liste_Igloo(3).Loue:=True;


Liste_Igloo(4).Id_Igloo:=4;
Liste_Igloo(4).Capacite:=4;
Liste_Igloo(4).Nb_Locataire:=4;
Liste_Igloo(4).Loue:=True;


Liste_Igloo(5).Id_Igloo:=5;
Liste_Igloo(5).Capacite:=4;
Liste_Igloo(5).Nb_Locataire:=0;
Liste_Igloo(5).Loue:= false;


Liste_Igloo(6).Id_Igloo:=6;
Liste_Igloo(6).Capacite:=4;
Liste_Igloo(6).Nb_Locataire:=3;
Liste_Igloo(6).Loue:=True;


      Infoloc1:= ("VALJEAN                       ", "JEAN                          ", Boissons,(Raquette, Patinoire, Rien, Raquette, Rennes, Rien, Rien),True);
      Infoloc2:= ("VALJEAN                       ", "MARIE                         ", Chocolats, (Traineau, Patinoire, Deco, Biscuits, Rien, Rien, Rien),True);
      Infoloc3:= ("VALJEAN                       ", "LULU                          ", Biscuits, (Traineau, Biscuits, Deco, Ateliers, Rennes,Rien, Rien),True);

      Liste_Igloo(1).Liste_Locataires(1):=Infoloc1;
      Liste_Igloo(1).Liste_Locataires(2):=Infoloc2;
      Liste_Igloo(1).Liste_Locataires(3):=Infoloc3;


      Infoloc4:= ("PERRAULT                      ", "CHARLES                       ", Chocolats,(Traineau,Raquette, Biscuits,Igloos,Rennes,Rien, Rien),True);
      Infoloc5:= ("PERRAULT                      ", "JEANNE                        ", Chocolats,(Biscuits,Raquette, Traineau,Igloos,Rennes,Rien, Rien),True);
      Infoloc6:= ("PERRAULT                      ", "BLANCHE                       ", Fruits_confits,(Biscuits,Rien, Deco,Rien,Ateliers,Rien, Rien),True);
      Infoloc7:= ("PERRAULT                      ", "PAUL                          ", Biscuits,(Igloos,Patinoire,Traineau,Biscuits,Rennes,Rien, Rien),False);
      Infoloc8:= ("PERRAULT                      ", "ARIEL                         ", Chocolats,(Traineau,Patinoire,Deco,Biscuits,Ateliers,Rien, Rien),True);


      Liste_Igloo(2).Liste_Locataires(1):=Infoloc4;
      Liste_Igloo(2).Liste_Locataires(2):=Infoloc5;
      Liste_Igloo(2).Liste_Locataires(3):=Infoloc6;
      Liste_Igloo(2).Liste_Locataires(4):=Infoloc7;
      Liste_Igloo(2).Liste_Locataires(5):=Infoloc8;

     Infoloc9:= ("SKY                           ", "Luke                          ", Chocolats,(Traineau,Igloos,Patinoire,Raquette,Rennes,Rien, Rien),True);
     Infoloc10:= ("SKY                           ", "LEILA                         ", Fruits_confits,(Biscuits,Patinoire,Deco,Raquette,Ateliers,Rien, Rien),True);

     Liste_Igloo(3).Liste_Locataires(1):=Infoloc9;
     Liste_Igloo(3).Liste_Locataires(2):=Infoloc10;

     Infoloc11:= ("LOVELACE                      ", "ADA                           ",Boissons,(Traineau,Patinoire,Rien,Rien,Igloos,Rien, Rien),False);
     Infoloc12:= ("LOVELACE                      ", "BOB                           ", Chocolats,(Traineau,Patinoire,Deco,biscuits,Rien,Rien, Rien),True);
     Infoloc13:= ("BABBAGE                       ", "CHARLES                       ",Biscuits,(Igloos,Patinoire,Traineau,Biscuits,Rennes,Rien, Rien),False);
     Infoloc14:= ("BABBAGE                       ", "ALICE                         ", Boissons,(Traineau,Biscuits,Deco,Ateliers,Rennes,Rien, Rien),True);
     Liste_Igloo(4).Liste_Locataires(1):=InfoLoc11;
     Liste_Igloo(4).Liste_Locataires(2):=InfoLoc12;
     Liste_Igloo(4).Liste_Locataires(3):=InfoLoc13;
     Liste_Igloo(4).Liste_Locataires(4):=InfoLoc14;

     Infoloc15:= ("PAN                           ", "PETER                         ",Boissons,(Rien,Rien,Rien,Rien,Rien,Rien, Rien),False);
     Infoloc16:= ("PAN                           ", "WENDY                         ",Chocolats,(Rien,Rien,Rien,Rien,Rien,Rien, Rien),False);
     Infoloc17:= ("PAN                           ", "MICHEL                        ",Biscuits,(Rien,Rien,Rien,Rien,Rien,Rien, Rien),False);

     Liste_Igloo(6).Liste_Locataires(1):=InfoLoc15;
     Liste_Igloo(6).Liste_Locataires(2):=InfoLoc16;
     Liste_Igloo(6).Liste_Locataires(3):=InfoLoc17;


   END Initial_Igloo;

  END Gestion_Igloo;

--         PROCEDURE Annulation_Resrvation; -- afficher le nbr de locataire, remettre  ajour les dispo d'activite et la veillee, recuperer le KDO mettre à jour, si dernier locataire signifie qu"un igloo est libere
