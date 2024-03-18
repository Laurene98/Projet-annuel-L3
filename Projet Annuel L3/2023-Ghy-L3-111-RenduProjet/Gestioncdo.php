<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Idées de cadeaux</title>
  <link rel="stylesheet" type="text/css" href="CSS/main2.css">
  <link rel="stylesheet" type="text/css" href="CSS/Gestion.css">
  <title>Questionnaire (1/7)</title>
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
<table>
  <thead>
    <tr class="tab">
      <th>Nom du cadeau</th>
      <th>Prix</th>
      <th>Thème</th>
      <th>Occasion</th>
      <th>Âge minimum</th>
      <th>Âge maximum</th>
      <th>Description</th>
      <th>Image</th>
    </tr>
  </thead>
</table>
</body>
<?php
session_start();

if (isset($_POST['Cadeau'])) {
    $_SESSION['nom_cadeau'] = $_POST['nom_cadeau'];
    $_SESSION['prix'] = $_POST['prix'];
    $_SESSION['theme'] = $_POST['theme'];
    $_SESSION['occasion'] = $_POST['occasion'];
    $_SESSION['agemin'] = $_POST['agemin'];
    $_SESSION['agemax'] = $_POST['agemax'];
    $_SESSION['description'] = $_POST['description'];
    $_SESSION['image'] = $_POST['image'];

    $cadeaux = isset($_SESSION['Cadeaux']) ? $_SESSION['Cadeaux'] : array();
    $cadeaux[] = array(
        'nom_cadeau' => $_SESSION['nom_cadeau'],
        'prix' => $_SESSION['prix'],
        'theme' => $_SESSION['theme'],
        'occasion' => $_SESSION['occasion'],
        'agemin' => $_SESSION['agemin'],
        'agemax' => $_SESSION['agemax'],
        'description' => $_SESSION['description'],
        'image' => $_SESSION['image'],
    );
    $_SESSION['Cadeaux'] = $cadeaux;
}
if (isset($_SESSION['cadeaux'])) {
    foreach ($_SESSION['cadeaux'] as $cadeau) {
      echo '<tr>';
      echo '<td>' . $cadeau['nom_cadeau'] . '</td>';
      echo '<td>' . $cadeau['prix'] . '</td>';
      echo '<td>' . $cadeau['theme'] . '</td>';
      echo '<td>' . $cadeau['occasion'] . '</td>';
      echo '<td>' . $cadeau['agemin'] . '</td>';
      echo '<td>' . $cadeau['agemax'] . '</td>';
      echo '<td>' . $cadeau['description'] . '</td>';
      echo '<td>' . $cadeau['image'] . '</td>';
      echo '</tr>';
    }
  }
?>

