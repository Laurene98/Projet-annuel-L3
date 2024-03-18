<?php
    //Inclusion du fichier de connexion à la BDD
    include("../connexion_bdd.php");

    $referer = $_SERVER['HTTP_REFERER'];

    // Définir le temps d'expiration de la session à 20 minutes
    $lifetime = 1200; // 20 minutes en secondes
    session_set_cookie_params($lifetime);

    // Démarrer la session
    session_start();

    // Définir la variable de dernière activité de l'utilisateur
    if (isset($_SESSION['LAST_ACTIVITY']) && (time() - $_SESSION['LAST_ACTIVITY'] > $lifetime)) {
        // Si la dernière activité de l'utilisateur remonte à plus de 20 minutes, déconnecter l'utilisateur
        session_unset();     
        session_destroy();   
        header("Location: $referer");
        exit();
    }
    $_SESSION['LAST_ACTIVITY'] = time(); // Mettre à jour la dernière activité de l'utilisateur
?>