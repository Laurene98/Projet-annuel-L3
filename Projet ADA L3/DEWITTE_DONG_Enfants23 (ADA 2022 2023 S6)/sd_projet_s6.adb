
SUBTYPE T_Mot IS String(1..40);

TYPE Baby_Sitter IS RECORD
   Nom, Prenom : T_Mot := (OTHERS => ' ');
   Age :  Positive; -- >= 16
   Quitte : Boolean := False;
   Nb_Creneaux : Integer := 0;
   Facture_Veille : Integer;
   P1,P2 : T_Planning ;
END RECORD;

-- définir une valeur sentinelle
TYPE T_Planning IS ARRAY(1..6,1..3) OF T_Mot; -- 2 plannings

TYPE T_Cell;
TYPE T_Pteur IS ACCESS T_Cell;
TYPE T_Cell IS RECORD
   Bs : T_Baby_Sitter;
   Suiv : T_Pteur;
END RECORD;

TYPE T_Age_Enf IS ARRAY(Integer RANGE 1..8) OF Integer RANGE 0..12;

TYPE T_Famille IS RECORD
   Nom : T_Mot;
   Nb_Enfants : Integer RANGE 1..8;
   Age : T_Age_Enf;
END RECORD;

-- ABR trié par nom
TYPE T_Noeud;
TYPE T_Arbre IS ACCESS T_Noeud;
TYPE T_Noeud IS RECORD
   Famille : T_Famille;
   Fg,Fd : T_Arbre;
END RECORD;

TYPE T_Semaine IS(Lundi, Mardi, Mercredi, Jeudi, Vendredi, Samedi, Dimanche);

TYPE T_Facture IS ARRAY(Integer RANGE 1..Taille_Arbre) OF Integer;

PROCEDURE Ajout_Bs(Bs : IN T_Baby_Sitter; Liste : IN OUT T_Liste);
PROCEDURE Demande_Depart_Bs(Bs : IN T_Baby_Sitter; Liste : IN T_Liste);
PROCEDURE Supp_Bs(Bs : IN T_Baby_Sitter; Liste : IN OUT T_Liste);
PROCEDURE Ajout_Fam(Famille : IN T_Famille; Arbre : IN OUT T_Arbre);
PROCEDURE Supp_Fam(Famille : IN T_Famille; Liste : IN T_Liste; Arbre : T_Arbre);
PROCEDURE Demande_Garde(Famille : IN T_Famille; Liste : T_Liste);
PROCEDURE Annule_Garde(Famille : IN T_Famille; Jour : IN T_Semaine; Semaine : IN Integer; Liste : IN T_Liste);
PROCEDURE Supp_Planning(Planning : IN OUT T_Planning);
PROCEDURE Maj_Planning(Liste : IN T_Liste);
FUNCTION Taille_Arbre(Arbre : T_Arbre) RETURN Integer;
PROCEDURE Visu_Facture(Facture : IN T_Facture);
PROCEDURE Visu_Facture_Veille(Liste : IN T_Liste);
PROCEDURE Visu_Planning(Liste : IN T_Liste);
PROCEDURE Visu_Garde(Famille : IN T_Famille; Liste : IN T_Liste);
PROCEDURE Visu_Bs(Liste : IN T_Liste);
PROCEDURE Visu_Fam(Arbre : IN T_Arbre);
PROCEDURE Jour_Suiv(Jour : IN OUT T_Semaine);

