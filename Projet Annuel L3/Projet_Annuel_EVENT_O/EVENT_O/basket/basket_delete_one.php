<?php

// Appel de la connexion à la base de données
include("../connexion_bdd.php");

//session_start(); // initialisation de la session
include("../time_session.php");

// Vérification de la soumission du formulaire
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Récupération des données du produit
    $idProduit = $_POST['idProduit'];

    //Récupération de l'identifiant de l'utilisateur
    $idUtilisateur = $_SESSION['idUtilisateur'];

    //Récupération le panier de l'utilisateur
    $stmt = $bdd->prepare("SELECT * FROM Panier WHERE idUtilisateur = ? AND Valide = 0");
    $stmt->execute([$idUtilisateur]);
    $panier = $stmt->fetch(PDO::FETCH_ASSOC);

    // Suppression du produit récupéré dans le panier de l'utilisateur
    $stmt = $bdd->prepare("DELETE FROM Choix WHERE idPanier = ? AND idProduit = ?");
    $stmt->execute([$panier['idPanier'], $idProduit]);

    // Redirection vers la page de gestion des suggestions
    header("Location: ./basket.php");
    exit;
}

?>