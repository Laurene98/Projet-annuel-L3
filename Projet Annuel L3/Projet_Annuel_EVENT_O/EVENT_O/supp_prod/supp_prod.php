<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8">
    <title>Supprimer un Produit</title>
    <link rel="stylesheet" type="text/css" href="supp_prod.css"/>
  </head>
  <body>
    <!-------------------- entête haut de page ----------------------->
    <iframe src="../header/header.html" width="100%" height="180vw" frameborder="0"></iframe>
     
    <!------------ Affichage des produits pour suppression (début) --------->  
    <h1>Suppression</h1>
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
    <!-- Afficher les résultats-->
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
			<th>Supprimer</th>
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
				<td>
					<form method="post" action="../supp_prod/lien_supp.php">
    					<input type="hidden" name="idProduit" value="<?php echo $row['idProduit']; ?>">
    					<button type="submit" name="delete" id="mon-bouton">
							<img src="../img/poubelle.png" alt="Corbeille">
						</button>
					</form>
				</td>
			</tr>
		<?php endforeach; ?>
	  </table>
    <!---------- Affichage des produits pour suppression (fin) --------->
  </body>
</html>
