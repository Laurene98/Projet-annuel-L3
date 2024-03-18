WITH Outils, Gestion_Activites, Gestion_KDO;
USE Outils, Gestion_Activites, Gestion_KDO;

PACKAGE Gestion_locataire IS

TYPE T_Activite_Locataire IS ARRAY (T_Semaine) OF T_Activite ;

Type T_info_locataire is record
   Nom_Locataire : T_Mot ;

   Prenom_Locataire : T_Mot ;

   Cadeau : T_KDO ;

   Activite_Jour : T_Activite_Locataire ;

   Veille : Boolean ;

END RECORD ;

TYPE T_Locataire IS ARRAY (Integer RANGE 1..6) OF T_Info_Locataire ;




FUNCTION Verif_Dispo (Nbr_Place: T_Gestion_Activite; Acti: T_Activite; Sem : T_Semaine) RETURN Boolean;
PROCEDURE Saisie_Act (Choix_Act: IN OUT T_Activite; Nbr_Place: IN OUT T_Gestion_Activite; Choix : OUT T_Activite_Locataire; Sem: IN T_Semaine; Jours : IN T_Semaine);
FUNCTION Verif (Choix_Act: T_Activite; Choix : T_Activite_Locataire; Jours : T_Semaine) RETURN Boolean;
PROCEDURE Save_Loc (Choix_Act: IN OUT T_Activite; Nbr_Place: IN OUT T_Gestion_Activite; Choix : IN OUT T_Activite_Locataire; Sem : IN T_Semaine);
PROCEDURE Saisie_Loc (Infoloc: IN OUT T_Info_Locataire);
PROCEDURE Affil_KDO (KDO_Tirage: IN OUT T_KDO; Nbr_Stock : IN OUT T_Gestion_KDO; Infoloc: IN OUT T_Info_Locataire; Bilan_Kdo:IN OUT T_Gestion_KDO);
--PROCEDURE Inscription_Veille (Infoloc: IN OUT T_Info_Locataire);


--PROCEDURE Affichage_Locataire (Infoloc : IN OUT T_Info_Locataire; Activite_Jour : IN OUT T_Activite_Locataire;Choix_Act: IN OUT T_Activite; Nbr_Place: IN OUT T_Gestion_Activite; Choix : IN OUT T_Activite_Locataire; Sem : IN T_Semaine);
--PROCEDURE Affichage_Locataire (Igloo: IN OUT T_Info_Igloo; Liste_Igloo: IN OUT T_Igloo; Infoloc : IN OUT T_Info_Locataire; Activite_Jour : IN OUT T_Activite_Locataire; Choix_Act: IN OUT T_Activite; Nbr_Place: IN OUT T_Gestion_Activite; Choix : IN OUT T_Activite_Locataire; Sem : IN T_Semaine);



-- PROCEDURE Inscription_Activite;

end Gestion_Locataire; 