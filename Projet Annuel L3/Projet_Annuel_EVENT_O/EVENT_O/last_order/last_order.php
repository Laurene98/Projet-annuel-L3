<?php

// Appel de la connexion à la base de données
include("../connexion_bdd.php");

//session_start(); // initialisation de la session
include("../time_session.php");

//error_reporting(E_ALL);
//ini_set('display_errors', 1);

//Récupération de l'identifiant de l'utilisateur
$idUtilisateur = $_SESSION['idUtilisateur'];

//Récupération du dernier panier de l'utilisateur
$stmt = $bdd->prepare("SELECT MAX(idPanier) AS idPanierMax FROM Panier WHERE idUtilisateur = ? AND valide = 1");
$stmt->execute([$idUtilisateur]);
$idPanier = $stmt->fetch(PDO::FETCH_ASSOC);

// Récupération des produits du dernier panier de l'utilisateur
$stmt = $bdd->prepare("SELECT * FROM Choix WHERE idPanier = ?");
$stmt->execute([$idPanier['idPanierMax']]);
$produits = $stmt->fetchAll(PDO::FETCH_ASSOC);

$CoutTotal = 0;
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="last_order.css">
    <title>Panier</title>
</head>
<body>
    <!----------------- entête haut de page ----------------->
    <iframe src="../header/header.html" width="100%" height="180vw" frameborder="0"></iframe>
    <!----------------- Titre page -----------------> 
    <table class="top-page">
      <tr>
        <th class="back">
          <button onclick="history.back()"><img src="../img/retour.png" alt="Retour" width="40vw"></button>
          <label for="back-txt">Retour</label>
        </th>
        <th class="title-page">
          <h1>Suivie de ma commande</h1>
        </th>
        <th></th>
      </tr>
    </table>
    <!----------------- Dernière commande (début) ----------------->
    <h1>Commande n°<?=$idPanier['idPanierMax']?> en cours</h1>
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
          //Récupération du produit de la dernière commande
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