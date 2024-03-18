<?php
session_start();    
//error_reporting(E_ALL);// Activer l'affichage de toutes les erreurs
include("ConnexionBDD.php"); // utilise la connexion à la base de données 
?>

<link rel="stylesheet" href="CSS/main3.css">
<link rel="stylesheet" href="CSS/Blocsinfos.css">

<?php
    if (isset($_POST['Valider'])){
        if(isset($_POST["occasion"])){
            $_SESSION["occasion"]=$_POST["occasion"];
        }
        header('Location: QuestionnaireQ3.php');
        exit();
    }
    
    if (isset($_POST['Passer'])){
        $_SESSION["occasion"]="toutQ2";
        header('Location: QuestionnaireQ3.php');
        exit();
    }

    if (isset($_POST['Retour'])){
        header('Location: QuestionnaireQ1.php');
        exit();
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/> 
        <title>QuestionnaireQ2</title>
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

            <!--Q°2 “Pour quelle occasion souhaitez-vous un cadeau ?”. En dessous de la question, il y a la liste des occasions avec une puce à côté. L’utilisateur coche l’occasion pour laquelle il souhaite le cadeau.-->
            <fieldset>
                <legend>Pour quelle occasion souhaitez-vous un cadeau ?</legend>
                <div>
                    <input type="radio" name="occasion" value="anniversaire" checked>
                    <label class="form-control" for="anniversaire">Anniversaire</label>
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
            </fieldset>

            <input type="submit" name="Valider" value="Valider" class="button">
            <input type="submit" name="Retour" value="Retour" class="button">
            <input type="submit" name="Passer" value="Passer" class="button">
            
        </form>
        </div>
    </body> 
</html>