<?php
session_start();    
//error_reporting(E_ALL);// Activer l'affichage de toutes les erreurs
include("ConnexionBDD.php"); // utilise la connexion à la base de données
    
?>

<link rel="stylesheet" href="CSS/Inscription.css">

<?php

    if(isset($_POST['btinscription'])){ //isset = est rempli
        // si tous les champs sont remplis
        if ((isset($_POST['pseudo'])) && (isset($_POST['email'])) && (isset($_POST['mdp1'])) && (isset($_POST['mdp2']))){
            $pseudo=htmlspecialchars($_POST['pseudo']);
            $email=htmlspecialchars($_POST['email']);
            $mdp1=htmlspecialchars($_POST['mdp1']);
            $mdp2=htmlspecialchars($_POST['mdp2']);

            // on cherche dans la bdd les utilisateurs avec le mail proposé
            $verifemail=$bdd->prepare("SELECT * FROM Utilisateur WHERE email=? ;");
            try{
                $verifemail->execute(array($email));
            }
            catch(Exception $e){
                die('Erreur :'.$e->getMessage());
            }
            // on cherche dans la bdd les utilisateurs avec le pseudo proposé
            $verifpseudo=$bdd->prepare("SELECT * FROM Utilisateur WHERE pseudo=? ;");
            try{
                $verifpseudo->execute(array($pseudo));
            }
            catch(Exception $e){
                die('Erreur :'.$e->getMessage());
            }

            // on vérifie que le mail n'a jamais été utilisé
            $emailexist=$verifemail->rowCount();
            if($emailexist==0){ // si le mail n'existe pas alors
                //on vérifie que le pseudo n'a pas été utilisé
                $pseudoexist= $verifpseudo->rowCount();
                if($pseudoexist==0){
                    // on vérifie que le mdp et sa vérif° sont identiques
                    if($mdp1==$mdp2){                
                        $insertuser=$bdd->prepare("INSERT INTO Utilisateur(email,pseudo,mdp,statut_util) VALUES (?,?,?,?);");
                        try{
                            // insertion dans la bdd
                            $insertuser->execute(array($email, $pseudo, $mdp1 ,"contributeur")); //ici c'est que pour le contributeur
                            // redirection vers la page d'accueil
                           // $recup_user=$bdd->prepare("SELECT * FROM utilisateur WHERE email=? ;");
                            
                                //$recup_user->execute(array($email));
                                //$userinfo = $recup_user->fetch();
                            $_SESSION['email'] = $email;
                            $_SESSION['Pseudo'] = $pseudo;
                            $_SESSION['Mot de passe'] = $mdp1;
                            $_SESSION['Statut'] = "contributeur";
                            header("Location: Index.php");                                    
                        }
                        catch(Exception $e){
                                die('Erreur : '.$e->getMessage());
                        }
                    }   
                    else{
                        // les champs des mots de passe ne sont pas identiques
                        header('Location: Form_inscription.php?erreur=1');
                        exit();
                    }
                }
                else{
                    // le pseudo existe déjà
                    header('Location: Form_inscription.php?erreur=2');
                    exit();
                }
            }
            else{
                // l'adresse mail est déjà utilisée
                header('Location: Form_inscription.php?erreur=3');
                exit();
            }
        }
    }
?>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/> 
        <title>Inscription</title>
    </head>

    <body>
        <form method="post" name="inscription">
            <label> Mail : </label>
            <input type="text" name="email" maxLenght="40" placeholder="Votre adresse mail" required><br>
            <label> Pseudo : </label>
            <input type="text" name="pseudo" maxLenght="40" placeholder="Votre pseudo" required><br>
            <label> Mot de passe1 : </label>
            <input type="password" name="mdp1" maxLenght="40" placeholder="Votre mot de passe" required><br>
            <label> Mot de passe2 : </label>
            <input type="password" name="mdp2" maxLenght="40" placeholder="Votre mot de passe" required><br>

            <input type="submit" name="btinscription">
        </form>
    </body>
</html>

