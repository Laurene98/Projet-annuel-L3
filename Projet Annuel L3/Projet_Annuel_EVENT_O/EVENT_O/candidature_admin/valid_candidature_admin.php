<!------------ Gestion candidature Service (début) --------->
<?php
//Inclusion du fichier de connexion à la BDD
include("../connexion_bdd.php");

//session_start(); // initialisation de la session
include("../time_session.php");

if (isset($_POST["valid"])) {
    // Récupération de l'idService
    $idService= $_POST['idService'];
    
    // Requête SQL pour mettre à jour l'état de la candidature
    $sql = "UPDATE Service SET Candidature = 1 WHERE idService = :idService";
    
    // Préparer la requête SQL
    $stmt = $bdd->prepare($sql);
    
    // Relier les paramètre et variable
    $stmt->bindParam(':idService', $idService);
    
    // Exécuter la requête SQL
    $stmt->execute();

    // Redirection vers la page de gestion des suggestions
    header('Location: ../candidature_admin/candidature_admin.php');
    exit;
}

if (isset($_POST["non_valid"])) {
    // Récupération de l'idService
    $idService = $_POST['idService'];
    
    // Requête SQL pour supprimer la candidature
    $sql = "DELETE FROM Service WHERE idService = :idService";
    
    // Préparer la requête SQL
    $stmt = $bdd->prepare($sql);
    
    // Relier les paramètre et variable
    $stmt->bindParam(':idService', $idService);
    
    // Exécuter la requête SQL
    $stmt->execute();

    // Redirection vers la page de gestion des suggestions
    header('Location: ../candidature_admin/candidature_admin.php');
    exit;
}
?>
<!------------ Gestion candidature Service  (fin) --------->
