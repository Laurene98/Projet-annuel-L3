<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Idées de cadeaux</title>
  <link rel="stylesheet" type="text/css" href="CSS/main2.css">
  <title>Liste Utilisateurs</title>
</head>
<body >
<header role="header">
    <nav class="menu" role="navigation">
            <div class="inner"></div>
        <div class="m-center">
            <h1 class="logo">Idées de cadeaux</h1>
        </div>
        <div class="m-left" style="text-align:center;">
            <a href="Admin.php" class="m-link"> Accueil</a>
            <a href="PropoCDO1.php"class="m-link">Suggestion</a>
            <a href="QuestionnaireQ1.php"class="m-link">Questionnaire</a>
            <a href="espace_admin.php"class="m-link">Compte</a>
        </div>
    </nav>
</header>
    <div style="position: absolute; right: 460px; top:80px"> 
        <h2>Suppression d'un cadeau </h2>
    </div>
    
</body>

<?php
session_start();
//appeler le fichier connexion à la bdd
include("ConnexionBDD.php");
?>
<?php
// Connexion à la base de données
    $host = 'localhost';
    $dbname = 'mlefevre';
    $username = 'mlefevre';
    $password = '!22202620!';
    
    $conn = new mysqli($host, $username, $password, $dbname);

// Vérification de la connexion
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Récupération des utilisateurs
$sql = "SELECT email, pseudo, mpd, statut_util FROM Utilisateur";
$result = $conn->query($sql); //query retourne la requête sql ci-dessus.

//renvoie le nombre de lignes dans le résultat d’une requête SELECT.mysqli_result
if ($result->num_rows > 0) {
  // Affichage des utilisateurs sous forme de tableau
  echo "<table><tr><th>Email</th><th>Pseudo</th><th>Mot de passe</th><th>Statut_util</th></tr>";
  //parcours de chaque valeurs
  while($row = $result->fetch_assoc()) {
    echo "<tr><td>".$row["email"]."</td><td>".$row["pseudo"]."</td><td>".$row["mpd"]."</td><td>".$row["statut_util"]."</td></tr>";
  }
  echo "</table>";
} else {
  echo "Aucun utilisateur trouvé.";
}

// Fermeture de la connexion
$conn->close();
?>
