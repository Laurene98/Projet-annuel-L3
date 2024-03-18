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

        //sport
            if(isset($_POST["football"])){
                $_SESSION["football"]=$_POST["football"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['football'] = "";
            }
            if(isset($_POST["basketball"])){
                $_SESSION["basketball"]=$_POST["basketball"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['basketball'] = "";
            }
            if(isset($_POST["handball"])){
                $_SESSION["handball"]=$_POST["handball"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['handball'] = "";
            }
            if(isset($_POST["equitation"])){
                $_SESSION["equitation"]=$_POST["equitation"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['equitation'] = "";
            }
            if(isset($_POST["danse"])){
                $_SESSION["danse"]=$_POST["danse"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['danse'] = "";
            }

        //lecture
            if(isset($_POST["fantastique"])){
                $_SESSION["fantastique"]=$_POST["fantastique"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['fantastique'] = "";
            }
            if(isset($_POST["thriller"])){
                $_SESSION["thriller"]=$_POST["thriller"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['thriller'] = "";
            }
            if(isset($_POST["romance"])){
                $_SESSION["romance"]=$_POST["romance"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['romance'] = "";
            }
            if(isset($_POST["dystopie"])){
                $_SESSION["dystopie"]=$_POST["dystopie"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['dystopie'] = "";
            }
            if(isset($_POST["uchronie"])){
                $_SESSION["uchronie"]=$_POST["uchronie"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['uchronie'] = "";
            }

            //electronique
            if(isset($_POST["console"])){
                $_SESSION["console"]=$_POST["console"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['console'] = "";
            }
            if(isset($_POST["apparphoto"])){
                $_SESSION["apparphoto"]=$_POST["apparphoto"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['apparphoto'] = "";
            }
            if(isset($_POST["enceinte"])){
                $_SESSION["enceinte"]=$_POST["enceinte"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['enceinte'] = "";
            }
            if(isset($_POST["projecteur"])){
                $_SESSION["projecteur"]=$_POST["projecteur"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['projecteur'] = "";
            }
            if(isset($_POST["drone"])){
                $_SESSION["drone"]=$_POST["drone"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['drone'] = "";
            }

            // Activité manuelle
            if(isset($_POST["poterie"])){
                $_SESSION["poterie"]=$_POST["poterie"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['poterie'] = "";
            }
            if(isset($_POST["crochet"])){
                $_SESSION["crochet"]=$_POST["crochet"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['crochet'] = "";
            }
            if(isset($_POST["peinture"])){
                $_SESSION["peinture"]=$_POST["peinture"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['peinture'] = "";
            }
            if(isset($_POST["bricolage"])){
                $_SESSION["bricolage"]=$_POST["bricolage"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['bricolage'] = "";
            }

            // Autres
            if(isset($_POST["jeuxdesoc"])){
                $_SESSION["jeuxdesoc"]=$_POST["jeuxdesoc"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['jeuxdesoc'] = "";
            }
            if(isset($_POST["beaute"])){
                $_SESSION["beaute"]=$_POST["beaute"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['beaute'] = "";
            }
            if(isset($_POST["dessin"])){
                $_SESSION["dessin"]=$_POST["dessin"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['dessin'] = "";
            }
            if(isset($_POST["peluche"])){
                $_SESSION["peluche"]=$_POST["peluche"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['peluche'] = "";
            }
            if(isset($_POST["bracelet"])){
                $_SESSION["bracelet"]=$_POST["bracelet"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['bracelet'] = "";
            }
            if(isset($_POST["bougie"])){
                $_SESSION["bougie"]=$_POST["bougie"];
                $cpt = $cpt+1;
            }
            else{
                $_SESSION['bougie'] = "";
            }
            

        if ($cpt != 0){
            header('Location: QuestionnaireQ4.php');
            exit();
        }
        else {
            //aucune case n'a été cochée
            header('Location: QuestionnaireQ3P2.php?erreur=1');
            exit();
        }
        
    }

    if (isset($_POST['Passer'])){
        $_SESSION["Q3P2"]="toutQ3P2";
        header('Location: QuestionnaireQ4.php');
        exit();
    }

    if (isset($_POST['Retour'])){
        header('Location: QuestionnaireQ3.php');
        exit();
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/> 
        <title>QuestionnaireQ3P2</title>
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
            <!-- Sous-choix des réponses de la Q3 -->
            <?php 
                if ($_SESSION['sport'] == "sport"){
                    ?>
                    <fieldset id="Q3sport">
                    <legend>Sport</legend>
                        <div>    
                            <input type="checkbox" name="football" value="football">
                            <label for="football">Football</label>
                        </div>
                        <div>    
                        <input type="checkbox" name="basketball" value="basketball">
                            <label for="basketball">Basketball</label>
                        </div>
                        <div>    
                            <input type="checkbox" name="handball" value="handball">
                            <label for="handball">Handball</label>
                        </div>
                        <div>    
                            <input type="checkbox" name="equitation" value="equitation">
                            <label for="equitation">Equitation</label>
                        </div>
                        <div>    
                            <input type="checkbox" name="danse" value="danse">
                            <label for="danse">Danse</label>
                        </div>
                    </fieldset>
                    <?php
                }
            ?>
                
            <?php 
                if ($_SESSION['lecture'] == "lecture"){
                    ?>
                    <fieldset id="Q3lecture">
                    <legend>Lecture</legend>
                        <div>    
                            <input type="checkbox" name="fantastique" value="fantastique">
                            <label for="fantastique">Fantastique</label>
                        </div>
                        <div>    
                            <input type="checkbox" name="thriller" value="thriller">
                            <label for="thriller">Thriller</label>
                        </div>
                        <div>    
                            <input type="checkbox" name="romance" value="romance">
                            <label for="romance">Romance</label>
                        </div>
                        <div>    
                            <input type="checkbox" name="dystopie" value="dystopie">
                            <label for="dystopie">Dystopie</label>
                        </div>
                        <div>    
                            <input type="checkbox" name="uchronie" value="uchronie">
                            <label for="uchronie">Uchronie</label>
                        </div>
                    </fieldset>
                    <?php
                }
            ?>

            <?php 
                if ($_SESSION['electronique'] == "electronique"){
                    ?>
                    <fieldset id="Q3electronique">
                    <legend>Electronique</legend>
                        <div>    
                            <input type="checkbox" name="console" value="console">
                            <label for="console">Console</label>
                        </div>
                        <div>    
                        <input type="checkbox" name="apparphoto" value="apparphoto">
                            <label for="apparphoto">Appareil photo</label>
                        </div>
                        <div>    
                            <input type="checkbox" name="enceinte" value="enceinte">
                            <label for="enceinte">Enceinte</label>
                        </div>
                        <div>    
                            <input type="checkbox" name="projecteur" value="projecteur">
                            <label for="projecteur">Projecteur</label>
                        </div>
                        <div>    
                            <input type="checkbox" name="drone" value="drone">
                            <label for="drone">Drone</label>
                        </div>
                    </fieldset>
                    <?php
                }
            ?>

            <?php 
                if ($_SESSION['actmanuel'] == "actmanuel"){
                    ?>
                    <fieldset id="Q3actmanuel">
                    <legend>Activité manuelle</legend>
                        <div>    
                            <input type="checkbox" name="poterie" value="poterie">
                            <label for="poterie">Poterie</label>
                        </div>
                        <div>    
                        <input type="checkbox" name="crochet" value="crochet">
                            <label for="crochet">Crochet</label>
                        </div>
                        <div>    
                            <input type="checkbox" name="dessin" value="dessin">
                            <label for="dessin">Dessin</label>
                        </div>
                        <div>    
                            <input type="checkbox" name="peinture" value="peinture">
                            <label for="peinture">Peinture</label>
                        </div>
                        <div>    
                            <input type="checkbox" name="bricolage" value="bricolage">
                            <label for="bricolage">Drone</label>
                        </div>
                    </fieldset>
                    <?php
                }
            ?>

            <?php 
                if ($_SESSION['autres'] == "autres"){
                    ?>
                    <fieldset id="Q3autres">
                        <legend>Autres</legend>
                        <div>    
                            <input type="checkbox" name="jeuxdesoc" value="jeuxdesoc">
                            <label for="jeuxdesoc">Jeux de société</label>
                        </div>
                        <div>    
                        <input type="checkbox" name="beaute" value="beaute">
                            <label for="beaute">Beauté</label>
                        </div>
                        <div>    
                            <input type="checkbox" name="dessin" value="dessin">
                            <label for="dessin">Dessin</label>
                        </div>
                        <div>    
                            <input type="checkbox" name="peluche" value="peluche">
                            <label for="peluche">Peluche</label>
                        </div>
                        <div>    
                            <input type="checkbox" name="bracelet" value="bracelet">
                            <label for="bracelet">Sac</label>
                        </div>
                        <div>    
                            <input type="checkbox" name="bougie" value="bougie">
                            <label for="bougie">Bougie</label>
                        </div>
                    </fieldset>
                    <?php
                }
            ?>

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