<!------------ Ajouter au panier (début) --------->
<?php
//Inclusion du fichier de connexion à la BDD
include("../connexion_bdd.php");

//session_start(); // initialisation de la session
include("../time_session.php");

$referer = $_SERVER['HTTP_REFERER'];

//error_reporting(E_ALL);
//ini_set('display_errors', 1);

if (isset($_POST["quantity"])) {

    if ($_SESSION['idUtilisateur']){
        // Récupération des données
        $idProduit = $_POST['idProduit'];
        $quantite = $_POST['quantity'];

        //Récupération de l'identifiant de l'utilisateur
        $idUtilisateur = $_SESSION['idUtilisateur'];

        //Récupération le panier de l'utilisateur
        $stmt = $bdd->prepare("SELECT * FROM Panier WHERE idUtilisateur = ? AND Valide = 0");
        $stmt->execute([$idUtilisateur]);
        $panier = $stmt->fetch(PDO::FETCH_ASSOC);

        //Récupère le produit du panier quand le produit est déjà dans le panier
        $stmt = $bdd->prepare("SELECT * FROM Choix WHERE idPanier = ? AND idProduit = ?");
        $stmt->execute([$panier['idPanier'], $idProduit]);
        $choix = $stmt->fetch(PDO::FETCH_ASSOC);

        // Récupère les articles du panier de l'utilisateur pour la limitation de quantité dans le panier
        $stmt = $bdd->prepare("SELECT * FROM Choix WHERE idPanier = ?");
        $stmt->execute([$panier['idPanier']]);
        $articles = $stmt->fetchAll(PDO::FETCH_ASSOC);

        //Calcul de la quantité d'articles dans le panier
        $nbArticles = 0;
        foreach ($articles as $article) {
            $nbArticles += $article['Quantite'];
    }

        if($choix) {
            // Récupération de la quantité précédente de l'article dans le panier
            $stmt = $bdd->prepare("SELECT * FROM Choix WHERE idPanier = ? AND idProduit = ?");
            $stmt->execute([$panier['idPanier'], $idProduit]);
            $qttPred = $stmt->fetch(PDO::FETCH_ASSOC);

            
            if ($nbArticles >= 150) {
                // Redirection vers le panier pour revoir le contenu de la commande car on ne peut pas ajouter plus de quantité
                header("Location: ../basket/basket.php");
                exit;
                // Si c'est un article déjà ajouté, on vérifie si la quantité ajouter dépasse la limite
                //En dépassant la limite, on ajuste automatiquement la quantité par rapport à la limite autorisé 
                } elseif (($nbArticles - $qttPred['Quantite']) + $quantite > 150) {
                // Mise a jour de la quantité pour atteindre 150 articles dans le panier
                $quantite = 150 - ($nbArticles - $qttPred['Quantite']);
            } 

            //Quand on ajoute le même article mais que sa quantité est déjà superieur à la limite de la quantite d'un article
            //On redirige vers le panier pour revoir les quantités
            if ($qttPred['Quantite'] >= 100) {
                // Redirection vers le panier
                header("Location: ../basket/basket.php");
                exit;

                //Si quantité ajouté avec la quantité précedente est supérieur à la limite de quantité d'article
                //On ajuste la quantité a ajouter jusqu'a la quantité pour atteindre la limite
                } elseif ($qttPred['Quantite'] + $quantite > 100) {
                // Mise a jour de la quantité pour atteindre une quantité de 100
                $quantite = 100 - $qttPred['Quantite'];
            }

            // Sinon, on ajoute la quantité dans le panier si le produit y est déjà présent sans les limites précédentes
            // Dans le bon panier et pour le bon produit
            $quantite = $quantite + $choix['Quantite'];
            $stmt = $bdd->prepare("UPDATE Choix SET Quantite = ? WHERE idPanier = ? AND idProduit = ?");
            $stmt->execute([$quantite, $panier['idPanier'], $idProduit]);
            } else {
                // Sinon, si l'article n'a jamais été ajouté
                // Si le panier est saturé, on se redirige vers le panier pour le gérer
                if ($nbArticles >= 150) {
                    // Redirection vers le panier
                    header("Location: ../basket/basket.php");
                    exit;
                    } else {
                        //Si on ajoute une quantité qui dépasse la limite du panier
                        //On ajuste la quantité à la limite du panier
                        if ($nbArticles + $quantite > 150) {
                            // Mise a jour de la quantité pour atteindre 150 articles dans le panier
                            $quantite = 150 - $nbArticles;
                        }
                    // Insersion du produit et sa quantité dans le panier sinon
                    $stmt = $bdd->prepare("INSERT INTO Choix (Quantite, idPanier, idProduit) VALUES (?, ?, ?)");
                    $stmt->execute([$quantite, $panier['idPanier'], $idProduit]);
                }
        }

        // Redirection vers la page précédente
        header("Location: $referer");
        exit;

        }

        // Redirection vers la page précédente
        header("Location: ../connexion/connexion.html");
        exit;
}   
?>
<!------------ Ajouter au panier (fin) --------->