<?php
	//Variables nécessaires à la connexion
	$USER='adminM2';
	$PASSWORD='!Promo-2023!!';
	$DSN='mysql:host=localhost;dbname=TP_6_4_2;port=1521';
	
	try{
		 $bdd = new PDO($DSN,$USER,$PASSWORD);
		echo("Connexion à phpMyAdmin réussie ! :-)");
	}
	catch(PDOException $e){
		echo("Echec de connexion : ".$e->getMessage());
	}

	##################################################################

	echo("<br><br>");
	echo("<b>Mise en pratique 3 - Question 2 : </b>");
	
	if (isset($_POST["film"])){

		$titreFilm = $_POST["film"];

		$SQL="SELECT * FROM film WHERE titre LIKE \"$titreFilm\";";

		try{
	        $resultat= $bdd->query($SQL);
	        echo("<br>");
			echo("Exécution réussie ! : ");
		}
		catch(PDOException $e){
			echo("Echec d'exécution : ".$e->getMessage());
		}

		$liste = $resultat->fetchAll(PDO::FETCH_ASSOC); 

		foreach($liste as $ligne){
			echo('<br>'.$ligne['titre'].' - '.$ligne['anneeSortie'].' - '.$ligne['idGenre'].' - '.$ligne['idRealisateur']); 
		}

	}else{
		echo('Aucun film correspondant :-('); 
	}
	
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Ma page</title>
</head>
<body>
	<br><br>
	<b>Film à afficher : </b>
	<form method="POST" action="">
	    <!-- required : permet de rendre le champ obligatoire à la saisie -->
		<input type="text" name="film" required="required">
		<br>
		<!-- input type submit va permettre de valider le formulaire et de lancer l’action--> 
		<input type="submit" name="Valider" value="OK"/>
	</form>

</body>
</html>