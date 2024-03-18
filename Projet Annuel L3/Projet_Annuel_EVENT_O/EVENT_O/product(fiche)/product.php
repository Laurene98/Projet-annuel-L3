<?php

//Appel de la connexion à la BDD
include("../connexion_bdd.php");

//session_start(); // initialisation de la session
include("../time_session.php");

$idUtilisateur = $_SESSION['idUtilisateur'];

// Vérifier si l'identifiant du produit est défini dans l'URL
if (isset($_GET['idProduit'])) {
    // Récupérer l'identifiant du produit depuis l'URL
    $idProd = $_GET['idProduit'];
    $stmt = $bdd->prepare("SELECT * FROM Produit WHERE idProduit = ?");
    $stmt->execute([$idProd]);
    $produit = $stmt->fetch(PDO::FETCH_ASSOC);
} else {
    // Si l'identifiant du produit n'est pas défini dans l'URL, afficher un message d'erreur ou rediriger l'utilisateur vers une autre page
    $message_erreur = "Le produit n'existe pas";
    header('Location: ../main/main.php');
}
// Récupérer tout les commentaires d'un produit
$stmt = $bdd->prepare("SELECT * FROM Commentaire WHERE idProduit = ?");
$stmt->execute([$idProd]);
$commentaires = $stmt->fetchAll(PDO::FETCH_ASSOC);

// lien pour produit pour vérification de l'affichage : http://10.16.140.38/ldong01/EVENT_O/product(fiche)/product.php?idProduit=13
?>

