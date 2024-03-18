<?php

// Appel de la connexion à la base de données
include("../connexion_bdd.php");

//session_start(); // initialisation de la session
include("../time_session.php");

//error_reporting(E_ALL);
//ini_set('display_errors', 1);

//Récupération de l'identifiant de l'utilisateur
$idUtilisateur = $_SESSION['idUtilisateur'];

//Récupération les paniers de l'utilisateur
$stmt = $bdd->prepare("SELECT * FROM Panier WHERE idUtilisateur = ? AND valide = 1");
$stmt->execute([$idUtilisateur]);
$paniers = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mes anciennes commandes</title>
    <link rel="stylesheet" type="text/css" href="previous_orders.css"/>
</head>
<body>
    <!----------------- entête haut de page ----------------->
    <iframe src="../header/header.html" width="100%" height="180vw" frameborder="0"></iframe>
    
    <table class="top-page">
      <tr>
        <th class="back">
          <button onclick="history.back()"><img src="../img/retour.png" alt="Retour" width="40vw"></button>
          <label for="back-txt">Retour</label>
        </th>
        <th class="title-page">
          <h1>Mes anciennes commandes</h1>
        </th>
        <th></th>
      </tr>
    </table>
    
    <!----------------- Affichage des commandes précédentes (début) ----------------->
    <?php foreach ($paniers as $panier) : ?>
      <?php
        //Récupération contenu du panier de l'utilisateur
        $stmt = $bdd->prepare("SELECT * FROM Choix WHERE idPanier = ?");
        $stmt->execute([$panier['idPanier']]);
        $produits = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $CoutTotal = 0;
      ?>
      <!----------------- Commande précédente (début) ----------------->
      <h1>Commande n°<?=$panier['idPanier']?></h1>
      <table class="basket">
        <tr class="basket-titles">
          <th>Produit(s)</th>
          <th>Détails</th>
          <th>Prix</th>
          <th>Evaluer</th>
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
            <th class="price">
              <label><?=$produit['Prix']?>€</label>
            </th>
            <th class="evaluer">
              <form action="../evaluation_product/evaluation_product.php" method="GET">
                <input type="hidden" id="idProduit" name="idProduit" value="<?=$row['idProduit']?>">
                <input type="submit" value="Cliquer ici pour évaluer l'article">
              </form>
            </th>            
          </tr>        
        <?php endforeach; ?>    
      </table>
      <h2>Total : <?=$CoutTotal?>€</h2>
    <!----------------- Commande précédente (fin) ----------------->
    <?php endforeach; ?>
    <!----------------- Affichage des commandes précédentes (fin) ----------------->
</body>
</html>