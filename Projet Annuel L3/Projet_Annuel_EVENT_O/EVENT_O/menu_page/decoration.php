<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8">
    <title>Décoration</title>
    <link rel="stylesheet" type="text/css" href="menu_page.css"/>
  </head>
  <body>
    <!-------------------- entête haut de page ----------------------->
    <iframe src="../header/header.html" width="100%" height="180vw" frameborder="0"></iframe>
    <iframe src="../menub/menu.html" width="100%" frameborder="0" ></iframe>
    <!----------------- En-tête de catégorie (début)----------------->
    <h1>Décoration</h1>
    <!----------------- En-tête de catégorie (fin)------------------->
    <!----------------- Péparation requete (début)----------------->
    <?php
      // Inclusion du fichier de connexion à la BDD
      include("../connexion_bdd.php");

      //session_start(); // initialisation de la session
      include("../time_session.php");
      
      // Requête SQL pour récupérer les données de la table Produit
      $sql = "SELECT * FROM Produit WHERE Categorie IN ('Non_specifie', 'Guirlandes', 'Fleurs', 'Lumieres', 'Ballons', 'Autres')";

      // Exécuter la requête SQL
      $stmt = $bdd->query($sql);        
    ?>
    <!----------------- Péparation requete (fin)----------------->
    <!----------------- Liste de produit Decoration (début)----------------->
    <div class="tout">     
      <?php foreach ($stmt as $row) : ?>
        <form action="../product(fiche)/product.php" method="GET">
          <input type="hidden" name="idProduit" value="<?php echo $row['idProduit']; ?>">
          <div class="ajuster">
            <p>
            <button type="submit" name="submit">
            <img src="..//img/img_prod/<?= $row["idProduit"] ?>.jpg" width="80" height="80" alt="Image du produit">
            </button>
            <br>
            <?php echo $row["NomP"] ?> <br>
            <?= $row["Prix"] ?> €</p> <br>
          </div>
        </form>
      <?php endforeach; ?>        
    </div>
    <!----------------- Liste de produit Decoration (fin)------------------->
  </body>
</html>
