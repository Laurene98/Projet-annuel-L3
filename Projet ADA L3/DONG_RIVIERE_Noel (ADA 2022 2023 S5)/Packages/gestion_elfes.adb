WITH Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Gestion_Locataire, Outils,Gestion_activites;

USE Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Gestion_Locataire, Outils,Gestion_activites;

PACKAGE BODY Gestion_Elfes IS


   ------  Procedure organisation_elfes (nombre de personne par jours) --------------


   PROCEDURE Elfes (Liste_E:out T_elfes; Nbr_Pers_Jour: IN OUT T_Nbrper_Elfes) IS

   Begin

    --  Legolas
   --    Put("Tableau de Legolas: ");
   --   T_Elfes(1).Nbr_Pers_Jour := (0,0,0,0,8); Put(T_Elfes(1).Nbr_Pers_Jour);
    --T_Elfes(1).Activite := Rennes;
   --    Nbr_Pers_Jour (mon_elfes(1)):=(0,0,0,0,8);

       Liste_E(1).Nbr_Pers_Jour := (0,0,0,0,8,0,0);
       Liste_E(2).Nbr_Pers_Jour := (3,1,0,2,1,0,0);
       Liste_E(3).Nbr_Pers_Jour := (3,2,1,5,0,0,0);
       Liste_E(4).Nbr_Pers_Jour := (0,0,7,0,0,0,0);
       Liste_E(5).Nbr_Pers_Jour := (0,2,0,3,0,0,0);
       Liste_E(6).Nbr_Pers_Jour := (0,8,1,0,0,0,0);
       Liste_E(7).Nbr_Pers_Jour := (8,0,3,0,0,0,0);
       Liste_E(8).Nbr_Pers_Jour := (0,0,0,2,3,0,0);

   END Elfes;

   --------------------- Initialisation des infos de elfes -----------------------

   PROCEDURE Liste_Elfes (Liste_E:IN OUT T_Elfes) is

   BEGIN
      Liste_E(1).Nom_Elfes:="Legolas                       ";
      Liste_E(1).Activite:=Rennes;

       Liste_E(2).Nom_Elfes:="Elronde                       ";
       Liste_E(2).activite:=Igloos;

       Liste_E(3).Nom_Elfes:="Galadriel                     ";
       Liste_E(3).activite:=biscuits;

       Liste_E(4).Nom_Elfes:="Miriel                        ";
       Liste_E(4).activite:=Deco;

       Liste_E(5).Nom_Elfes:="Isildur                       ";
       Liste_E(5).Activite:=Raquette;

       Liste_E(6).Nom_Elfes:="Lorien                        ";
       Liste_E(6).activite:=Patinoire;

       Liste_E(7).Nom_Elfes:="Gilreth                       ";
       Liste_E(7).activite:=Traineau;

       Liste_E(8).Nom_Elfes:="Legolas                       ";
       Liste_E(8).activite:=Ateliers;

   END Liste_Elfes;

   ------------------- Visualisation des infos elfes -------------------------

   PROCEDURE Visualisation_Elfes (Liste_E:IN T_Elfes; Nbr_Pers_Jour: IN OUT T_Nbrper_Elfes) IS

   BEGIN
--      Liste_Elfes (Liste_E);
--      Elfes (Liste_E, Nbr_Pers_Jour);

      FOR I IN Liste_E'RANGE LOOP
         Put ("L'elfe ");
         Put(Liste_E(I).Nom_Elfes);
         Put (" s'occupe de l'activite ");
         Put(T_Activite'Image(Liste_E(I).Activite));
         Put ("."); New_Line;

         FOR k IN T_Semaine'RANGE LOOP
            Put ("Pour ");
            Put (T_Semaine'Image(K)); Put(" ont a ");
            Put(Liste_E(I).Nbr_Pers_Jour(K));
            Put(" personnes."); New_Line;
            EXIT WHEN K=Vendredi;
            EXIT WHEN K=Samedi;
            EXIT WHEN K=Dimanche;


         END LOOP; New_Line;

      END LOOP;




END Visualisation_Elfes;



END Gestion_Elfes;

    