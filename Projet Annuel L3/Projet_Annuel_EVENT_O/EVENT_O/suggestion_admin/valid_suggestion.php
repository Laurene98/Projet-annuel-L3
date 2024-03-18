<!------------ Valider et enlever la suggestion (début) --------->
<?php
    //Inclusion du fichier de connexion à la BDD
    include("../connexion_bdd.php");

    //session_start(); // initialisation de la session
    include("../time_session.php");

    if (isset($_POST["valid"])) {
        // Récupération de l'idProduit
        $idProduit = $_POST['idProduit'];
        
        // Requête SQL pour suggérer
        $sql = "UPDATE Produit SET Suggestion = 1 WHERE idProduit = :idProduit";
        
        // Préparer la requête SQL
        $stmt = $bdd->prepare($sql);
        
        // Relier les paramètres
        $stmt->bindParam(':idProduit', $idProduit);
        
        // Exécuter la requête SQL
        $stmt->execute();

        // Redirection vers la page de gestion des suggestions
        header('Location: ../suggestion_admin/suggestion_admin.php');
        exit;
    }

    if (isset($_POST["non_valid"])) {
        // Récupération de l'idProduit
        $idProduit = $_POST['idProduit'];
        
        // Requête SQL pour enlever la suggestion
        $sql = "UPDATE Produit SET Suggestion = 0 WHERE idProduit = :idProduit";
        
        // Préparer la requête SQL
        $stmt = $bdd->prepare($sql);
        
        // Relier les paramètres
        $stmt->bindParam(':idProduit', $idProduit);
        
        // Exécuter la requête SQL
        $stmt->execute();

        // Redirection vers la page de gestion des suggestions
        header('Location: ../suggestion_admin/suggestion_admin.php');
        exit;
    }
?>
<!------------ Valider et enlever la suggestion (fin) --------->
