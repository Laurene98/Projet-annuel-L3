<?php

    if (isset($_POST['valider'])){
        if(isset($_POST['description'])){
            $_SESSION['description']=$_POST['description'];
        }
        header('Location: PropoCDO7.php');
        exit();  
    }
    if (isset($_POST['retour'])){
        header('Location: PropoCDO5.php');
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
  <link rel="stylesheet" href="propositionCDO.php">
  <title>Questionnaire (6/7)</title>
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
            <a href="Esapce_perso.html"class="m-link">Compte</a>
        </div>
    </nav>
</header>
<!-- la tranche d'age -->
<form method="POST" action="PropoCDO6.php">
  <div class="Proposition d'une idée de cadeau">
   <div style="position: absolute; right: 460px; top:100px"> 
    <h2>Proposition d'une idée cadeau (6/7)</h2>
  </div> 
  <div style="position: absolute;top:150px; right:10px">
    <p>Vous avez une nouvelle idée de cadeau à suggérer ? Vous pouvez nous soumettre votre idée via le petit questionnaire suivant, qui sera envoyé à l'adminstrateur du site afin d'être valider.</p>
  </div> 
    <!-- le prix du CDO -->
  <center>
    <div style="width: 3000%; height: 200%;"></div>
      <fieldset>
          <label for=" la description">Décrire les caractéristiques du cadeau<span class="star"></span></label><br><br>
          <textarea id="la descritpion" name="description" placeholder="Decrire le cadeau (3000 caractères maximum) " rows="5" cols="50" maxlenght="3000"></textarea> 
          <br><br>
      </fieldset>
    </div>
    <br>
      <table></table>
            <tr>
              <input type="submit" name="retour" value="retour">
            </tr>
            <tr>
              <input type="submit" name="suivant" value="suivant">
            </tr> 
          </table>
  </center>  
  </div>
</form>
</div>
</body>
</html>