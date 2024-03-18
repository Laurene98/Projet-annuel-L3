<?php
//Appel de la connexion à la BDD
include("../connexion_bdd.php");

//session_start(); // initialisation de la session
include("../time_session.php");

// Récupération des données du formulaire et vérifie si la méthode HTTP est bien POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $NomP = $_POST["NomP"];
    $Prix = $_POST["Prix"];
    $Couleur = $_POST["Couleur"];
    $Themes = $_POST["Theme"]; // Construction d'un tableau pour récupérer les différents valeurs de Theme
    $Categorie = $_POST["Categorie"];
    $Motif = $_POST["Motif"];
    $Taille = $_POST["Taille"];

    // Boucle pour exécuter la requête SQL pour chaque thème sélectionné
    foreach ($Themes as $Theme) {
        try {
            $stmt = $bdd->prepare("INSERT INTO Produit (NomP, Prix, Couleur, Theme, Categorie, Motif, Taille) VALUES (?, ?, ?, ?, ?, ?, ?)");
            $stmt->execute([$NomP, $Prix, $Couleur, $Theme, $Categorie, $Motif, $Taille]);
            if (isset($_FILES['image']) && $_FILES['image']['error'] == UPLOAD_ERR_OK) {
                $stmt = $bdd->prepare("SELECT * FROM Produit WHERE NomP = ? AND Prix = ? AND Couleur = ? AND Theme = ? AND Categorie = ? AND Motif = ? AND Taille = ?");
                $stmt->execute([$NomP, $Prix, $Couleur, $Theme, $Categorie, $Motif, $Taille]);
                $deco = $stmt->fetch(PDO::FETCH_ASSOC);
                $extension = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
                // Vérifie si l'extension est valide
                if ($extension == 'jpg' || $extension == 'jpeg' || $extension == 'png') {
                    $destination = "../img/img_prod/" . $deco['idProduit'] . "." . $extension;
                    move_uploaded_file($_FILES['image']['tmp_name'], $destination);
                }
            }
        } catch(PDOException $e) { 
            echo "Erreur : " . $e->getMessage();
        } // Capture les erreurs de la requêtre pour l'afficher
    }

    // Redirection vers la page ajout de produit
    header('Location: ../add_prod/add_prod.html');
}
?>

