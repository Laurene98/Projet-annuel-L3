<?php
session_start();    
//error_reporting(E_ALL);// Activer l'affichage de toutes les erreurs
include("ConnexionBDD.php"); // utilise la connexion à la base de données 
?>

<link rel="stylesheet" href="CSS/main3.css">
<link rel="stylesheet" href="CSS/Blocsinfos.css">

<?php
    if (isset($_POST['Valider'])){       
        if(isset($_POST["ageps"])){
            $_SESSION["ageps"]=$_POST["ageps"];
        }
        header('Location: QuestionnaireQ2.php');
        exit();
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/> 
        <title>QuestionnaireQ1</title>
    </head>

    <body> 
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
        <div class="formquest">
            <form method="post" name="questionnaire">
                <!--Q°1 “Quel est l’âge de la personne qui recevra le cadeau ?”. L’utilisateur peut saisir un nombre en 0 et 115.-->
                <fieldset>
                    <legend>Quel est l’âge de la personne qui recevra le cadeau ? (0-115)</legend>
                        <input type="number" name="ageps" min="0" max="115" placeholder="Âge" class="input1" required>
                </fieldset> 
                
                <input type="submit" name="Valider" value="Valider" class="button">
            </form>
        </div>
    </body> 
</html>
