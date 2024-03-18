<?php
//Appel de la connexion à la BDD
include("../connexion_bdd.php");

//session_start(); // initialisation de la session
include("../time_session.php");

// Récupération des données du formulaire
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $NomP = $_POST["NomP"];
    $Prix = $_POST["Prix"];
    $Couleur = $_POST["Couleur"];
    $Themes = $_POST["Theme"];
    $Categorie = $_POST["Categorie"];
    $Motif = $_POST["Motif"];
    $Taille = $_POST["Taille"];

    // Boucle pour exécuter la requête SQL pour chaque thème sélectionné
    foreach ($Themes as $Theme) {
        try {
            $stmt = $bdd->prepare("INSERT INTO Produit (NomP, Prix, Couleur, Theme, Categorie, Motif, Taille) VALUES (?, ?, ?, ?, ?, ?, ?)");
            $stmt->execute([$NomP, $Prix, $Couleur, $Theme, $Categorie, $Motif, $Taille]);
        } catch(PDOException $e) {
            echo "Erreur : " . $e->getMessage();
        }
    }
    // Redirection vers la page de connexion
    header('Location: ../add_prod/add_prod.html');
}
?>

