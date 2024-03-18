<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8">
    <title>Proposition de candidature</title>
    <link rel="stylesheet" type="text/css" href="candidature_admin.css"/>
  </head>
  <body>
    <!-------------------- entête haut de page ----------------------->
    <iframe src="../header/header.html" width="100%" height="180vw" frameborder="0"></iframe>
     
    <!------------ Proposition de candidature (début) --------->  
    <h1>Proposition de candidature</h1>
    <?php
    //Inclusion du fichier de connexion à la BDD
    include("../connexion_bdd.php");
    
	//session_start(); // initialisation de la session
	include("../time_session.php");

    // Requête SQL pour récupérer les données de la table Service
    $sql = "SELECT * FROM Service WHERE Candidature = 0";
    
    // Exécuter la requête SQL
    $stmt = $bdd->query($sql);
    ?>
    <!-- Afficher les résultats dans un tableau HTML -->
	<table>
		<tr>
			<th>N° Service</th>
			<th>Nom du service</th>
			<th>Nom du contact</th>
			<th>Prénom du contact</th>
			<th>Email</th>
			<th>Catégorie du service</th>
			<th>Type de transport</th>
			<th>Capacité</th>
			<th>Localisation</th>
			<th>Parking</th>
			<th>Gastronomie</th>
			<th>Regime</th>
			<th>Candidature</th>
			<th>Accepter</th>
			<th>Supprimer</th>
		</tr>
		<?php foreach ($stmt as $row) : ?>
			<tr>
				<td><?= $row["idService"] ?></td>
				<td><?= $row["NomS"] ?></td>
				<td><?= $row["NomC"] ?></td>
				<td><?= $row["PrenomC"] ?></td>
				<td><?= $row["EmailC"] ?></td>
				<td><?= $row["CategorieS"] ?></td>
				<td><?= $row["Type_Transport"] ?></td>
				<td><?= $row["Capacite"] ?></td>
				<td><?= $row["Localisation"] ?></td>

				<td><?php
    				if ($row["Parking"] == 0) { 
        				echo "Non"; 
    				}
					if ($row["Parking"] == 1) {
						echo "Oui";
					} 
    			?></td>

				<td><?= $row["Gastronomie"] ?></td>
				<td><?= $row["Regime"] ?></td>
				<td><?= $row["Candidature"] ?></td>
				<td>
					<form method="post" action="../candidature_admin/valid_candidature_admin.php">
						<input type="hidden" name="idService" value="<?php echo $row['idService']; ?>">
    					<button type="submit" name="valid" id="mon-bouton">
							<img src="../img/valider.png" alt="Valider la candidature">
						</button>
					</form>
				</td>
				<td>
					<form method="post" action="../candidature_admin/valid_candidature_admin.php">
						<input type="hidden" name="idService" value="<?php echo $row['idService']; ?>">
    					<button type="submit" name="non_valid" id="mon-bouton">
							<img src="../img/croix.png" alt="Supprimer la candidature">
						</button>
					</form>
				</td>
			</tr>
		<?php endforeach; ?>
	  </table>
    <!---------- Proposition de candidature (fin) ---------> 
  </body>
</html>
