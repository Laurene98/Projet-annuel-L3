<?php

// Appel de la connexion à la base de données
include("../connexion_bdd.php");

//session_start(); // initialisation de la session
include("../time_session.php");

//error_reporting(E_ALL);
//ini_set('display_errors', 1);

// Vérification de la soumission du formulaire
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

  //Récupération de l'identifiant de l'utilisateur
  $idUtilisateur = $_SESSION['idUtilisateur'];

  //Récupération le panier de l'utilisateur
  $stmt = $bdd->prepare("SELECT * FROM Panier WHERE idUtilisateur = ? AND valide = 0");
  $stmt->execute([$idUtilisateur]);
  $panier = $stmt->fetch(PDO::FETCH_ASSOC);

  // Valider la commande avec tout les élements du panier
  $stmt = $bdd->prepare("UPDATE Panier SET valide = 1 WHERE idPanier = ?");
  $stmt->execute([$panier['idPanier']]);

  // Création d'un nouveau panier
  $stmt = $bdd->prepare("INSERT INTO Panier (valide, idUtilisateur) VALUES (0, ?)");
  $stmt->execute([$idUtilisateur]);

  //Récupération le panier de l'utilisateur
  $stmt = $bdd->prepare("SELECT * FROM Choix WHERE idPanier = ?");
  $stmt->execute([$panier['idPanier']]);
  $produits = $stmt->fetchAll(PDO::FETCH_ASSOC);

  $CoutTotal = 0;
}
?>

<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="basket.css">
    <title>Panier</title>
  </head>
  <body>
    <!----------------- entête haut de page ----------------->
    <iframe src="../header/header.html" width="100%" height="180vw" frameborder="0"></iframe>
    <!----------------- panier (début) ----------------->
    <h1>Commande n°<?=$panier['idPanier']?> validé</h1>
    <br><br>
    <table class="basket">
      <tr class="basket-titles">
        <th></th>
        <th>Détails</th>
        <th>Offre</th>
        <th>Prix</th>
      </tr>
      <?php foreach ($produits as $row) : ?>
        <?php 
          //Récupération du produit
          $stmt = $bdd->prepare("SELECT * FROM Produit WHERE idProduit = ?");
          $stmt->execute([$row['idProduit']]);
          $produit = $stmt->fetch(PDO::FETCH_ASSOC); 

          $CoutTotal += $row['Quantite'] * $produit['Prix'];
        ?>
        <tr class="basket-item">
          <th class="picture-name">
            <img src="..//img/img_prod/<?= $produit["idProduit"] ?>.jpg" width="120vw" alt="Image du produit">
            <span class="item-name"><?=$produit['NomP']?></span>
          </th>
          <th class="quantity">
              <label for="quantity">Quantité : <?=$row['Quantite']?></label>
          </th>
          <th>Offre</th>
          <th class="price">
            <label><?=$produit['Prix']?>€</label>
          </th>
        </tr>
      <?php endforeach; ?>
    </table>
    <h2>Total : <?=$CoutTotal?>€</h2>
  </body>
</html>