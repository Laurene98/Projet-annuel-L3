WITH Ada.Text_IO, Ada.Integer_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PACKAGE BODY Gestion_Garde IS
   -- Chaine_Vide : CONSTANT T_Mot := (OTHERS => ' ');

---------------------------- Supprimer une famille -------------------------------------

   PROCEDURE Supp_Fam(Liste : IN T_Pteur; A : IN OUT T_Arbre; Jour : T_Semaine; Pointeur_Fam : OUT T_Arbre) IS
      Nom : T_Mot := (OTHERS => ' ');

      FUNCTION Cherche(A : T_Arbre; Nom : T_Mot) RETURN T_Arbre IS
         Resg : T_Arbre;
      BEGIN
         IF A = NULL THEN
            RETURN(NULL);
         ELSIF A.Famille.Nom = Nom THEN
            RETURN(A);
         ELSE
            Resg := Cherche(A.Fg,Nom);
            IF Resg /= NULL THEN
               RETURN(Resg);
            ELSE
               RETURN(Cherche(A.Fd,Nom));
            END IF;
         END IF;
      END Cherche;

      FUNCTION Max_Fg(A : T_Arbre) RETURN T_Arbre IS
      BEGIN
         IF A.Fd /= NULL THEN
            RETURN(Max_Fg(A.Fd));
         ELSE
            RETURN(A);
         END IF;
      END Max_Fg;

      PROCEDURE Suppression(A : IN OUT T_Arbre; Nom : T_Mot) IS
         Max : T_Arbre := NULL;
      BEGIN
         IF A /= NULL THEN
            IF Nom < A.Famille.Nom THEN
               Suppression(A.Fg,Nom);
            ELSIF Nom > A.Famille.Nom THEN
               Suppression(A.Fd,Nom);
            ELSE
               -- A n'a pas de fils
               IF A.Fg = NULL AND THEN A.Fd = NULL THEN
                  A := NULL;
               -- A a un fils unique a droite
               ELSIF A.Fg = NULL THEN
                  A := A.Fd;
               -- A a un fils unique a gauche
               ELSIF A.Fd = NULL THEN
                  A := A.Fg;
               -- A a deux fils
               ELSE
                  -- le noeud supprim� est remplac� par le max de son sous-arbre gauche
                  Max := Max_Fg(A.Fg);
                  A.Famille := Max.Famille;
                  Suppression(A.Fg,Max.Famille.Nom);
               END IF;
            END IF;
         END IF;
      END Suppression;

      PROCEDURE Supp_Garde(Liste : T_Pteur; Nom : T_Mot; Jour : T_Semaine) IS
      BEGIN
         IF Liste /= NULL THEN
            -- suppression des r�servations pour la semaine en cours
            FOR I IN Jour..T_Jour_Ouvre'Last LOOP
               FOR J IN T_Creneau'First..T_Creneau'Last LOOP
                  IF Liste.Bs.P1(I,J) = Nom THEN
                     Liste.Bs.P1(I,J) := (OTHERS => ' ');
                  END IF;
               END LOOP;
            END LOOP;
            -- suppression des r�servations pour la semaine suivante
            FOR I IN T_Jour_Ouvre'First..T_Jour_Ouvre'Last LOOP
               FOR J IN T_Creneau'First..T_Creneau'Last LOOP
                  IF Liste.Bs.P2(I,J) = Nom THEN
                     Liste.Bs.P2(I,J) := (OTHERS => ' ');
                     Liste.Bs.Nb_Creneaux := Liste.Bs.Nb_Creneaux - 1;
                  END IF;
               END LOOP;
            END LOOP;
            Supp_Garde(Liste.Suiv,Nom,Jour);
         END IF;
      END Supp_Garde;

   BEGIN
      Put("Saisir le nom de famille : ");
      Ctrl_String(Nom);
      IF Cherche(A,Nom) = NULL THEN
         Put_Line("Le nom de famille saisi ne correspond a aucune famille enregistree");
      ELSE
         Pointeur_Fam := Cherche(A,Nom);
         Supp_Garde(Liste,Nom,Jour);
         Suppression(A,Nom);
      END IF;
   END Supp_Fam;


