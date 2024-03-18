<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Idées de cadeaux</title>
  <link rel="stylesheet" href="CSS/main3.css">
  <link rel="stylesheet" href="CSS/Recap.css">
  <title>Fiche synthèse</title>
</head>
<body >
  <header role="header">
    <nav class="menu" role="navigation">
            <div class="inner"></div>
        <div class="m-center">
            <h1 class="logo">Idées de cadeaux</h1>
        </div>
        <div class="m-left" style="text-align:center;">
            <a href="AccueilUser.html" class="m-link"> Accueil</a>
            <a href="PropoCDO1.php"class="m-link">Suggestion</a>
            <a href="QuestionnaireQ1.php"class="m-link">Questionnaire</a>
            <a href="Espace_perso.html"class="m-link">Compte</a>
        </div>
    </nav>
</header>
<!-- la tranche d'age -->
  <div style="top:40%">
  <form action="Recap.php" method="POST">
  </div>
  <!-- Votre formulaire -->
  <div class="bouton-wrapper">
  <button type="submit" class="bout">Envoyer</button>
 </div>
</div>
</form>
</body>
</html>
<?php
session_start();
echo "<p>Nom du cadeau: " . $_SESSION['nom_cadeau'] . "</p>";
echo "<p>Prix: " . $_SESSION['prix'] . "</p>";
echo "<p>Thème: " . $_SESSION['theme'] . "</p>";
echo "<p>Occasion: " . $_SESSION['occasion'] . "</p>";
echo "<p>Age: " . $_SESSION['age'] . "</p>";
echo "<p>Description: " . $_SESSION['description'] . "</p>";
echo "<p>Image: " . $_SESSION['image'] . "</p>";


if (isset($_POST['Valider'])){
    $insertcdo=$bdd->prepare("INSERT INTO Cadeau(nom_cadeau,description,image,prix,agemin,agemax,theme,occasion,statut_kdo) VALUES (?,?,?,?,?,?,?,?,?);");
    }
    try{
        // insertion dans la bdd
        $insertuser->execute(array($nom_cadeau, $descriptio,$image,$prix,$theme,$occasion,$agemin,$agemax ,"enattente")); //ici c'est que pour le contributeur
        // redirection vers la page d'accueil
       // $recup_user=$bdd->prepare("SELECT * FROM utilisateur WHERE email=? ;");
        
            //$recup_user->execute(array($email));
            //$userinfo = $recup_user->fetch();
        $_SESSION['nom_cadeau'] = $nom_cadeau;
        $_SESSION['Description'] = $description;
        $_SESSION['Image'] = $image;
        $_SESSION['prix'] = $prix;
        $_SESSION['theme'] = $theme;
        $_SESSION['occasion'] = $occasion;
        $_SESSION['agemin'] = $agemin;
        $_SESSION['agemax'] = $agemax;
        $_SESSION['Statut'] = "enattente";
        header('location:AccueilUser.php');                                   
    }
    catch(Exception $e){
            die('Erreur : '.$e->getMessage());
    }
    
?>
<?php
session_destroy();
?>