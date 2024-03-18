<?php
session_start();    
//error_reporting(E_ALL);// Activer l'affichage de toutes les erreurs
include("ConnexionBDD.php"); // utilise la connexion à la base de données
?>

<!-- <link rel="stylesheet" href="nomcss.css"> -->

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
                        header("Location: Test.php");
                    }else{
                        header("Location: Index.php");
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
        <form method="post" name="connexion">
            <label> Mail : </label>
            <input type="text" name="email" maxLenght="40" placeholder="Votre adresse mail" required><br>
            <label> Mot de passe : </label>
            <input type="password" name="mdp" maxLenght="40" placeholder="Votre mot de passe" required><br>

            <input type="submit" name="btconnexion">
        </form>
    </body>
</html>