---------------------------- Faire une demande de garde -------------------------------------

   PROCEDURE Demande_Garde(Liste : T_Pteur; A : T_Arbre) IS
      Nom_Fam, Nom_Bs, Prenom1, Prenom2 : T_Mot := (OTHERS => ' ');
      Pos, Choix_Creneau, Choix_Bs : Integer;
      Jour : T_Jour_Ouvre;
      Creneau_Deb, Creneau_Fin : T_Creneau;
      -- pointeur vers la famille qui demande la garde
      Pointeur_F : T_Arbre := NULL;
      -- pointeur vers la bs qui va garder les enfants
      Pointeur_B : T_Pteur := NULL;

      FUNCTION Bs_Existe(Liste : T_Pteur; Nom_Bs,Prenom1,Prenom2 : T_Mot) RETURN T_Pteur IS
      BEGIN
         IF Liste = NULL THEN
            RETURN(NULL);
         ELSIF Liste.Bs.Nom = Nom_Bs AND THEN Liste.Bs.Prenom1 = Prenom1 AND THEN Liste.Bs.Prenom2 = Prenom2 THEN
            RETURN(Liste);
         ELSE
            RETURN(Bs_Existe(Liste.Suiv,Nom_Bs,Prenom1,Prenom2));
         END IF;
      END Bs_Existe;

      FUNCTION Fam_Existe(A : T_Arbre; Nom_Fam : T_Mot) RETURN T_Arbre IS
         Resg : T_Arbre := NULL;
      BEGIN
         IF A = NULL THEN
            RETURN(NULL);
         ELSIF A.Famille.Nom = Nom_Fam THEN
            RETURN(A);
         ELSE
            Resg := Fam_Existe(A.Fg,Nom_Fam);
            IF Resg /= NULL THEN
               RETURN(Resg);
            ELSE
               RETURN(Fam_Existe(A.Fd,Nom_Fam));
            END IF;
         END IF;
      END Fam_Existe;

      -- Test� et approuv�
      FUNCTION Bs_Dispo(Liste : T_Pteur; Jour : T_Jour_Ouvre; Creneau_Deb,Creneau_Fin : T_Creneau; Nom_Bs,Prenom1,Prenom2 : T_Mot) RETURN Boolean IS
      BEGIN
         IF Liste /= NULL THEN
            IF Liste.Bs.Nom = Nom_Bs AND THEN Liste.Bs.Prenom1 = Prenom1 AND THEN Liste.Bs.Prenom2 = Prenom2 THEN
               FOR I IN Jour..Jour LOOP
                  FOR J IN Creneau_Deb..Creneau_Fin LOOP
                     IF Liste.Bs.P2(I,J) /= Chaine_Vide THEN
                        RETURN(False);
                     END IF;
                  END LOOP;
               END LOOP;
               RETURN(True);
            ELSE
               RETURN(Bs_Dispo(Liste.Suiv,Jour,Creneau_Deb,Creneau_Fin,Nom_Bs,Prenom1,Prenom2));
            END IF;
         ELSE
            RETURN(True);
         END IF;
      END Bs_Dispo;

