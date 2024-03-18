<?php
session_start();    
//error_reporting(E_ALL);// Activer l'affichage de toutes les erreurs
include("ConnexionBDD.php"); // utilise la connexion à la base de données 
?>

<link rel="stylesheet" href="CSS/main3.css">
<link rel="stylesheet" href="CSS/Blocsinfos.css">

<?php
    if (isset($_POST['Valider'])){  
        //$budmin = $budmax = 0;

        if(isset($_POST["budgmin"])){
            $_SESSION["budgmin"]=$_POST["budgmin"];
            //$budmin = 1;
        }
        else {
            $_SESSION["budgmin"] = 0;
        }

        if(isset($_POST["budgmax"])){
            $_SESSION["budgmax"]=$_POST["budgmax"];
            //$budmax = 1;
        }
        else {
            $_SESSION["budgmax"] = 30000;
        }
        header('Location: Result_Q.php');
        exit();
        }

    if (isset($_POST['Passer'])){
        $_SESSION["Q4"]="toutQ4";
        header('Location: Result_Q.php');
        exit();
    }

    if (isset($_POST['Retour'])){
        header('Location: QuestionnaireQ3P2.php');
        exit();
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/> 
        <title>QuestionnaireQ4</title>
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

            <!--Q°4 “Quel est votre budget ?”. L’utilisateur peut saisir une valeur minimale et/ou maximale. Il a pour cela deux champs distincts (min et max).-->
            <fieldset>
                <legend>Quel est votre budget ?</legend>
                    <input type="number" name="budgmin" min="0" max="30000" value="0" placeholder="Min">
                    <input type="number" name="budgmax" min="0" max="30000" value="30000" placeholder="Max">
            </fieldset> 
            
            <input type="submit" name="Valider" value="Valider" class="button">
            <input type="submit" name="Retour" value="Retour" class="button">
            <input type="submit" name="Passer" value="Passer" class="button">
        </form>
</div>
    </body> 
</html>

<?php
    if (isset($_GET['erreur']) AND $_GET['erreur'] != ''){
        switch($_GET['erreur']){
            case 1: $msg="Veuillez remplir au moins un prix afin de valider, sinon cliquez sur 'Passer'"; break;
        }
        echo $msg;
    }
?>