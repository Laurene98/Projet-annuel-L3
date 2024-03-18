WITH Gestion_Baby_Sitter, Gestion_Famille, Outils;
USE Gestion_Baby_Sitter, Gestion_Famille, Outils;

PACKAGE Initialisation IS

   PROCEDURE Init_Bs(Liste : OUT T_Pteur);
   PROCEDURE Init_Famille(A : OUT T_Arbre);

END Initialisation;