--      PROCEDURE Recup_Last_Bs(A : T_Arbre; Nom_Fam : T_Mot; Nom_Bs,Prenom1,Prenom2 : IN OUT T_Mot) IS
--         Pointeur_Fam : T_Arbre := NULL;
--      BEGIN
--         Pointeur_Fam := Fam_Existe(A,Nom_Fam);
--         IF A /= NULL THEN
--            IF A = Pointeur_Fam THEN
--               IF A.Famille.Last_Bs = NULL THEN
--                  Put_Line("Impossible, vous n'avez jamais fais de reservation");
--               ELSE
--                  Nom_Bs := A.Famille.Last_Bs.Bs.Nom;
--                  Prenom1 := A.Famille.Last_Bs.Bs.Prenom1;
--                  Prenom2 := A.Famille.Last_Bs.Bs.Prenom2;
--                  -- return(a.last_bs);
--               END IF;
--            ELSE
--               Recup_Last_Bs(A.Fg,Nom_Fam,Nom_Bs,Prenom1,Prenom2);
--               Recup_Last_Bs(A.Fd,Nom_Fam,Nom_Bs,Prenom1,Prenom2);
--            END IF;
--         END IF;
--      END Recup_Last_Bs;

      PROCEDURE Recup_Last_Bs(A,Pointeur_F : T_Arbre; Pointeur_B : IN OUT T_Pteur) IS
      BEGIN
         IF A /= NULL THEN
            IF A = Pointeur_F THEN
               IF A.Famille.Last_Bs = NULL THEN
                  Put_Line("Impossible, vous n'avez jamais fait de reservation.");
               ELSE
                  Pointeur_B := A.Famille.Last_Bs;
               END IF;
            ELSE
               Recup_Last_Bs(A.Fg,Pointeur_F,Pointeur_B);
               Recup_Last_Bs(A.Fg,Pointeur_F,Pointeur_B);
            END IF;
         END IF;
      END Recup_Last_Bs;

      -- A TESTER
      PROCEDURE Maj_Last_Bs(A,Pointeur_F : T_Arbre; Liste,Pointeur_B : T_Pteur) IS
      BEGIN
         IF A /= NULL THEN
            IF A = Pointeur_F THEN
               A.Famille.Last_Bs := Pointeur_B;
            ELSE
               Maj_Last_Bs(A.Fg,Pointeur_F,Liste,Pointeur_B);
               Maj_Last_Bs(A.Fd,Pointeur_F,Liste,Pointeur_B);
            END IF;
         END IF;
      END Maj_Last_Bs;

      -- mettre un pointeur sur le dernier babysitter (?)
