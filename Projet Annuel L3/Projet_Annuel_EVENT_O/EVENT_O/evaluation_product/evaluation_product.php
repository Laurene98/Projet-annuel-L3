<?php

//Appel de la connexion à la BDD
include("../connexion_bdd.php");

//session_start(); // initialisation de la session
include("../time_session.php");

// Vérifier si l'identifiant du produit est défini dans l'URL
if (isset($_GET['idProduit'])) {
    // Récupérer l'identifiant du produit depuis l'URL
    $idProd = $_GET['idProduit'];
    $stmt = $bdd->prepare("SELECT * FROM Produit WHERE idProduit = ?");
    $stmt->execute([$idProd]);
    $produit = $stmt->fetch(PDO::FETCH_ASSOC);
} 
else {
    // Si l'identifiant du produit n'est pas défini dans l'URL, afficher un message d'erreur ou rediriger l'utilisateur vers une autre page
    $message_erreur = "Le produit n'existe pas";
    header('Location: ../main/main.php');
}
?>


<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="evaluation_product.css">
    <title>Evaluation d'un produit</title>
</head>
<body>
    <!----------------- entête haut de page ----------------->
    <iframe src="../header/header.html" width="100%" height="180vw" frameborder="0"></iframe>
    <!----------------- Page d'évaluation(début)----------------->
    <table class="top-page">
        <tr>
            <th class="back">
                <button onclick="history.back()">
                    <img src="../img/retour.png" alt="Retour" width="40vw">
                </button>
                <label for="back-txt">Retour</label>
            </th>
            <th class="title-page">
                <h1>Evaluation du produit</h1>
            </th>
            <th></th>
        </tr>
    </table>

    <form action="eval_prod_action.php" method="post">
    <input type="hidden" name="idProduit" value="<?=$produit['idProduit'];?>">
        <table class="container">
            <tr class="top-table">
                <th></th>
                <th>Evaluation</th>
                <th>Conformite</th>
                <th>Recommandation</th>
            </tr>     
            <tr class="cadre2">
                <th class="article">
                    <img src="..//img/img_prod/<?= $produit["idProduit"] ?>.jpg" width="80%" alt="Image du produit">
                    <h2><?=$produit['NomP'];?></h1>
                    <h3><?=$produit['Prix'];?>€</h2>           
                </th>
                <th>
                    <p>Donnez le nombre d'étoiles que vous souhaitez mettre à l'article</p>
                    <ul>
                        <li>
                            <input type="radio" name="note" value="5"> 
                            <img src="../img/5etoile.jpg" alt="5 etoiles" width="30%">
                        </li>
                        <li>
                            <input type="radio" name="note" value="4"> 
                            <img src="../img/4etoile.jpg" alt="4 etoiles" width="30%">
                        </li>
                        <li>
                            <input type="radio" name="note" value="3"> 
                            <img src="../img/3etoile.jpg" alt="3 etoiles" width="30%">
                        </li>
                        <li>
                            <input type="radio" name="note" value="2"> 
                            <img src="../img/2etoile.jpg" alt="2 etoiles" width="30%">
                        </li>
                        <li>
                            <input type="radio" name="note" value="1"> 
                            <img src="../img/1etoile.jpg" alt="1 etoile" width="30%">
                        </li>
                    </ul>
                </th>
                <th>
                    <p>L'article est-il conforme à sa description et/ou sa taille ?</p>
                    <input type="radio" name="conforme" value="1"> 
                    <label for="rep">Oui</label>
                    <input type="radio" name="conforme" value="0">
                    <label for="rep">Non</label>
                </th>
                <th>
                    <p>Recommandez-vous l'article ?</p>
                    <input type="radio" name="recommande" value="1"> 
                    <label for="rep">Oui</label>
                    <input type="radio" name="recommande" value="0">
                    <label for="rep">Non</label>
                </th>
            </tr>
        </table>
        
        <div class="review">
            <p class="top-table">Commentaire</p>
            <textarea id="commentaire" name="commentaire" maxlength="300"></textarea>
            <p class="top-table">Ajouter une image :</p>
            <input type="file">
        </div>
        <input type="submit" value="Poster l'évaluation">
    </form>  
      <!----------------- Page d'évaluation (fin)------------------->
</body>
</html>