<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8">
    <title><?=$produit['NomP']?></title>
    <link rel="stylesheet" type="text/css" href="product.css"/>
  </head>
  <body>
    <!----------------- entête haut de page ----------------->
    <iframe src="../header/header.html" width="100%" height="180vw" frameborder="0"></iframe>
    <!----------------- Entête (début)----------------->
    <table class="top-page">
      <tr>
        <th class="back">
          <button onclick="history.back()"><img src="../img/retour.png" alt="Retour" width="40vw"></button>
          <label for="back-txt">Retour</label>
        </th>
        <th class="title-page">
          <h1><?=$produit['Categorie']?></h1>
        </th>
      </tr>
    </table>
    <!----------------- Entête (fin)----------------->
    <!----------------- Informations du produit (début)----------------->
    <div class="container">
      <div class="column-left">
        <img src="..//img/img_prod/<?= $produit["idProduit"] ?>.jpg" alt="Image du produit">
        <br>
        <br>
        <?=$produit['NomP']?>
        <br>
        <?=$produit['Prix']?>€
        <?php 
          // On recupère prend les notes d'un produit
          $stmt = $bdd->prepare("SELECT * FROM Note WHERE idProduit = ?");
          $stmt->execute([$idProd]);
          $notes = $stmt->fetchAll(PDO::FETCH_ASSOC);

          // On calcule la moyenne des notes (somme/total <=> $somme/$cpt)
          $somme = 0;
          $cpt = 0;
          foreach ($notes as $note) {
              $somme += $note['Note'];
              $cpt += 1;
          }

          // Attention à l'imbriquage de html et php pour l'affichage
          if ($cpt) {
              $moy = $somme/$cpt;
              if ($moy < 1.5) {?>
                  <img src="../img/1etoile.jpg" alt="icône étoile pour évaluation" width="50%">
              <?php } elseif ($moy < 2.5) {?>
                  <img src="../img/2etoile.jpg" alt="icône étoile pour évaluation" width="50%">
              <?php } elseif ($moy < 3.5) {?>
                  <img src="../img/3etoile.jpg" alt="icône étoile pour évaluation" width="50%">
              <?php } elseif ($moy < 4.5) {?>
                  <img src="../img/4etoile.jpg" alt="icône étoile pour évaluation" width="50%">
              <?php } else {?>
                  <img src="../img/5etoile.jpg" alt="icône étoile pour évaluation" width="50%">
              <?php }
          } else {?>
              <p>Pas d'avis pour le moment</p>
        <?php }?>

        <?php 
          //On récupère toutes les recommandations d'un produit
          $stmt = $bdd->prepare("SELECT * FROM Recommandation WHERE idProduit = ?");
          $stmt->execute([$idProd]);
          $totRecom = $stmt->fetchAll(PDO::FETCH_ASSOC);
          
          //On compte le nombre de recommandation
          if ($totRecom){
            $nbProd = count($totRecom); // Nombre de recommandations
            $stmt = $bdd->prepare("SELECT * FROM Recommandation WHERE idProduit = ? AND Recommande = 1");
            $stmt->execute([$idProd]);
            $Recom = $stmt->fetchAll(PDO::FETCH_ASSOC); // Produit recommandé positivement 
            $nbRecom = count($Recom); // Nb total de recommandé positif sur un produit
            $cptRecom = ($nbRecom / $nbProd) * 100; ?> <!--Calcul % de rocommandation pour un produit--->
            <p><?=intval($cptRecom)?>% des acheteurs recommandent le produit</p> <!--Transformation et affichage du résulat en entier-->
        <?php }       
        ?>
      </div>
      <div class="column-right">
        <form action="add_basket.php" method="post">
          <div class="quantity">
            <label for="quantity">Quantité :</label>
            <input type="number" id="quantity" name="quantity" value="1" max="100" min="1"> 
            <input type="hidden" id="idProduit" name="idProduit" value="<?php echo $produit['idProduit']; ?>">         
          </div>
        <input type="submit" value="Ajouter au Panier">
        </form>    

        <div class="cadre2">
          Evaluation
          <br>
          <?php 
          // Affichage des nombres d'avis selon la note
            // Comptage du nombre de note qui vaut 5
            $stmt = $bdd->prepare("SELECT COUNT(*) FROM Note WHERE idProduit = ? AND Note = 5");
            $stmt->execute([$idProd]);
            $result = $stmt->fetchColumn();
          ?>
          <img src="../img/5etoile.jpg" alt="5 etoiles"> (<?=$result?>)
          <br>
          <?php 
            // Comptage du nombre de note qui vaut 4
            $stmt = $bdd->prepare("SELECT COUNT(*) FROM Note WHERE idProduit = ? AND Note = 4");
            $stmt->execute([$idProd]);
            $result = $stmt->fetchColumn();
          ?>
          <img src="../img/4etoile.jpg" alt="4 etoiles"> (<?=$result?>)
          <br>
          <?php 
            // Comptage du nombre de note qui vaut 3
            $stmt = $bdd->prepare("SELECT COUNT(*) FROM Note WHERE idProduit = ? AND Note = 3");
            $stmt->execute([$idProd]);
            $result = $stmt->fetchColumn();
          ?>
          <img src="../img/3etoile.jpg" alt="3 etoiles"> (<?=$result?>)
          <br>
          <?php 
            // Comptage du nombre de note qui vaut 2
            $stmt = $bdd->prepare("SELECT COUNT(*) FROM Note WHERE idProduit = ? AND Note = 2");
            $stmt->execute([$idProd]);
            $result = $stmt->fetchColumn();
          ?>
          <img src="../img/2etoile.jpg" alt="2 etoiles"> (<?=$result?>)
          <br>
          <?php 
            // Comptage du nombre de note qui vaut 1
            $stmt = $bdd->prepare("SELECT COUNT(*) FROM Note WHERE idProduit = ? AND Note = 1");
            $stmt->execute([$idProd]);
            $result = $stmt->fetchColumn();
          ?>
          <img src="../img/1etoile.jpg" alt="1 etoile"> (<?=$result?>)
        </div>
      </div>
    </div>
    
    <br>
    <label for="commentaire">Commentaire</label>

    <?php foreach ($commentaires as $com) : ?> <!--Pour tout les commentaires récupérés, requete préparer au début du code -->
      <!-- Préparation des requetes -->
      <?php
        // Récupération du pseudo de l'utilisateur
        $stmt = $bdd->prepare("SELECT * FROM Utilisateur WHERE idUtilisateur = ?");
        $stmt->execute([$com['idUtilisateur']]);
        $utilisateur = $stmt->fetch(PDO::FETCH_ASSOC);

        // Récupération de la conformité du produit selon l'utilisateur et Affichage en "oui" "non"
        $stmt = $bdd->prepare("SELECT * FROM Conformite WHERE idUtilisateur = ? AND idProduit = ?");
        $stmt->execute([$com['idUtilisateur'], $produit['idProduit']]);
        $conformite = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($conformite['Conforme']) {
          $conforme = "Oui";
        } else {
          $conforme = "Non";
        }

        // Récupération de la recommandation du produit selon l'utilisateur et Affichage en "oui" "non"
        $stmt = $bdd->prepare("SELECT * FROM Recommandation WHERE idUtilisateur = ? AND idProduit = ?");
        $stmt->execute([$com['idUtilisateur'], $produit['idProduit']]);
        $recommandation = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($recommandation['Recommande']) {
          $recommande = "Oui";
        } else {
          $recommande = "Non";
        }

        // Récupération de la note donné par l'utilisateur pour le produit
        $stmt = $bdd->prepare("SELECT * FROM Note WHERE idUtilisateur = ? AND idProduit = ?");
        $stmt->execute([$com['idUtilisateur'], $produit['idProduit']]);
        $note = $stmt->fetch(PDO::FETCH_ASSOC);

      ?>
      
      <!-- Affichage des commentaires -->
        <table class="comm">
          <tr>
            <th>
              <div class="pseudo">
                <p><?=$utilisateur['Pseudo'];?></p>
              </div>
              <p>
                Note : <?=$note['Note'];?><br>
                Conforme : <?=$conforme?><br>
                Recommande : <?=$recommande?>
              </p>
            </th>
            <th>
              <!--Vérifier la conditions de modifier le commentaire si elle provient le l'utilisateur lui-même-->
              <?php if ($_SESSION['idUtilisateur'] == $utilisateur['idUtilisateur']) :?>
                <form action="../evaluation_product/evaluation_product.php" method="get">
                  <input type="hidden" name="idProduit" value="<?php echo $produit['idProduit']?>">
                  <div class="btn-container">
                    <button type="submit">Modifier le commentaire</button>
                  </div> 
                </form>
              <?php endif; ?>
            </th>
          </tr>
        </table>
      <p><?=$com['Commentaire'];?></p> 
    <?php endforeach; ?>
    <!----------------- Informations du produit (fin)------------------->
  </body>
</html>

<!--Possibilité de revoir l'affichage des commentaires

