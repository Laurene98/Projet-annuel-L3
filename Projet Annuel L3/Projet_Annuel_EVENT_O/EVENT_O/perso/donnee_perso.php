<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8">
    <title>Données personnelles</title>
    <link rel="stylesheet" type="text/css" href="../main/main.css"/>
  </head>
  <body>
    <!----------------- entête haut de page ----------------->
    <iframe src="../header/header.html" width="100%" height="180vw" frameborder="0"></iframe>
    
    <h1>Données personnelles</h1>
    <?php
      // Inclusion du fichier de connexion à la BDD
      include("../connexion_bdd.php");
      
      //session_start(); // initialisation de la session
      include("../time_session.php");

      // Récupération de idUtilisateur
      $idUtilisateur = $_SESSION['idUtilisateur'];
      
      // Requête SQL pour récupérer les données de l'utilisateur avec l'ID correspondant
      $sql = "SELECT * FROM Utilisateur WHERE idUtilisateur = :id";
      
      // Préparation de la requête SQL
      $stmt = $bdd->prepare($sql);
      $stmt->bindParam(':id', $idUtilisateur); // relie la valeur récupérer et celle de la base de données
      
      // Exécution de la requête SQL
      $stmt->execute();
      
      // Récupération des résultats de la requête SQL sous forme d'un tableau associatif
      $result = $stmt->fetch(PDO::FETCH_ASSOC);
    ?>
    
    <!----------------- Affichage des données personnelles de l'utilisateur ----------------->
    <div>     
      Nom : <?php echo $result["Nom"] ?> <br> 
      Prénom : <?php echo $result["Prenom"] ?> <br>
      Pseudo : <?php echo $result["Pseudo"] ?> <br>
      Email : <?php echo $result["Email"] ?> <br>
    </div>
  </body>
</html>
