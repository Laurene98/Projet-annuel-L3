<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8">
    <title>Résultats de recherche</title>
    <link rel="stylesheet" type="text/css" href="../main/main.css"/>
  </head>
  <body>
    <!-------------------- entête haut de page ----------------------->
    <iframe src="../header/header.html" width="100%" height="180vw" frameborder="0"></iframe>
     
    <!------------ Préparation requete Bare de recherche (début) --------->  
    <?php
    //Inclusion du fichier de connexion à la BDD
    include("../connexion_bdd.php");

    // Vérification si le formulaire a été soumis
    if (isset($_GET['q'])) {
      // Nettoyage de la chaîne de caractères saisie (début- fin des espaces) dans le formulaire
      $search = trim($_GET['q']);
    
      // Requête SQL pour récupérer les éléments correspondant aux mots-clés saisis
      $sql = "SELECT * FROM Produit WHERE NomP LIKE :search OR Couleur LIKE :search OR Theme LIKE :search
              OR Categorie LIKE :search OR Motif LIKE :search";
      $stmt = $bdd->prepare($sql);
      $stmt->execute(['search' => '%'.$search.'%']);
    
      $sqls = "SELECT * FROM Service WHERE NomS LIKE :search OR CategorieS LIKE :search
            OR Type_Transport LIKE :search OR Localisation LIKE :search
            OR Gastronomie LIKE :search OR Regime LIKE :search";
      $stmts = $bdd->prepare($sqls);
      $stmts->execute(['search' => '%'.$search.'%']);
    
      // Affichage des résultats
      $resultats = $stmt->fetchAll(PDO::FETCH_ASSOC);
      $resultatss = $stmts->fetchAll(PDO::FETCH_ASSOC);
    }
    ?>
    <!---------- Préparation requete Bare de recherche (fin) --------->
    <!---------- Affichage Bare de recherche (début) --------->
    <?php if (count($resultats) + count($resultatss) > 0) ?>
      <div class="tout">     
        <?php foreach ($resultats as $resultat) : ?>
          <form action="../product(fiche)/product.php" method="GET">
            <input type="hidden" name="idProduit" value="<?php echo $resultat['idProduit']; ?>">
            <div class="ajuster">
              <p>
              <button type="submit" name="submit">
              <img src="..//img/img_prod/<?= $resultat["idProduit"] ?>.jpg" width="80" height="80" alt="Image du produit">
              </button>
              <br>
              <?php echo $resultat["NomP"] ?> <br>
              <?= $resultat["Prix"] ?> €</p> <br>
            </div>
          </form>
        <?php endforeach; ?>      
        <?php foreach ($resultatss as $resultat) : ?>
          <form action="../service(fiche)/service.php" method="GET">
            <input type="hidden" name="idService" value="<?php echo $resultat['idService']; ?>">
              <div class="ajustement">
              <p>
                <button type="submit" name="submit">
                  <img src="../img/testballon.jpg" width="80" height="80" alt="Ballon NB">
                </button>
                <br>
                <?php echo $resultat["NomS"] ?> <br> 
                <?php echo $resultat["NomC"] . ' ' . $resultat["PrenomC"] ?> <br>
                <?php echo $resultat["CategorieS"] ?> </p>
              </div>
          </form>      
        <?php endforeach; ?>   
      </div>
        <?php if (count($resultats) + count($resultatss) < 1) {
          echo "Aucun résultat trouvé pour \"" . $search . "\".";
      }
    ?>
    <!---------- Affichage Bare de recherche (fin) --------->
  </body>
</html>
