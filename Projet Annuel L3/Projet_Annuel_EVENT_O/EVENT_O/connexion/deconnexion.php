<?php
//Inclusion du fichier de connexion à la BDD
include("../connexion_bdd.php");

session_start(); // On démarre la session

$referer = $_SERVER['HTTP_REFERER'];

session_destroy(); // Deconnexion

// Redirection vers la page de gestion des suggestions
header("Location: connexion.html");
exit;
?>