--      FUNCTION Last_Bs (Pnt_F : T_Arbre; Pnt_B : T_Pteur) RETURN T_Pteur IS
--      BEGIN
--         FOR I IN REVERSE T_Jour_Ouvre'RANGE LOOP
--            FOR J IN REVERSE T_Creneau'RANGE LOOP
--               IF Pnt_B.Bs.P1(I,J) = Pnt_F.Famille.Nom THEN -- probleme de la condition
--                  RETURN (Pnt_B);
--               ELSE
--                  RETURN (Last_Bs(Pnt_F,Pnt_B.Suiv));
--               END IF;
--            END LOOP;
--         END LOOP;
--         RETURN (NULL);


      -- Test� et approuv�
      FUNCTION Fam_A_Reserve(Liste : T_Pteur; Nom_Fam : T_Mot; Jour : T_Jour_Ouvre; Creneau_Deb,Creneau_Fin : T_Creneau) RETURN Boolean IS
      BEGIN
         IF Liste /= NULL THEN
            FOR I IN Jour..Jour LOOP
               FOR J IN Creneau_Deb..Creneau_Fin LOOP
                  IF Liste.Bs.P2(I,J) = Nom_Fam THEN
                     RETURN(True);
                  END IF;
               END LOOP;
            END LOOP;
            RETURN(Fam_A_Reserve(Liste.Suiv,Nom_Fam,Jour,Creneau_Deb,Creneau_Fin));
         ELSE
            RETURN(False);
         END IF;
      END Fam_A_Reserve;

      -- Test� et approuv�
      FUNCTION Bs_Mineure(Liste : T_Pteur; Nom_Bs,Prenom1,Prenom2 : T_Mot) RETURN Boolean IS
      BEGIN
         IF Liste /= NULL THEN
            IF Liste.Bs.Nom = Nom_Bs AND THEN Liste.Bs.Prenom1 = Prenom1 AND THEN Liste.Bs.Prenom2 = Prenom2 THEN
               IF Liste.Bs.Age < 18 THEN
                  RETURN(True);
               ELSE
                  RETURN(False);
               END IF;
            ELSE
               Return(Bs_Mineure(Liste.Suiv,Nom_Bs,Prenom1,Prenom2));
            END IF;
         ELSE
            RETURN(False);
         END IF;
      END Bs_Mineure;

      -- Test� et approuv�
      FUNCTION Enfants_3_Moins(A : T_Arbre; Nom_Fam : T_Mot) RETURN Boolean IS
      BEGIN
         IF A /= NULL THEN
            IF A.Famille.Nom = Nom_Fam THEN
               FOR I IN T_Age_Enf'RANGE LOOP
                  IF A.Famille.Age_Enfants(I) IN 0..3 THEN
                     RETURN(True);
                  END IF;
               END LOOP;
               RETURN(False);
            ELSE
               RETURN(Enfants_3_Moins(A.Fg,Nom_Fam) OR Enfants_3_Moins(A.Fd,Nom_Fam));
            END IF;
         ELSE
            RETURN(False);
         END IF;
      END Enfants_3_Moins;

      -- A TESTER
      PROCEDURE Ajout_Planning(Liste, Pointeur_B : T_Pteur; Nom_Fam : T_Mot; Jour : T_Jour_Ouvre; Creneau_Deb,Creneau_Fin : T_Creneau) IS
      BEGIN
         IF Liste /= NULL THEN
            IF Liste = Pointeur_B THEN
               FOR I IN Jour..Jour LOOP
                  FOR J IN Creneau_Deb..Creneau_Fin LOOP
                     Liste.Bs.P2(I,J) := Nom_Fam;
                     Liste.Bs.Nb_Creneaux := Liste.Bs.Nb_Creneaux + 1;
                  END LOOP;
               END LOOP;
            ELSE
               Ajout_Planning(Liste.Suiv,Pointeur_B,Nom_Fam,Jour,Creneau_Deb,Creneau_Fin);
            END IF;
         END IF;
      END Ajout_Planning;

   BEGIN
      -- Saisie de la famille
      Put("Saisir le nom de famille : ");
      LOOP
         Ctrl_String(Nom_Fam); New_Line;
         Pointeur_F := Fam_Existe(A,Nom_Fam);
         EXIT WHEN Pointeur_F /= NULL;
         Put_Line("Le nom de famille saisi n'existe pas, recommencez.");
      END LOOP;

      -- Saisie du jour
      Put_Line("Quel jour souhaitez-vous faire la reservation : ");
      Put_Line("0 - Lundi");
      Put_Line("1 - Mardi");
      Put_Line("2 - Mercredi");
      Put_Line("3 - Jeudi");
      Put_Line("4 - Vendredi");
      Put_Line("5 - Samedi");
      LOOP
         Ctrl_Entier(Pos);
         EXIT WHEN Pos in 0..5;
         Put_Line("Votre choix ne fait pas partie des options, recommencez.");
      END LOOP;
      Jour := T_Jour_Ouvre'Val(Pos);

      -- Saisie du / des cr�neaux
      Put_Line("Sur quels creneaux souhaitez-vous faire la reservation : ");
      Put_Line("0 - Matin");
      Put_Line("1 - Apres-Midi");
      Put_Line("2 - Soir");
      Put_Line("3 - Matin et Apres-Midi");
      Put_Line("4 - Apres-Midi et Soir");
      Put_Line("5 - Toute la journee");
      LOOP
         Ctrl_Entier(Choix_Creneau);
         CASE Choix_Creneau IS
            WHEN 0 => Creneau_Deb := Matin; Creneau_Fin := Matin; EXIT;
            WHEN 1 => Creneau_Deb := Aprem; Creneau_Fin := Aprem; EXIT;
            WHEN 2 => Creneau_Deb := Soir; Creneau_Fin := Soir; EXIT;
            WHEN 3 => Creneau_Deb := Matin; Creneau_Fin := Aprem; EXIT;
            WHEN 4 => Creneau_Deb := Aprem; Creneau_Fin := Soir; EXIT;
            WHEN 5 => Creneau_Deb := Matin; Creneau_Fin := Soir; EXIT;
            WHEN OTHERS => Put_Line("Votre choix ne fait pas partie des options, recommencez.");
         END CASE;
      END LOOP;

      IF Fam_A_Reserve(Liste,Nom_Fam,Jour,Creneau_Deb,Creneau_Fin) THEN
         Put_Line("Vous avez deja reserve un(e) baby-sitter pour ce creneau.");
      ELSE
         --Saisie du / de la baby-sitter
         Put_Line("Choix du / de la baby-sitter : ");
         Put_Line("0 - Vous souhaitez avoir la meme baby-sitter que la fois precedente.");
         Put_Line("1 - Vous souhaitez saisir le nom du / de la baby-sitter.");
         Put_Line("2 - Vous n'avez pas de preference.");
         LOOP
            Ctrl_Entier(Choix_Bs);
            CASE Choix_Bs IS
               WHEN 0 =>
                  Recup_Last_Bs(A,Pointeur_F,Pointeur_B);
                  EXIT;
               WHEN 1 =>
                  LOOP
                     Put("Saisir le nom du / de la baby-sitter : ");
                     Ctrl_String(Nom_Bs); New_Line;
                     Put("Saisir le prenom du / de la baby-sitter : ");
                     Ctrl_String(Prenom1); New_Line;
                     Put("Saisir le 2eme prenom de la baby-sitter (entree s'il n'y en a pas) : ");
                     Ctrl_String(Prenom2);
  -----> arret lecture
                     Pointeur_B := Bs_Existe(Liste,Nom_Bs,Prenom1,Prenom2);
                     EXIT WHEN Pointeur_B /= NULL;
                     Put_Line("Le / la baby-sitter saisi(e) n'existe pas, recommencez.");
                  END LOOP;
                  EXIT;
               WHEN 2 =>
                  Tri_Creneaux(Liste);
                  Nom_Bs := Liste.Bs.Nom;
                  Prenom1 := Liste.Bs.Prenom1;
                  Prenom2 := Liste.Bs.Prenom2;
                  Put("La garde a ete attribuee a ");
                  Put(Prenom1); Put(Nom_Bs); New_Line;
                  Pointeur_B := Bs_Existe(Liste,Nom_Bs,Prenom1,Prenom2);
                  EXIT;
               WHEN OTHERS => Put_Line("Votre choix ne fait pas partie des options, recommencez");
            END CASE;
         END LOOP;
      END IF;

      IF Bs_Dispo(Liste,Jour,Creneau_Deb,Creneau_Fin,Nom_Bs,Prenom1,Prenom2) THEN
         IF Pointeur_B.Bs.Quitte THEN
            Put_Line("Le / la baby-sitter selectionne(e) a demande a quitter l'association");
            Tri_Creneaux2(Liste);
            Nom_Bs := Liste.Bs.Nom;
            Prenom1 := Liste.Bs.Prenom1;
            Prenom2 := Liste.Bs.Prenom2;
