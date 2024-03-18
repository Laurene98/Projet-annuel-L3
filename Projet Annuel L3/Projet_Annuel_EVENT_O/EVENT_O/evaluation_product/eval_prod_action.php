<?php

// Appel de la connexion à la base de données
include("../connexion_bdd.php");

//session_start(); // initialisation de la session
include("../time_session.php");

error_reporting(E_ALL);
ini_set('display_errors', 1);

// Vérification de la soumission du formulaire
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Récupération des données
    $idProduit = $_POST['idProduit'];
    $note = $_POST['note'];
    $conforme = $_POST['conforme'];
    $recommande = $_POST['recommande'];
    $commentaire = $_POST['commentaire'];

    // Récupération de l'identifiant de l'utilisateur
    $idUtilisateur = $_SESSION['idUtilisateur'];

    // Notation
    if ($note) {
        // Préparation de la requete pour chercher si une note à déjà été donnée
        $stmt = $bdd->prepare("SELECT * FROM Note WHERE idProduit = ? AND idUtilisateur = ?");
        $stmt->execute([$idProduit, $idUtilisateur]);
        $stmtnote = $stmt->fetch(PDO::FETCH_ASSOC);
        if($stmtnote) {
            // Mise à jour la note si elle est déjà présente
            $stmt = $bdd->prepare("UPDATE Note SET Note = ? WHERE idProduit = ? AND idUtilisateur = ?");
            $stmt->execute([$note, $idProduit, $idUtilisateur]);
        } else {
            // Ajoute la note au produit
            $stmt = $bdd->prepare("INSERT INTO Note (Note, idProduit, idUtilisateur) VALUES (?, ?, ?)");
            $stmt->execute([$note, $idProduit, $idUtilisateur]);
        }
    }

    // Conformite
    if ($conforme == 0 or $conforme == 1) {
        // Préparation de la requete pour chercher si un avis sur la conformité à déjà été donné
        $stmt = $bdd->prepare("SELECT * FROM Conformite WHERE idProduit = ? AND idUtilisateur = ?");
        $stmt->execute([$idProduit, $idUtilisateur]);
        $stmtconforme = $stmt->fetch(PDO::FETCH_ASSOC);
        if($stmtconforme) {
            // Met à jour la conformité du produit
            $stmt = $bdd->prepare("UPDATE Conformite SET Conforme = ? WHERE idProduit = ? AND idUtilisateur = ?");
            $stmt->execute([$conforme, $idProduit, $idUtilisateur]);
        } else {
            // Ajoute l'avis sur la conformité du produit
            $stmt = $bdd->prepare("INSERT INTO Conformite (Conforme, idProduit, idUtilisateur) VALUES (?, ?, ?)");
            $stmt->execute([$conforme, $idProduit, $idUtilisateur]);
        }
    }

    // Recommandation
    if ($recommande == 0 or $recommande == 1) {
        // Préparation de la requete pour chercher si un avis sur la recommmandation à déjà été donné
        $stmt = $bdd->prepare("SELECT * FROM Recommandation WHERE idProduit = ? AND idUtilisateur = ?");
        $stmt->execute([$idProduit, $idUtilisateur]);
        $stmtrecommande = $stmt->fetch(PDO::FETCH_ASSOC);
        if($stmtrecommande) {
            // Met à jour la recommandation du produit
            $stmt = $bdd->prepare("UPDATE Recommandation SET Recommande = ? WHERE idProduit = ? AND idUtilisateur = ?");
            $stmt->execute([$recommande, $idProduit, $idUtilisateur]);
        } else {
            // Ajoute l'avis sur la recommandation du produit
            $stmt = $bdd->prepare("INSERT INTO Recommandation (Recommande, idProduit, idUtilisateur) VALUES (?, ?, ?)");
            $stmt->execute([$recommande, $idProduit, $idUtilisateur]);
        }
    }

    // Commentaire
    if ($commentaire) {
        // Préparation de la requete pour chercher si un avis sur le commentaire à déjà été donné
        $stmt = $bdd->prepare("SELECT * FROM Commentaire WHERE idProduit = ? AND idUtilisateur = ?");
        $stmt->execute([$idProduit, $idUtilisateur]);
        $stmtcommentaire = $stmt->fetch(PDO::FETCH_ASSOC);
        if($stmtcommentaire) {
            // Met à jour le commentaire du produit
            $stmt = $bdd->prepare("UPDATE Commentaire SET Commentaire = ? WHERE idProduit = ? AND idUtilisateur = ?");
            $stmt->execute([$commentaire, $idProduit, $idUtilisateur]);
        } else {
            // Ajoute l'avis sur la commentaire du produit
            $stmt = $bdd->prepare("INSERT INTO Commentaire (Commentaire, idProduit, idUtilisateur) VALUES (?, ?, ?)");
            $stmt->execute([$commentaire, $idProduit, $idUtilisateur]);
        }
    }
    
    // Redirection vers la page de gestion des suggestions
    header("Location: ../product(fiche)/product.php?idProduit=$idProduit");
    exit;
}

?>