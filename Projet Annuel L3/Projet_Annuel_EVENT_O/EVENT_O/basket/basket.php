<?php

//Appel de la connexion à la BDD
include("../connexion_bdd.php");

//session_start(); // initialisation de la session
include("../time_session.php");

//Récupération de l'identifiant de l'utilisateur
$idUtilisateur = $_SESSION['idUtilisateur'];

//Récupération du panier de l'utilisateur, le numero du panier quand la commande n'est pas validé
$stmt = $bdd->prepare("SELECT * FROM Panier WHERE idUtilisateur = ? AND Valide = 0");
$stmt->execute([$idUtilisateur]);
$panier = $stmt->fetch(PDO::FETCH_ASSOC);

//Récupération du contenu du panier de l'utilisateur, son contenu grace au numéro du panier
$stmt = $bdd->prepare("SELECT * FROM Choix WHERE idPanier = ?");
$stmt->execute([$panier['idPanier']]);
$produits = $stmt->fetchAll(PDO::FETCH_ASSOC);

$CoutTotal = 0;

//Vérifie si il y a une connexion sinon on se redirige à la page de connexion
if (!$idUtilisateur) {
  header('Location: ../connexion/connexion.html');
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
    <table class="top-page">
      <tr>
        <th class="back">
          <button onclick="history.back()">
            <img src="../img/retour.png" alt="Retour" width="40vw">
          </button>
          <label for="back-txt">Retour</label>
        </th>
        <th class="title-page">
          <h1>Panier</h1>
          <img src="../header/img/panier.png" alt="Panier" width="6%">
        </th>
        <th></th>
      </tr>
    </table>
    <table class="basket">
      <tr class="basket-titles">
        <th>Contenu</th>
        <th>Détails</th>
        <th>Supprimer</th>
        <th>Offre</th>
        <th>Prix</th>
      </tr>
      <?php foreach ($produits as $row) : ?>
        <?php 
          //Récupération du produit dans le panier de l'utilisateur
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
            <form action="basket_qtt.php" method="post">
              <label for="quantity">Quantité :</label>
              <input type="hidden" id="idProduit" name="idProduit" value="<?=$row['idProduit']?>">
              <input type="number" id="quantity" name="quantity" value="<?=$row['Quantite']?>" max="100">
              <button type="submit" value="valider">Valider</button>
            </form>
          </th>
          <th class="bin">
            <form action="basket_delete_one.php" method="post">
              <input type="hidden" id="idProduit" name="idProduit" value="<?=$row['idProduit']?>">
              <button type="submit" name="delete" class="delete-btn">
                <img src="img\poubelle.png" alt="poubelle (supprimer)">
              </button>
            </form>
          </th>
          <th>Offre</th>
          <th class="price">
            <label><?=$produit['Prix']?>€</label>
          </th>
        </tr>
      <?php endforeach; ?>
    </table>
    <h2>Total : <?=$CoutTotal?>€</h2>
    <div class="btn-container">
      <form action="basket_delete_all.php" method="post">
        <button class="btn empty-btn">
          Vider le panier
        </button>
      </form>
      <form action="basket_order.php" method="post">
        <button class="btn checkout-btn">
          Commander
        </button>
      </form>
    </div>
    <!----------------- panier (fin) ----------------->
</body>
</html>

  