<?php
// Variables nécessaires à la connexion à la BDD
$USER = 'aboneham';
$PASSWORD = '!22207390!';
$DSN = 'mysql:host=localhost;dbname=aboneham;port=3306';

// Connexion à la base de données avec PDO
try {
    $bdd = new PDO($DSN, $USER, $PASSWORD);
} catch(PDOException $e) {
    echo("Echec de connexion : " . $e->getMessage());
}
?>
