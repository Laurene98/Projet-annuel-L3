<?php
session_start();    
//error_reporting(E_ALL);// Activer l'affichage de toutes les erreurs
include("ConnexionBDD.php"); // utilise la connexion à la base de données 
?>

<!-- <link rel="stylesheet" href="nomcss.css"> -->

<?php

    if (isset($_POST['valider'])){
        if(isset($_POST["prix"])){
            $_SESSION["prix"]=$_POST["prix"];
        }
        header('Location: PropoCDO6.php');
        exit();  
    }
    if (isset($_POST['retour'])){
        header('Location: Propocdo4.php');
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
  <link rel="stylesheet" href="CSS/main2.css">
  <title>Questionnaire (5/7)</title>
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
            <a href="Questionnaire.php"class="m-link">Questionnaire</a>
            <a href="Espace_perso.html"class="m-link">Compte</a>
        </div>
    </nav>
</header>
<!-- la tranche d'age -->
<form method="POST" action="PropoCDO5.php">
  <div class="Proposition d'une idée de cadeau">
   <div style="position: absolute; right: 460px; top:100px"> 
    <h2>Proposition d'une idée cadeau (5/7)</h2>
  </div> 
  <div style="position: absolute;top:150px; right:10px">
    <p>Vous avez une nouvelle idée de cadeau à suggérer ? Vous pouvez nous soumettre votre idée via le petit questionnaire suivant, qui sera envoyé à l'adminstrateur du site afin d'être valider.</p>
  </div> 
    <!-- le prix du CDO -->
  <center>
    <div style="width: 3000%; height: 200%;"></div>
      <fieldset>
          <label>Le budget pour ce cadeau<span class="star"></span></label><br><br>
          <input type="text" name="prix" required="required" placeholder="Le prix " class="inputText"> 
          <br><br>
      </fieldset>
    </div>
    <br>
      <table></table>
            <tr>
            <input type="submit" name="valider" value="valider" class="button">
            </tr>
            <tr>
            <input type="submit" name="retour" value="retour" class="button"> 
            </tr> 
          </table>
  </center>  
  </div>
</form>
</div>
</body>
</html>