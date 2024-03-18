<?php
session_start();    
//error_reporting(E_ALL);// Activer l'affichage de toutes les erreurs
include("ConnexionBDD.php"); // utilise la connexion à la base de données 
?>

<link rel="stylesheet" href="CSS/main3.css">
<link rel="stylesheet" href="CSS/Blocsinfos.css">

<?php
    if (isset($_POST['Valider'])){
        $cpt = 0;
        if(isset($_POST["sport"])){
            $_SESSION["sport"]=$_POST["sport"];
            $cpt = $cpt+1;
        }
        else{
            $_SESSION['sport'] = "";
        }
        if(isset($_POST["lecture"])){
            $_SESSION["lecture"]=$_POST["lecture"];
            $cpt = $cpt+1;
        }
        else{
            $_SESSION['lecture'] = "";
        }
        if(isset($_POST["electronique"])){
            $_SESSION["electronique"]=$_POST["electronique"];
            $cpt = $cpt+1;
        }
        else{
            $_SESSION['electronique'] = "";
        }
        if(isset($_POST["actmanuel"])){
            $_SESSION["actmanuel"]=$_POST["actmanuel"];
            $cpt = $cpt+1;
        }
        else{
            $_SESSION['actmanuel'] = "";
        }
        if(isset($_POST["autres"])){
            $_SESSION["autres"]=$_POST["autres"];
            $cpt = $cpt+1;
        }
        else{
            $_SESSION['autres'] = "";
        }

        if ($cpt != 0) {
            header('Location: QuestionnaireQ3P2.php');
            exit();
        }
        else {
            // aucune case n'a été cochée
            header('Location: QuestionnaireQ3.php?erreur=1');
            exit();
        }
    }

    if (isset($_POST['Retour'])){
        header('Location: QuestionnaireQ2.php');
        exit();
    }

    if (isset($_POST['Passer'])){
        header('Location: QuestionnaireQ4.php');
        exit();
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/> 
        <title>QuestionnaireQ3</title>
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

            <!--Q°3 “Quels sont les centres d’intérêt de la personne qui recevra le cadeau ?”. En dessous de la question, il y a une liste à puce avec les activités.
            Lorsque l’utilisateur choisit un centre d’intérêt, le sous-groupe apparaît sous forme de liste à puce également.-->
            <fieldset id="Q3">
                <legend>Quels sont les centres d’intérêt de la personne qui recevra le cadeau ?</legend>
                <div>    
                    <input type="checkbox" name="sport" value="sport">
                    <label for="sport">Sport</label>
                </div>
                <div>    
                    <input type="checkbox" name="lecture" value="lecture">
                    <label for="lecture">Lecture</label>
                </div>
                <div>    
                    <input type="checkbox" name="electronique" value="electronique">
                    <label for="electronique">Electronique</label>
                </div>
                <div>    
                    <input type="checkbox" name="actmanuel" value="actmanuel">
                    <label for="actmanuel">Activité manuelle</label>
                </div>
                <div>    
                    <input type="checkbox" name="autres" value="autres">
                    <label for="autres">Autres</label>
                </div>
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
            case 1: $msg="Veuillez sélectionner au moins une occasion pour valider, sinon cliquez sur 'Passer'"; break;
        }
        echo $msg;
    }
?>