<?php

// Appel de la connexion à la base de données
include("../connexion_bdd.php");

//session_start(); // initialisation de la session
include("../time_session.php");

// Pour retrouver les erreurs et les afficher
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Vérification de la soumission du formulaire
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Récupération des données, convertit en entier
    $idProduit = intval($_POST['idProduit']);
    $quantite = intval($_POST['quantity']);

    // Récupération de l'identifiant de l'utilisateur
    $idUtilisateur = $_SESSION['idUtilisateur'];

    // Récupération le panier de l'utilisateur
    $stmt = $bdd->prepare("SELECT * FROM Panier WHERE idUtilisateur = ? AND Valide = 0");
    $stmt->execute([$idUtilisateur]);
    $panier = $stmt->fetch(PDO::FETCH_ASSOC);

    // Récupère les articles du panier de l'utilisateur
    $stmt = $bdd->prepare("SELECT * FROM Choix WHERE idPanier = ?");
    $stmt->execute([$panier['idPanier']]);
    $articles = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Initialisation du compte pour compter le nombre d'article du panier
    $nbArticles = 0;
    // Calcul pour savoir la quantité d'éléments dans le panier
    foreach ($articles as $article) {
        $nbArticles += $article['Quantite'];
    }

    //Mise en place de la limitation de quantité

    // Récupération de la quantité précédente de l'article avant la modification
    $stmt = $bdd->prepare("SELECT * FROM Choix WHERE idPanier = ? AND idProduit = ?");
    $stmt->execute([$panier['idPanier'], $idProduit]);
    $qttPred = $stmt->fetch(PDO::FETCH_ASSOC);

    // Vérification si le changement de quantité va dépasser la limite par rapport au total précédent
    if (($nbArticles - $qttPred['Quantite']) + $quantite > 150) {
        // Mise a jour de la quantité pour atteindre 150 articles dans le panier
        $quantite = 150 - ($nbArticles - $qttPred['Quantite']);
    }

    // Ajout de la quantité (modification) dans le panier si le produit y est déjà présent
    $stmt = $bdd->prepare("UPDATE Choix SET Quantite = ? WHERE idPanier = ? AND idProduit = ?");
    $stmt->execute([$quantite, $panier['idPanier'], $idProduit]);

    // Redirection vers la page de gestion des suggestions
    header("Location: ./basket.php");
    exit;
}

?>