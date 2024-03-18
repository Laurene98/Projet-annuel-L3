<?php
session_start();    
//error_reporting(E_ALL);// Activer l'affichage de toutes les erreurs
include("ConnexionBDD.php"); // utilise la connexion à la base de données 
?>

<link rel="stylesheet" href="CSS/main3.css">
<link rel="stylesheet" href="CSS/Blocsinfos.css">
<!--<link rel="stylesheet" href="CSS/Recap.css">-->

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/> 
        <title>Résultats questionnaire</title>
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

    <h1 class="page_title">Résultats du questionnaire</h1>
    
<?php
if ($_SESSION["occasion"] == "toutQ2") {
    $affKDO = $bdd->prepare("SELECT * FROM Cadeau WHERE prix < ? AND prix > ? AND agemax > ? AND agemin < ? AND statut_kdo = ?");
    $affKDO->execute(array($_SESSION['budgmax'], $_SESSION['budgmin'],$_SESSION['ageps'],$_SESSION['ageps'],"acceptee"));
    ?>
    <div class='cases'> 
        <?php
        foreach($affKDO as $a){ //boucle qui parcourt les lignes du tableau 
        ?>
        <div class='contenu'>
        <span class='photo_grille'>
                <?php
                
                $img=$a['image'];
                $img64=base64_encode($img);
                //affichage de l'image
                echo '<img src="data:image/png;base64,'.$img64.'"
                width=150
                height=150>';
                ?>
                </span>
                <span class='texte_grille'>
                <?php 
                    echo $a['nom_cadeau'].'<br>';
                    echo $a['description'].'<br>';
                    echo "Prix :".$a['prix'].'<br>';
                    echo "Âge minimum :".$a['agemin'].'<br>';
                    echo "Âge maximum :".$a['agemax'].'<br>';
                    
                    //echo $aff['sexe'].'<br>';  
                ?>                
                </span>
        </div>
        <?php
        }
        ?>
    </div>
    <?php
        }
             
        
    $affKDO = $bdd->prepare("SELECT * FROM Cadeau WHERE prix < ? AND prix > ? AND agemax > ? AND agemin < ? AND occasion = ? AND statut_kdo = ?");
    $affKDO->execute(array($_SESSION['budgmax'], $_SESSION['budgmin'],$_SESSION['ageps'],$_SESSION['ageps'],$_SESSION['occasion'],"acceptee"));
    foreach($affKDO as $a){ //boucle qui parcourt les lignes du tableau 
        echo "<p>".$a['nom_cadeau']."</p>";
        if ($_SESSION["occasion"] == $occasion){
            try {                
                echo $a['nom_cadeau'];
            }
            catch(Exception $e){
                die('Erreur : '.$e->getMessage());
            }
        }
    }
    
?>


    </body> 
</html>

