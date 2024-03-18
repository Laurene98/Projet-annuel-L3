WITH Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Outils, Gestion_Activites, Gestion_Locataire, Gestion_Kdo, Gestion_Igloo, Gestion_Elfes;
USE Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Outils, Gestion_Activites, Gestion_Locataire, Gestion_Kdo, Gestion_Igloo, Gestion_Elfes;

--WITH Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Outils, Gestion_Activites;
--USE Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Outils, Gestion_Activites;

--WITH Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Gestion_KDO, Outils, Gestion_locataire, Gestion_Activites,Gestion_elfes;
--USE Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Gestion_KDO, Outils, Gestion_locataire, Gestion_Activites, Gestion_elfes;

PROCEDURE Noellaur IS
   Nbr_Stock: T_Gestion_KDO;
   Bilan_KDO: T_Gestion_KDO:= (0,0,0,0);
   KDO_Tirage: T_KDO;
   Mot: T_Mot;
   Activite_Jour : T_Activite_Locataire;
   Nbr_Place: T_Gestion_Activite;
   Choix_Act : T_Activite;
   Choix : T_Activite_Locataire;
--   Inscrit: T_Gestion_Activite;
--   Tot_Ins : T_Stats_Activite;
   Infoloc: T_Info_Locataire;
   Loc : T_Locataire;
   Sem, Jours : T_Semaine;
   Liste_E: T_Elfes;
   Nbr_Pers_Jour: T_Nbrper_Elfes;
   Igloo: T_Info_Igloo;
   Liste_Igloo:T_Igloo;
   Numigloo,Numloc : Integer;





BEGIN

--Crea_Igloo (Igloo, Liste_Igloo);

   Non_Cree (Igloo,Liste_Igloo);
   Initial_Igloo (Igloo,Liste_Igloo);
--   Affich_Igloo (Igloo, Liste_Igloo);
--
--   Liste_Loca (Igloo,Liste_Igloo);
--   ListeIgloo (Igloo,Liste_Igloo);
--   Crea_Igloo (Igloo, Liste_Igloo);
   Veille (Igloo, Liste_Igloo);

   --   Affich_Igloo (Igloo, Liste_Igloo);
 Initial_Act (Nbr_Place);
--   Reservation_Igloo (Igloo,Liste_Igloo, Numigloo);
         Recherche (Infoloc, Igloo, Liste_Igloo, Numigloo, Numloc);
   Inscription_Veille (Igloo, Liste_Igloo, Numigloo, Numloc);
   Veille (Igloo, Liste_Igloo);
--   Verifloc_Ins (Infoloc,Igloo,Liste_Igloo,Numigloo, Numloc,Choix_Act,Nbr_Place,Choix,Sem,Jours);
--      Affich_Igloo (Igloo, Liste_Igloo);

--Recherche (Infoloc, Igloo, Liste_Igloo, numigloo,numloc);

--   Saisie_Act (Choix_Act, Nbr_Place, Choix, Sem, Jours);
--   New_Line;
--   Saisie_Loc (Infoloc);
--   New_Line;
--   Affich_Tab (Nbr_Place);
--   New_Line;
--Affichage_Locataire (Infoloc, Activite_Jour, Choix_Act, Nbr_Place, Choix, Sem);

END Noellaur;



--   Elfes (Liste_E, Nbr_Pers_Jour);
--   New_Line;
--   New_Line;
--   New_Line;
--   Visualisation_Elfes (Liste_E, Nbr_Pers_Jour);
--
--   END Noellaur;
















--   Save_Loc (Choix_Act, Nbr_Place,Choix);

--END Noellaur;



--   Saisie_Loc (Infoloc);

--   Initial_Act (Nbr_Place);
--   Saisie_Act (Choix_Act, Nbr_Place, Choix, Sem, Jours);
--   New_Line;
--   Affich_Tab (Nbr_Place);
--   New_Line;

--END Noellaur;



--   Affichage_Dispo (Nbr_Place);
--
--   New_Line; New_Line;
--   Affich_Tab (Nbr_Place);
--
--  END Noellaur;




----   Saisie_Act (Choix_Act,Nbr_Place);
--   Save_Loc (Choix_Act, Choix, Nbr_Place);
--END Noellaur;




--   Gestion_Mots (Mot);
--   Put ("Le nom est ");
--   Put (Mot);

--END Noellaur;




















   ----------------------- Test KDO FINI ---------------------


--   Init_Stock(Nbr_Stock);
--   New_Line;
--   Affichage_Stock(Nbr_Stock);
--   New_Line;
----   Reassort (Nbr_Stock);
----   New_Line;
----   Affichage_Stock(Nbr_Stock);
----   New_Line;
--   Distribution_KDO (KDO_Tirage, Nbr_Stock, bilan_kdo);
--   New_Line;
--   Affic_Stat_KDO(Bilan_KDO);


----Affil_KDO (KDO_Tirage, Nbr_Stock, Infoloc);
--END Noellaur;






