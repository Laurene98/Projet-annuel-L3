<?php

//Appel de la connexion à la BDD
include("../connexion_bdd.php");

//session_start(); // initialisation de la session
include("../time_session.php");

//// CONNEXION SUR LE SITE ////

// Vérification de la soumission du formulaire
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Récupération des valeurs du formulaire
    $pseudoemail = $_POST['pseudo-email'];
    $mot_de_passe = $_POST['password'];

    // Préparation de la requête pour récupérer l'utilisateur correspondant à l'email et au mot de passe
    $stmt = $bdd->prepare("SELECT * FROM Utilisateur WHERE (Email = ? OR Pseudo = ?)");
    $stmt->execute([$pseudoemail, $pseudoemail]);

    // Récupération de l'utilisateur s'il existe
    $utilisateur = $stmt->fetch(PDO::FETCH_ASSOC);
    var_dump($utilisateur);

    // Vérification de l'existence de l'utilisateur et de son mot de passe
    // Utilisateur d'abord vérifié puis la comparaison des mdp saisie et enregistrer
    if ($utilisateur && password_verify($mot_de_passe, $utilisateur['Mdp'])) {
        // Récupération des variables de connexion
        $_SESSION['idUtilisateur'] = $utilisateur['idUtilisateur'];

        // Authentification réussie, redirection vers la page d'accueil
        header('Location: ../main/main.php');
        exit;
    } else {
        // Erreur d'authentification, affichage d'un message d'erreur
        $message_erreur = "Adresse email/pseudo ou mot de passe incorrect.";
        header('Location: ../connexion/connexion.html');
        exit;
    }
}


/*
    if (!$stmt) {
        echo "\nPDO::errorInfo():\n";
        print_r($bdd->errorInfo());
        exit;
    }
    print_r($utilisateur);


    //Affichage des messages d'erreur liés au réseau et aux requêtes SQL
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);

    //Autres instructions de code ...

    //Affichage des messages d'erreur
    if (!empty($message_erreur)) {
        echo "<div class='alert alert-danger'>$message_erreur</div>";
    }

    if (!empty($message_succes)) {
        echo "<div class='alert alert-success'>$message_succes</div>";
    }
    */

?>