<!------------ Suggestion Service (début) --------->
<?php
    //Inclusion du fichier de connexion à la BDD
    include("../connexion_bdd.php");

    //session_start(); // initialisation de la session
    include("../time_session.php");

    if (isset($_POST["valid"])) {
        // Récupération de l'idService
        $idService= $_POST['idService'];
        
        // Requête SQL pour suggérer le service
        $sql = "UPDATE Service SET Suggestion = 1 WHERE idService = :idService";
        
        // Préparer la requête SQL
        $stmt = $bdd->prepare($sql);
        
        // Relier les valeurs
        $stmt->bindParam(':idService', $idService);
        
        // Exécuter la requête SQL
        $stmt->execute();

        // Redirection vers la page de gestion des suggestions
        header('Location: ../professionnel_admin/professionnel_admin.php');
        exit;
    }

    if (isset($_POST["non_valid"])) {
        // Récupération de l'idService
        $idService = $_POST['idService'];
        
        // Requête SQL pour enlever la suggestion du service
        $sql = "UPDATE Service SET Suggestion = 0 WHERE idService = :idService";
        
        // Préparer la requête SQL
        $stmt = $bdd->prepare($sql);
        
        // Relier les valeurs
        $stmt->bindParam(':idService', $idService);
        
        // Exécuter la requête SQL
        $stmt->execute();

        // Redirection vers la page de gestion des suggestions
        header('Location: ../professionnel_admin/professionnel_admin.php');
        exit;
    }
?>
<!------------ Suggestion Service  (fin) --------->