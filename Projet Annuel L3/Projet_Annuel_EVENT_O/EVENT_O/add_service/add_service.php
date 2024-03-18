<?php
//Appel de la connexion à la BDD
include("../connexion_bdd.php");

//session_start(); // initialisation de la session
include("../time_session.php");

// Récupération des données du formulaire et vérifie si la méthode HTTP est bien POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $NomS = $_POST["NomS"];
    $NomC = $_POST["NomC"];
    $PrenomC = $_POST["PrenomC"];
    $EmailC = $_POST["EmailC"];
    $Capacite = $_POST["Capacite"];
    $CategorieS = $_POST["CategorieS"];
    $Localisation = $_POST["Localisation"];
    $Type_Transport = $_POST["Type_Transport"];
    $Gastronomie = $_POST["Gastronomie"];
    $Regime = $_POST["Regime"];
    $Parking = $_POST["Parking"];

    try {
        $stmt = $bdd->prepare("INSERT INTO Service (NomS, NomC, PrenomC, EmailC, Capacite, CategorieS, Localisation, Type_Transport, Gastronomie, Regime, Parking) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->execute([$NomS, $NomC, $PrenomC, $EmailC, $Capacite, $CategorieS, $Localisation, $Type_Transport, $Gastronomie, $Regime, $Parking]);
    } catch(PDOException $e) {
        echo "Erreur : " . $e->getMessage();
    }// Capture les erreurs de la requêtre pour l'afficher
    }

    // Redirection vers la page ajout de service
    header('Location: ../add_service/add_service.html');
?>
