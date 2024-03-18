<?php

// Appel de la connexion à la base de données
include("../connexion_bdd.php");

//session_start(); // initialisation de la session
include("../time_session.php");

//error_reporting(E_ALL);
//ini_set('display_errors', 1);

// Vérification de la soumission du formulaire
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    //Récupération de l'identifiant de l'utilisateur
    $idUtilisateur = $_SESSION['idUtilisateur'];

    //Récupération le panier de l'utilisateur
    $stmt = $bdd->prepare("SELECT * FROM Panier WHERE idUtilisateur = ? AND Valide = 0");
    $stmt->execute([$idUtilisateur]);
    $panier = $stmt->fetch(PDO::FETCH_ASSOC);

    // Supression de tout les choix de produits dans le panier 
    $stmt = $bdd->prepare("DELETE FROM Choix WHERE idPanier = ?");
    $stmt->execute([$panier['idPanier']]);

    // Redirection vers la page de gestion des suggestions
    header("Location: ./basket.php");
    exit;
}

?>