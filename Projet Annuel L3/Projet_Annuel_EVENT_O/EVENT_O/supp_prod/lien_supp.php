<!------------ Suppresion de produit avec l'icone poubelle (début) --------->  
<?php
    //Inclusion du fichier de connexion à la BDD
    include("../connexion_bdd.php");

    //session_start(); // initialisation de la session
    include("../time_session.php");

    if (isset($_POST["delete"])) {
        // Récupération de l'idProduit
        $idProduit = $_POST['idProduit'];
        
        // Requête SQL pour supprimer le produit selectionné
        $sql = "DELETE FROM Produit WHERE idProduit = :idProduit";
        
        // Préparer la requête SQL
        $stmt = $bdd->prepare($sql);
        
        // Relier les paramètres
        $stmt->bindParam(':idProduit', $idProduit);
        
        // Exécuter la requête SQL
        $stmt->execute();

        // Redirection vers la page de connexion
        header('Location: ../supp_prod/supp_prod.php');
        exit;
    }
?>
<!------------ Suppresion de produit avec l'icone poubelle (fin) --------->
