<?php
session_start();
//appeler le fichier connexion à la bdd
include("ConnexionBDD.php");
?>
<?php

if (isset($_POST['valider'])){       
    if(isset($_POST["nom_cadeau"])){
        $_SESSION["nom_cadeau"]=$_POST["nom_cadeau"];
    }
    header('Location: proposition2.php');
    exit();
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Idées de cadeaux</title>
  <link rel="stylesheet" type="text/css" href="CSS/main2.css">
  <title>Questionnaire (1/7)</title>
</head>
<body >
<header role="header">
    <nav class="menu" role="navigation">
            <div class="inner"></div>
        <div class="m-center">
            <h1 class="logo">Idées de cadeaux</h1>
        </div>
        <div class="m-left" style="text-align:center;">
            <a href="AccueilUser.html" class="m-link"> Accueil</a>
            <a href="PropoCDO1.php"class="m-link">Suggestion</a>
            <a href="QuestionnaireQ1.php"class="m-link">Questionnaire</a>
            <a href="Esapce_perso.html"class="m-link">Compte</a>
        </div>
    </nav>
</header>
<form method="POST" action="PropoCDO1.php">
<div class="Proposition d'une idée de cadeau">
   <div style="position: absolute; right: 460px; top:100px"> 
    <h2>Proposition d'une idée cadeau (1/7) </h2>
  </div> 
  <div style="position: absolute;top:150px; right:10px">
    <p>Vous avez une nouvelle idée de cadeau à suggérer ? Vous pouvez nous soumettre votre idée via le petit questionnaire suivant, qui sera envoyé à l'adminstrateur du site afin d'être valider.</p>
  </div> 
<fieldset>
      <p>
        <label for="nom_cadeau">
          <span>Nom du cadeau</span><span class="star"></span></label><br><br>
          <input type="text" name="nom_cadeau" required="required" placeholder="Le cadeau " class="inputText"> 
          <br><br>
        </label>
      </p>
      <br>
</fieldset>
    <input type="submit" name="valider" value="valider">
 
</body>
</html>
