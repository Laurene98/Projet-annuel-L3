<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8">
    <title>Suggestion du moment</title>
    <link rel="stylesheet" type="text/css" href="suggestion_admin.css"/>
  </head>
  <body>
    <!-------------------- entête haut de page ----------------------->
    <iframe src="../header/header.html" width="100%" height="180vw" frameborder="0"></iframe>
     
    <!------------ Suggérer (début) --------->  
    <h1>Suggérer des produits ou services</h1>
    <?php
    	//Inclusion du fichier de connexion à la BDD
		include("../connexion_bdd.php");
		
		//session_start(); // initialisation de la session
		include("../time_session.php");
		
		// Requête SQL pour récupérer les données de la table Produit
		$sql = "SELECT * FROM Produit";
		
		// Exécuter la requête SQL
		$stmt = $bdd->query($sql);
    ?>
    <!-- Afficher les résultats dans un tableau HTML -->
	  <table>
		<tr>
			<th>N° Produit</th>
			<th>Nom</th>
			<th>Catégorie</th>
			<th>Thème</th>
			<th>Motif</th>
			<th>Couleur</th>
			<th>Taille</th>
			<th>Prix (€)</th>
			<th>Suggestion</th>
			<th>Suggérer</th>
			<th>Dé-suggérer</th>
		</tr>
		<?php foreach ($stmt as $row) : ?>
			<tr>
				<td><?= $row["idProduit"] ?></td>
				<td><?= $row["NomP"] ?></td>
				<td><?= $row["Categorie"] ?></td>
				<td><?= $row["Theme"] ?></td>
				<td><?= $row["Motif"] ?></td>
				<td><?= $row["Couleur"] ?></td>
				<td><?= $row["Taille"] ?></td>
				<td><?= $row["Prix"] ?></td>
				<td><?= $row["Suggestion"] ?></td>
				<td>
					<form method="post" action="../suggestion_admin/valid_suggestion.php">
					<input type="hidden" name="idProduit" value="<?php echo $row['idProduit']; ?>">
    					<button type="submit" name="valid" id="mon-bouton">
							<img src="../img/valider.png" alt="Valider la suggestion">
						</button>
					</form>
				</td>
				<td>
					<form method="post" action="../suggestion_admin/valid_suggestion.php">
						<input type="hidden" name="idProduit" value="<?php echo $row['idProduit']; ?>">
    					<button type="submit" name="non_valid" id="mon-bouton">
							<img src="../img/croix.png" alt="Enlever la suggestion">
						</button>
					</form>
				</td>
			</tr>
		<?php endforeach; ?>
	  </table>
    <!---------- Suggérer (fin) --------->

  </body>
</html>
