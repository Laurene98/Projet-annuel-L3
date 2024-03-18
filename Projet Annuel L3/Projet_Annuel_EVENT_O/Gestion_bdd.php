<?php
//Variables nécessaires à la connexion
$USER = 'aboneham';
$PASSWORD = '!22207390!';
$DSN = 'mysql:host=localhost;dbname=aboneham;port=1521';
try{
//Création d’une instance PDO (représente la connexion à la BD)
$bdd = new PDO($DSN,$USER,$PASSWORD);
echo("Connexion à phpMyAdmin réussie ! :-)");
}
catch(PDOException $e){
echo("Echec de connexion : ".$e->getMessage());
}

//------------------------------ Requete SQL -------------------------------

/*echo ("<b> Mise en pratique 2 - Question 1 : </b></br>");
$SQL = "SELECT*FROM film WHERE idRealisateur = 5;";
$resultat = $bdd->query($SQL);
$ligne = $resultat->fetch(PDO::FETCH_ASSOC);
print_r($ligne);
echo('<br>'.$ligne['titre'].' - '.$ligne['anneeSortie']);
try{
	$resultat = $bdd->query($SQL);
	echo("Ajout du film effectué !");
}
catch(PDOExeption $e){
	echo("Echec de l'execution : ".$e->getMessage());
}


$SQL = "SELECT*FROM film WHERE idRealisateur = 5;";
$resultat = $bdd->query($SQL);
$liste = $resultat->fetchAll(PDO::FETCH_ASSOC);
foreach($liste as $ligne){
	echo('<br>'.$ligne['titre'].' - '.$ligne['anneeSortie']);
	}	
*/

$SQL = "SELECT * FROM film WHERE idRealisateur = (SELECT idRealisateur FROM realisateur WHERE nom = :nom AND prenom = :prenom);";
$requete = $bdd->prepare($SQL);
$monNom = 'Lucas';
$monPrenom = 'George';
try{
	$requete->execute(array('nom' => $monNom, ':prenom' => $monPrenom));
	echo("Execution realisee");
}
catch(PDOExeption $e){
	echo("Echec de l'execution : ".$e->getMessage());
}
?>

