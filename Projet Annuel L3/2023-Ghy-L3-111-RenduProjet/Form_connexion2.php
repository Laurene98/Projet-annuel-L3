<?php
session_start();    
//error_reporting(E_ALL);// Activer l'affichage de toutes les erreurs
include("ConnexionBDD.php"); // utilise la connexion à la base de données
?>

<link rel="stylesheet" href="CSS/form.css">

<?php
    if (isset($_POST['btconnexion'])){
        if ((isset($_POST['email'])) && (isset($_POST['mdp']))){
            $email=htmlspecialchars($_POST['email']);
            $mdp=htmlspecialchars($_POST['mdp']);

            // On cherche dans la BDD l'utilisateur pour lequel le pseudo et le mail correspondent
            $verifuser=$bdd->prepare("SELECT * FROM Utilisateur WHERE email=? AND mdp=?");
                try{
                    $verifuser->execute(array($email,$mdp));
                }
                catch(Exception $e){
                    die('Erreur : '.$e->getMessage());
                }

                // On compte le nombre d'utilisateurs ayant ce mail et ce mdp dans la BDD
                $userexist=$verifuser->rowCount();

                // S'il n'en existe pas, on indique une erreur
                if ($userexist==0){
                    echo "L'adresse mail ou le mot de passe est incorrect.";
                }

                // S'il en existe un, on récupère son mail et on l'envoie sur la page d'accueil
                // gérer le cas de l'admin aussi
                else {
                    $verifuser=$bdd->prepare("SELECT * FROM Utilisateur WHERE email=?");
                    try{
                        $verifuser->execute(array($email));
                    }
                    catch(Exception $e){
                        die('Erreur : '.$e->getMessage());
                    }
                    $infoUtilisateur = $verifuser->fetch();
                    $_SESSION['email'] = $email;
                    if ($infoUtilisateur['statut_util'] == "administrateur"){
                        header("Location: Admin.php");
                    }else{
                        header("Location: AccueilUser.html");
                    }
                                         
                }
        }
   }
    
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/> 
        <title>Connexion</title>
    </head>

    <body>
        <header role="header">
                    <nav class="menu" role="navigation">
                            <div class="inner"></div>
                        <div class="m-center">
                            <h1 class="logo">Idées de cadeaux</h1>
                        </div>
                        <div class="m-left">
                        <a href="Accueil.html" class="m-link">Accueil</a>
                        <a href="Form_connexion2.php"class="m-link">Connexion</a>
                        <a href="Form_inscription2.php"class="m-link">Inscription</a>
                    </div>
                </nav>
            </header>
            <center>
                <fieldset>
                    <form method="post" name="connexion">
                        <h1 class="titre1">Connexion</h1>   
                        <table>
                            <tr>
                                <td>Adresse mail :</td>
                                <td><input type="text" name="email" maxLenght="40" placeholder="Votre adresse mail" required><br><br></td>
                            </tr>
                            <tr>
                                <td>Mot de passe :</td>
                                <td><input type="password" name="mdp" maxLenght="40" placeholder="Votre mot de passe" required><br><br></td>
                            </tr>
                            <tr>
                                <td colspan="2"> <input type="submit" name="btconnexion"> </td>
                            </tr>
                        </table>
                    </form>
                </fieldset>
        </center>
    </body>
</html>
