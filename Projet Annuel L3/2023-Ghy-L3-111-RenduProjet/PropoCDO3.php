<?php
session_start();    
//error_reporting(E_ALL);// Activer l'affichage de toutes les erreurs
include("ConnexionBDD.php"); // utilise la connexion à la base de données 
?>

<!-- <link rel="stylesheet" href="nomcss.css"> -->

<?php
//echo $_SESSION["ageps"];

    if (isset($_POST['valider'])){
        if(isset($_POST["occasion"])){
            $_SESSION["occasion"]=$_POST["occasion"];
        }
        header('Location: propocdo4.php');
        exit();
        
    }
    if (isset($_POST['retour'])){
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
  <link rel="stylesheet" href="CSS/main2.css">
  <link rel="stylesheet" href="propositionCDO.php">
  <title>Questionnaire (3/7)</title>
</head>
<body >
  <header role="header">
    <nav class="menu" role="navigation">
            <div class="inner"></div>
        <div class="m-center">
            <h1 class="logo">Idées de cadeaux</h1>
        </div>
        <div class="m-left" style="text-align:center;">
            <a href="Accueil.html" class="m-link"> Accueil</a>
            <a href="PropoCDO.html"class="m-link">Suggestion</a>
            <a href="Questionnaire.html"class="m-link">Questionnaire</a>
            <a href="Esapce_perso.html"class="m-link">Compte</a>
        </div>
    </nav>
</header>
<!-- l'occasion du CDO-->
<form method="POST" action="PropoCDO3.php">
    <div class="Proposition d'une idée de cadeau">
     <div style="position: absolute; right: 460px; top:100px"> 
      <h2>Proposition d'une idée cadeau (3/7)</h2>
    </div> 
    <div style="position: absolute;top:150px; right:10px">
      <p>Vous avez une nouvelle idée de cadeau à suggérer ? Vous pouvez nous soumettre votre idée via le petit questionnaire suivant, qui sera envoyé à l'adminstrateur du site afin d'être valider.</p>
    </div> 
      <!-- l'occasion du CDO -->
    <center>
      <div style="width: 3000%; height: 200%;"></div>
        <fieldset style="height: 100%;">
            <label for="occasion">L'occasion pour laquelle vous souhaitez offrir un cadeau<span class="star"></span></label><br><br>
            <div id="Q3">
            <div>
                    <input type="radio" name="occasion" value="anniversaire" checked>
                    <label for="anniversaire">Anniversaire</label>
                </div>
                <div>
                    <input type="radio" name="occasion" value="noel">
                    <label for="noel">Noël</label>
                </div>
                <div>
                    <input type="radio" name="occasion" value="saintvalentin">
                    <label for="saintvalentin">Saint Valentin</label>
                </div>
                <div>
                    <input type="radio" name="occasion" value="fetedesmere">
                    <label for="fetedesmere">Fête des mères</label>
                </div>
              </div>
            <br><br>
        </fieldset>
      </div>
      <br>
      <table></table>
            <tr>
              <input type="submit"  name="retour" value="retour">
            </tr>
            <tr>
              <input type="submit" name="valider" value="valider">
            </tr> 
          </table>
    </center>  
    </div>
  </form>
  </div>
  </body>
  </html>
  