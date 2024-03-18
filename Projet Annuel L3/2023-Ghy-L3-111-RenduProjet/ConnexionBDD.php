
<?php

// permet la connexion à la base de données, à utiliser dans les autres pages avec include

    $host = 'localhost';
    $dbname = 'mlefevre';
    $username = 'mlefevre';
    $password = '!22202620!';

    try {
        $bdd = new PDO("mysql:host=$host; dbname=$dbname; charset=utf8", $username, $password);
        //echo "Connecté a $dbname sur $host avec succès.";
    }
    catch (PDOException $e) {
        die ("Impossible de se connecter à la base de données $dbname : " .$e->getMessage());
    }

?>