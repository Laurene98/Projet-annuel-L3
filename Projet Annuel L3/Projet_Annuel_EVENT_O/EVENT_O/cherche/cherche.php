<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8">
    <title>Rechercher</title>
    <link rel="stylesheet" type="text/css" href="../cherche/cherche.css"/>
  </head>  
  <body>
    <!----------------- entête haut de page ----------------->
    <iframe src="../header/header.html" width="100%" height="180vw" frameborder="0"></iframe>
    
    <!----------------- Barre de recherche (début)----------------->
    <h1>Je cherche ...</h1>

    <form action="../cherche/rechercher.php" method="$_GET" target="_parent">
      <div class="search-box">
        <input type="text" name="q" placeholder="Rechercher...">
          <button type="submit" class="search-button">
            <img src="../header/img/loupe.png"> 
          </button>
      </div>          
    </form>
    <!----------------- Barre de recherche (fin)----------------->
    <!----------------- Filtre (début)----------------->
    <h1>Pour aller plus vite ...</h1>
    <p>
      Ceci est sensé être un filtre avec les champs qui s'enchaînent les uns les autres que l'on a pas pu faire car il faut du javascript.
      En php, nous devons enchaîner des pages web pour compléter une requête afin de réaliser le filtre.
    </p>
    <form action="../cherche/cherche.php" method="$_GET">
      <label for="Type">S'agit-il d'un produit ou d'un service que vous recherchez ?</label>
        <select name="Type" id="Type">
          <option value="Produit">Produit</option>
          <option value="Service">Service</option>
        </select>
        <br>
        <input type="submit" value="Valider">
    </form>
    <!----------------- Filtre (fin)----------------->
  </body>
</html>