-- Attribuer la garde par ordre alphab�tique au Bs avec le moins de creneau
            -- attribution de la garde
            Pointeur_B := Bs_Existe(Liste,Nom_Bs,Prenom1,Prenom2);
            Ajout_Planning(Liste,Pointeur_B,Nom_Fam,Jour,Creneau_Deb,Creneau_Fin);
            Maj_Last_Bs(A,Pointeur_F,Liste,Pointeur_B);
            Put("La garde a ete attribuee a ");
            Put(Prenom1); Put(Nom_Bs); New_Line;
         ELSE
            IF Bs_Mineure(Liste,Nom_Bs,Prenom1,Prenom2) AND THEN Enfants_3_Moins(A,Nom_Fam) THEN
               Put_Line("Le / la baby-sitter selectionne(e) ne peut pas garder des enfants de 3 ans ou moins");
               Tri_Creneaux(Liste);
               Nom_Bs := Liste.Bs.Nom;
               Prenom1 := Liste.Bs.Prenom1;
               Prenom2 := Liste.Bs.Prenom2;
               -- attribution de la garde
               Pointeur_B := Bs_Existe(Liste,Nom_Bs,Prenom1,Prenom2);
               Ajout_Planning(Liste,Pointeur_B,Nom_Fam,Jour,Creneau_Deb,Creneau_Fin);
               Maj_Last_Bs(A,Pointeur_F,Liste,Pointeur_B);
               Put("La garde a ete attribuee a ");
               Put(Prenom1); Put(Nom_Bs); New_Line;
            ELSE
               Ajout_Planning(Liste,Pointeur_B,Nom_Fam,Jour,Creneau_Deb,Creneau_Fin);
               Maj_Last_Bs(A,Pointeur_F,Liste,Pointeur_B);
            END IF;
         END IF;
      ELSE
         Put_Line("Le / la baby-sitter choisi(e) n'est pas disponible pour ce creneau.");
      END  IF;
   END Demande_Garde;

