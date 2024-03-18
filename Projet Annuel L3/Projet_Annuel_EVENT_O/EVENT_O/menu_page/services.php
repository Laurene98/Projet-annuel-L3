<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8">
    <title>Services</title>
    <link rel="stylesheet" type="text/css" href="menu_page.css"/>
  </head>
  <body>
    <!-------------------- entête haut de page ----------------------->
    <iframe src="../header/header.html" width="100%" height="180vw" frameborder="0"></iframe>
    <iframe src="../menub/menu.html" width="100%" frameborder="0" ></iframe>  
  	<!----------------- En-tête de catégorie (début)----------------->
    <h1>Services</h1>
    <!----------------- En-tête de catégorie (fin)------------------->
    <!----------------- Péparation requete (début)----------------->
    <?php
      // Inclusion du fichier de connexion à la BDD
      include("../connexion_bdd.php");

      //session_start(); // initialisation de la session
      include("../time_session.php");
      
      // Requête SQL pour récupérer les données de la table Service
      $sql = "SELECT * FROM Service WHERE CategorieS NOT IN ('Traiteur', 'Transport', 'Salle_de_fete')";

      // Exécuter la requête SQL
      $stmt = $bdd->query($sql);        
    ?>
    <!----------------- Péparation requete (fin)----------------->
    <!----------------- Liste de service Services (début)----------------->
    <div class="tout">     
    <?php foreach ($stmt as $row) : ?>
      <form action="../service(fiche)/service.php" method="GET">
        <input type="hidden" name="idService" value="<?php echo $row['idService']; ?>">
          <div class="ajustement">
            <p>
            <button type="submit" name="submit">
              <img src="../img/testballon.jpg" width="80" height="80" alt="Ballon NB">
            </button>
            <br>
            <?php echo $row["NomS"] ?> <br> 
            <?php echo $row["NomC"] . ' ' . $row["PrenomC"] ?> <br>
            <?php echo $row["CategorieS"] ?> </p>
          </div>
      </form>      
    <?php endforeach; ?>                       
    </div>
    <!----------------- Liste de service Services (fin)------------------->
  </body>
</html>
