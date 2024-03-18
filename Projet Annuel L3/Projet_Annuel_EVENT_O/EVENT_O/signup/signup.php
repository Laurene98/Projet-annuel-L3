<?php
/*
//Affichage des messages d'erreur liés au réseau
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
*/

    // Appel de la connexion à la base de données
    include("../connexion_bdd.php");

    //session_start(); // initialisation de la session
    include("../time_session.php");

    //// INSCRIPTION SUR LE SITE ////

    // Vérification de la soumission du formulaire
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        // Récupération des valeurs du formulaire
        $nom = $_POST['nom'];
        $prenom = $_POST['prenom'];
        $email = $_POST['email'];
        $pseudo = $_POST['pseudo'];
        $mot_de_passe = $_POST['password'];
        $confirm_mot_de_passe = $_POST['confirm-password'];


        // Vérification de la correspondance des mots de passe
        if ($mot_de_passe !== $confirm_mot_de_passe) {
            $message_erreur = "Les mots de passe ne correspondent pas.";
            header('Location: ../signup/signup.html');
            exit;
        } else {
            // Hachage du mot de passe
            $mot_de_passe_hache = password_hash($mot_de_passe, PASSWORD_DEFAULT);
        }
        
        // Préparation de la requête pour récupérer l'utilisateur correspondant à l'email et au mot de passe
        $stmt = $bdd->prepare("SELECT * FROM Utilisateur WHERE (Email = ? OR Pseudo = ?)");
        $stmt->execute([$email, $pseudo]);

        // Récupération de l'utilisateur s'il existe
        $utilisateur = $stmt->fetch(PDO::FETCH_ASSOC);
        var_dump($utilisateur);

        if ($utilisateur){
            $message_erreur = "L'utilisateur existe déjà. Veuillez saisir un autre email/mot de passe.";
            header('Location: ../signup/signup.html');
            exit;
        } else {
            try {
                //Inscription de l'utilisateur
                $stmt = $bdd->prepare("INSERT INTO Utilisateur (Nom, Prenom, Email, Pseudo, Mdp, identifie) VALUES (?, ?, ?, ?, ?, 1)");
                $stmt->execute([$nom, $prenom, $email, $pseudo, $mot_de_passe_hache]);

                // Récupérer l'ID de l'utilisateur inséré
                $idUtilisateur = $bdd->lastInsertId();
                echo $idUtilisateur;
                
                // Création d'un panier associé à l'utilisateur
                $stmt = $bdd->prepare("INSERT INTO Panier (valide, idUtilisateur) VALUES (0, ?)");
                $stmt->execute([$idUtilisateur]);

                
                $_SESSION['idUtilisateur'] = $idUtilisateur;
                
                // Redirection vers la page de connexion
                header('Location: ../main/main.php');
                exit;
            } 
            catch(PDOException $e) {
                echo "Erreur : " . $e->getMessage();
            }
        } 
    }
?>