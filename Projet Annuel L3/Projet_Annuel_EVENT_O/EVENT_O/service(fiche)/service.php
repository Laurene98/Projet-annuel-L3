<?php
  //Appel de la connexion à la BDD
  include("../connexion_bdd.php");

  //session_start(); // initialisation de la session
  include("../time_session.php");

  // Vérifier si l'identifiant du Service est défini dans l'URL
  if (isset($_GET['idService'])) {
      // Récupérer l'identifiant du Service depuis l'URL
      $idService = $_GET['idService'];
      $stmt = $bdd->prepare("SELECT * FROM Service WHERE idService = ?");
      $stmt->execute([$idService]);
      $service = $stmt->fetch(PDO::FETCH_ASSOC);
  } else {
      // Si l'identifiant du Service n'est pas défini dans l'URL, afficher un message d'erreur ou rediriger l'utilisateur vers une autre page
      $message_erreur = "Le Service n'existe pas";
      header('Location: ../main/main.php');
  // lien : http://10.16.140.38/ldong01/EVENT_O/service(fiche)/service.php?idService=1 
}

?>
<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8">
    <title><?=$service['NomS']?></title>
    <link rel="stylesheet" type="text/css" href="service.css"/>
  </head>
  <body>
    <!----------------- entête haut de page ----------------->
    <iframe src="../header/header.html" width="100%" height="180vw" frameborder="0"></iframe>
    <!----------------- Entête (début)----------------->
    <table class="top-page">
      <tr>
        <th class="back">
          <button onclick="history.back()">
            <img src="../img/retour.png" alt="Retour" width="40vw">
          </button>
          <label for="back-txt">Retour</label>
        </th>
        <th class="title-page">
          <h1><?=$service['CategorieS']?></h1>
        </th>
      </tr>
    </table>
    <!----------------- Entête (fin)----------------->
    <!----------------- Information du service (début)----------------->
    <div class="container">
      <div class="column-left">
        <img src="./img/testballon.jpg" alt="Test">
        <br>
        <br>
        <?=$service['NomS']?>
        <br>
        <img src="../img/3etoile.jpg" alt="icône étoile pour évaluation" width="50%">
        <br>
        <div class="petit">
          Informations :
            <?=$service['Gastronomie']?>,
            <?=$service['Capacite']?> places,
            <?=$service['Localisation']?>,
            <?=$service['Regime']?> (régime),
            <?php
    				  if ($row["Parking"] == 0) { 
        				echo "sans parking"; 
    				  }
              if ($row["Parking"] == 1) {
                echo "avec parking";
              } 
            ?>
        </div>
        <br>
        <br>
        Evaluation
      </div>

      <div class="column-right">
        <div class="cadre">
          Coordonnées : <br>
          <?=$service['NomC']?> <?=$service['PrenomC']?> <br>
          <?=$service['EmailC']?>           
          <br>
      </div>         
        <div class="cadre2">
          Evaluation
          <br>
          Mettre le nombre d'étoile suivie d'une barre avec le nombre d'avis associé à la note
          <br>
          <img src="../img/5etoile.jpg" alt="">
          <br>
          <img src="../img/4etoile.jpg" alt="">
          <br>
          <img src="../img/3etoile.jpg" alt="">
          <br>
          <img src="../img/2etoile.jpg" alt="">
          <br>
          <img src="../img/1etoile.jpg" alt="">
        </div>
      </div>
    </div>
    <br>
    <p>
      Commentaires
    </p>
    <!----------------- Information du service (fin)------------------->

  </body>
</html>

<!--Pas de notation et commentaire fait