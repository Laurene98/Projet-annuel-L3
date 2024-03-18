WITH Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Outils,gestion_activites;
USE Ada.Text_IO,Ada.Integer_Text_IO,Ada.Float_Text_IO, Outils,gestion_activites;


PACKAGE Gestion_Elfes IS

   TYPE T_Nbrper_Elfes IS ARRAY (T_Semaine) OF Integer;

NBE : constant integer := 8;
Type T_info_elfes is record
Nom_elfes : T_Mot;
Activite : T_activite ;
Nbr_pers_jour : T_Nbrper_Elfes ;
END RECORD ;

TYPE T_Elfes IS ARRAY (Integer RANGE 1..NBE) OF T_Info_Elfes;


PROCEDURE Elfes (Liste_E:out T_elfes; Nbr_Pers_Jour: IN OUT T_Nbrper_Elfes);
PROCEDURE Liste_Elfes ( Liste_E:IN OUT  T_Elfes);
PROCEDURE Visualisation_Elfes (Liste_E:IN  T_Elfes; Nbr_Pers_Jour: IN OUT T_Nbrper_Elfes);

end gestion_elfes;
----
