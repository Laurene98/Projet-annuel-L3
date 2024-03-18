--WITH Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Outils, Gestion_Activites, Initialisation, Gestion_Locataire, Gestion_Kdo, Gestion_Igloo, Gestion Elfes;
--USE Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Outils, Gestion_Activites, Initialisation, Gestion_Locataire, Gestion_Kdo, Gestion_Igloo, Gestion Elfes;

--WITH Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Outils, Gestion_Activites;
--USE Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Outils, Gestion_Activites;

WITH Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Aleatoire, Gestion_KDO,Gestion_activites,Outils,Gestion_Fichier,Gestion_elfes,Gestion_Igloo,Gestion_Locataire;
USE Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Aleatoire, Gestion_KDO,Gestion_activites,outils,Gestion_elfes,Gestion_Fichier,Gestion_Igloo,Gestion_Locataire;

PROCEDURE Noeljade IS
--   KDO: T_KDO;
--   Nbr_Stock: T_Gestion_KDO;
--   Bilan_KDO: T_Gestion_KDO;
--   KDO_tirage: T_KDO;

   Nbr_Place: T_Gestion_Activite;

--   Mon_Elfes:T_Elfes;
--   Nbr_Pers_jour:T_Nbrper_Elfes;
----
--   Liste_E:T_Elfes;
   Igloo:T_info_igloo;
   Infoloc:T_Info_Locataire;
   Liste_igloo:T_Igloo;
   Activite_Jour: T_Activite_Locataire;
   Choix_Act:T_Activite;
   Choix:T_Activite_Locataire;
   Sem :T_Semaine;

BEGIN









--Reservation_Igloo(Igloo);
--affich_tab (Nbr_Place);
--   Elfes(Mon_Elfes,Nbr_Pers_Jour);
--   New_Line;

--    Liste_Elfes (Liste_E);
--   New_Line;
--   Elfes (Liste_E,Nbr_Pers_Jour);
--   new_line;
--   Visualisation_Elfes (Liste_E);
--   New_Line;
   Initial_Igloo (Igloo,Liste_Igloo);
--   Enregistrer_Reg_Igloo(Liste_Igloo);
   Restaurer_Reg_Igloo(Liste_Igloo);






--    -- Legolas
--   T_Elfes(1).Activite := Rennes;
--   T_Elfes(1).Nbr_Pers_Jour := (0,0,0,0,8);
--
--   -- Elronde
--   T_Elfes(2).Activite := Igloos;
--   T_Elfes(2).Nbr_Pers_Jour := (3,1,0,2,1);
--
--   --Galadriel
--   T_Elfes(3).Activite := Biscuits;
--   T_Elfes(3).Nbr_Pers_Jour := (3,2,1,5,0);
--
--   --Miriel
--   T_Elfes(4).Activite := Deco;
--   T_Elfes(4).Nbr_Pers_Jour := (0,0,0,0,8);







--   Affichage_Dispo(Nbr_Place);
--   New_Line;


--   Init_Stock(KDO, Nbr_Stock);
--   New_Line;
--

--   New_Line;
--   Affichage_Stock(KDO, Nbr_Stock);
--   New_Line;
--   New_Line;
--   Reassort (Nbr_Stock);
--   New_Line;
--   New_Line;
--   Affichage_Stock(KDO, Nbr_Stock);
--   New_Line;
--   New_Line;
--   Distribution_KDO (KDO, KDO_Tirage, Nbr_Stock);
--   New_Line;
--   New_Line;
--   Stat_KDO(Nbr_Stock, Bilan_KDO, KDO);





END Noeljade;







--   Nbr_Place: T_Gestion_Activite;

--BEGIN

--   Disponibilite (Nbr_place);
--   Put ("les disponibilites sont: "); New_Line;

--   Affichage_dispo (Nbr_Place);


--END Noel;






--   Init_Stock (KDO,MonStock);
--   Put (MonStock); New_Line;
--   Affichage_Stock (KDO,MonStock);


--   Gestion_Mots (Mot);
--   Put ("votre nom est "); Put (Mot);
--BEGIN
--   Disponibilite (dispo);


--   Mot: T_Mot;
--   K : Natural;
--   S : String (1..31);
--   MonStock : T_Gestion_KDO;
--   KDO:T_KDO;