---------------------------- Annuler une demande de garde -------------------------------------

   PROCEDURE Annule_Garde(Liste : T_Pteur; A : T_Arbre; Jour : T_Semaine) IS
      Semaine : Integer := 0;
      Nom_Fam : T_Mot := (OTHERS => ' ');
      Jour_Garde : T_Jour_Ouvre;
      Creneau_Deb,Creneau_Fin : T_Creneau;
      Pos, Choix_Creneau : Integer;
      Pointeur_F :  T_Arbre;

--      FUNCTION Fam_Existe(A : T_Arbre; Nom_Fam : T_Mot) RETURN Boolean IS
--      BEGIN
--         IF A = NULL THEN
--            RETURN(False);
--         ELSIF A.Famille.Nom = Nom_Fam THEN
--            RETURN(True);
--         ELSE
--            RETURN(Fam_Existe(A.Fd,Nom_Fam));
--         END IF;
--      END Fam_Existe;

      FUNCTION Fam_Existe(A : T_Arbre; Nom_Fam : T_Mot) RETURN T_Arbre IS
         Resg : T_Arbre := NULL;
      BEGIN
         IF A = NULL THEN
            RETURN(NULL);
         ELSIF A.Famille.Nom = Nom_Fam THEN
            RETURN(A);
         ELSE
            Resg := Fam_Existe(A.Fg,Nom_Fam);
            IF Resg /= NULL THEN
               RETURN(Resg);
            ELSE
               RETURN(Fam_Existe(A.Fd,Nom_Fam));
            END IF;
         END IF;
      END Fam_Existe;

      PROCEDURE Annule_Planning(Liste : T_Pteur; Nom_Fam : T_Mot; Semaine : Integer; Jour_Garde : T_Jour_Ouvre; Creneau_Deb,Creneau_Fin : T_Creneau) IS
      BEGIN
         IF Liste /= NULL THEN
            IF Semaine = 1 THEN
               FOR I IN Jour_Garde..Jour_Garde LOOP
                  FOR J IN Creneau_Deb..Creneau_Fin LOOP
                     IF Liste.Bs.P1(I,J) = Nom_Fam THEN
                        Liste.Bs.P1(I,J) := Chaine_Vide;
                        Liste.Bs.Nb_Creneaux := Liste.Bs.Nb_Creneaux - 1;
                     END IF;
                  END LOOP;
               END LOOP;
            ELSE
               FOR I IN Jour_Garde..Jour_Garde LOOP
                  FOR J IN Creneau_Deb..Creneau_Fin LOOP
                     IF Liste.Bs.P2(I,J) = Nom_Fam THEN
                        Liste.Bs.P2(I,J) := Chaine_Vide;
                        Liste.Bs.Nb_Creneaux := Liste.Bs.Nb_Creneaux - 1;
                     END IF;
                  END LOOP;
               END LOOP;
            END IF;
            Annule_Planning(Liste.Suiv,Nom_Fam,Semaine,Jour_Garde,Creneau_Deb,Creneau_Fin);
         END IF;
      END Annule_Planning;

   BEGIN
      Put("Saisir le nom de la famille qui souhaite se desinscrire : ");
