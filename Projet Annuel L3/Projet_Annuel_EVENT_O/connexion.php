<?php

//C:\php\php.exe -S 127.0.0.1:8000 -t C:\Users\Projets\Dropbox\Projet_Annuel_EVENT_O\EVENT_O\

// Récupérer les variables de connexion
$host = 'localhost';
$dbname = 'aboneham';
$username = 'aboneham';
$password = '!22207390!';

$pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=uft8", $username, $password);


    header('Location: ../main/main.html');
    exit;


?>