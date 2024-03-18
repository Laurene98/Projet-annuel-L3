<?php
session_start();
//appeler le fichier connexion à la bdd
include("ConnexionBDD.php");
?>

<?php

    if (isset($_POST['valider'])){ 
    if(isset($_POST["agemin"])){
        $_SESSION["agemin"]=$_POST["agemin"];
    }
    if(isset($_POST["agemax"])){
        $_SESSION["agemax"]=$_POST["agemax"];
    }
    if(empty($nom_cadeau)) {
        $Erreur_nom_cadeau = "Veuillez saisir un age";
    }
    header('Location: PropoCDO3.php');
    exit();
}
if (isset($_POST['retour'])){
header('Location:PropoCDO1.php');
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
  <title>Questionnaire (2/7)</title>
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
            <a href="Espace_perso.html"class="m-link">Compte</a>
        </div>
    </nav>
</header>
<!-- la tranche d'age -->
<form method="POST" action="proposition2.php">
  <div class="Proposition d'une idée de cadeau">
   <div style="position: absolute; right: 460px; top:100px"> 
    <h2>Proposition d'une idée cadeau (2/7)</h2>
  </div> 
  <div style="position: absolute;top:150px; right:10px">
    <p>Vous avez une nouvelle idée de cadeau à suggérer ? Vous pouvez nous soumettre votre idée via le petit questionnaire suivant, qui sera envoyé à l'adminstrateur du site afin d'être valider.</p>
  </div> 
    <!-- l'age du CDO -->
  <center>
    <div style="width: 3000%; height: 200%;"></div>
      <fieldset>
      <label>Age minimum<span class="star"></span></label><br><br>
    <input type="text" name="agemin" required="required" placeholder="âge minimum" class="inputText">
    <br><br>
    <label>Age maximum<span class="star"></span></label><br><br>
    <input type="text" name="agemax" required="required" placeholder="âge maximum" class="inputText">
          <br><br>
      </fieldset>
    </div>
    <br>
        <input type="submit" name="valider" value="valider" class="button">
        <input type="submit" name="retour" value="retour" class="button">
  </center>  
  </div>
</form>
</div>
</body>
</html>