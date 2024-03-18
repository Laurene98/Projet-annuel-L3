WITH Ada.Text_IO,ADA.Integer_Text_IO,ADA.Sequential_IO,Gestion_Igloo;
USE Ada.Text_IO,ADA.Integer_Text_IO,Gestion_Igloo;

PACKAGE BODY Gestion_Fichier IS
   PROCEDURE Enregistrer_Reg_Igloo(Reg_Igloo : OUT T_Igloo)IS
      USE P_T_Registre_Igloo;
      Reg_I:P_T_Registre_Igloo.File_Type;
   BEGIN
      BEGIN
         Open(Reg_I,Append_File,"Registre_Igloo");
      EXCEPTION
         WHEN OTHERS=> Create(Reg_I,Name=>"Registre_Igloo");
      END;
      Write(Reg_I,Reg_Igloo);
      Close(Reg_I);
   END Enregistrer_Reg_Igloo;

   PROCEDURE Restaurer_Reg_Igloo(Reg_Igloo : OUT T_Igloo)IS
      USE P_T_Registre_Igloo;
      Reg_I:P_T_Registre_Igloo.File_Type;
   BEGIN
      BEGIN
         Open(Reg_I,In_File,"Registre_Igloo");
      EXCEPTION
         WHEN OTHERS=> Create(Reg_I,Name=>"Registre_Igloo");
      END;
      WHILE NOT End_Of_File(Reg_I) LOOP
         Read(Reg_I,Reg_Igloo);
      END LOOP;

   END Restaurer_Reg_Igloo;

END Gestion_Fichier;