--      LOOP
--         Ctrl_String(Nom_Fam); New_Line;
--         EXIT WHEN Fam_Existe(A,Nom_Fam);
--         Put_Line("La famille saisie n'existe pas, recommencez");
--      END LOOP;

      LOOP
         Ctrl_String(Nom_Fam); New_Line;
         Pointeur_F := Fam_Existe(A,Nom_Fam);
         EXIT WHEN Pointeur_F /= NULL;
         Put_Line("Le nom de famille saisi n'existe pas, recommencez.");
      END LOOP;

      Put_Line("Souhaitez-vous annulez une garde : ");
      Put_Line("1 - Pour la semaine en cours");
      Put_Line("2 - Pour la semaine prochaine");
      LOOP
         Ctrl_Entier(Semaine);
         EXIT WHEN Semaine IN 1..2;
         Put_Line("Le chiffre saisi est incorrect, recommencez");
      END LOOP;
      Put_Line("Quel jour souhaitez-vous annuler la garde : ");
      Put_Line("0 - Lundi");
      Put_Line("1 - Mardi");
      Put_Line("2 - Mercredi");
      Put_Line("3 - Jeudi");
      Put_Line("4 - Vendredi");
      Put_Line("5 - Samedi");

      LOOP
         Ctrl_Entier(Pos);
         EXIT WHEN Pos IN 0..5;
         Put_Line("Votre choix ne fait pas partie des options, recommencez.");
      END LOOP;
      Jour_Garde := T_Jour_Ouvre'Val(Pos);
      IF Semaine = 1 AND THEN Jour_Garde <= Jour THEN
         Put_Line("Vous ne pouvez annuler des gardes que pour les jours futurs.");
      ELSE
         -- Saisie du / des cr�neaux
         Put_Line("Sur quels creneaux souhaitez-vous annuler : ");
         Put_Line("0 - Matin");
         Put_Line("1 - Apres-Midi");
         Put_Line("2 - Soir");
         Put_Line("3 - Matin et Apres-Midi");
         Put_Line("4 - Apres-Midi et Soir");
         Put_Line("5 - Toute la journee");
         LOOP
            Ctrl_Entier(Choix_Creneau);
            CASE Choix_Creneau IS
               WHEN 0 => Creneau_Deb := Matin; Creneau_Fin := Matin; EXIT;
               WHEN 1 => Creneau_Deb := Aprem; Creneau_Fin := Aprem; EXIT;
               WHEN 2 => Creneau_Deb := Soir; Creneau_Fin := Soir; EXIT;
               WHEN 3 => Creneau_Deb := Matin; Creneau_Fin := Aprem; EXIT;
               WHEN 4 => Creneau_Deb := Aprem; Creneau_Fin := Soir; EXIT;
               WHEN 5 => Creneau_Deb := Matin; Creneau_Fin := Soir; EXIT;
               WHEN OTHERS => Put_Line("Votre choix ne fait pas partie des options, recommencez");
            END CASE;
         END LOOP;
         Annule_Planning(Liste,Nom_Fam,Semaine,Jour_Garde,Creneau_Deb,Creneau_Fin);
      END IF;
   END Annule_Garde;


END Gestion_Garde;
