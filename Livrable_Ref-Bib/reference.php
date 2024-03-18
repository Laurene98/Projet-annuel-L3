<?php
    session_start();
    //include ("connecttest.php");

    if(isset($_POST['search_ref'])){
    //$Reference = $_POST['Reference_code'];
    $Search = $_POST['search_ref'];
    $choix=$_POST['Search_ref'];
    }
?>

<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="nemaid.css">
        <link rel="stylesheet" href="explore.css">
        <link rel="stylesheet" href="font-awersome.css">
        <link rel="stylesheet" href="materialize.css">
        <?php include("mainmenu.php");?>
    </head>
    <!--Text style displayed according to the user's choice-->
    <style type="text/css">
        #cache1{
            display: block;
        }
        #cache2{
            display: none;
        }
        #cache3{
            display:none;
        }
        #main-wrapper.grey.lighten-4.mydropdown {
            width: 100% ;  /* Defines the width */
        }
    </style>
    <div id="main-wrapper" class="grey lighten-4 ">
        <div class="container nomen-search ScrBarForSpeciesNames" >
            <form name="Reference" action="reference.php" method="post">
                <div class="nemaid-window-head">
                    <center>Please choose one of the options below.</center>
                    <!--<p><center><img src="progress.jpg" width="150" height="150"></center></p>-->
                    <br>
                </div>
                <div>
                    <label for="Search_ref">Search for </label>
                    <select name="Search_ref" id="Search_ref">
                        <!--Search field drop-down menu allowing you to search by author, year, publication title, publication journal or reference number-->
                        <option value="Author" <?php if(isset($_POST['Search_ref']) && $_POST['Search_ref'] == 'Author') echo 'selected'; ?>>Author</option>
                        <option value="Year" <?php if(isset($_POST['Search_ref']) && $_POST['Search_ref'] == 'Year') echo 'selected'; ?>>Year</option>
                        <option value="Title" <?php if(isset($_POST['Search_ref']) && $_POST['Search_ref'] == 'Title') echo 'selected'; ?>>Title</option>
                        <option value="Journal" <?php if(isset($_POST['Search_ref']) && $_POST['Search_ref'] == 'Journal') echo 'selected'; ?>>Journal</option>
                        <option value="Ref" <?php if(isset($_POST['Search_ref']) && $_POST['Search_ref'] == 'Ref') echo 'selected'; ?>>Reference code</option>
                    </select>
                </div>
                <span id="search_input">
                    <input type="text" class="col s12" name="search_ref" value="<?php echo isset($_POST['search_ref']) ? htmlspecialchars($_POST['search_ref']) : ''; ?>">
                </span>

                <script>
                    //Function allowing to modify the type of data accepted according to the search field (number for reference number and year, text for others)
                    document.getElementById("Search_ref").addEventListener("change", function() {
                    var selected_value = document.getElementById("Search_ref").value;
                    var search_input = document.getElementById("search_input");
                    if (selected_value == "Author" || selected_value == "Title"|| selected_value == "Journal") {
                        search_input.innerHTML = '<input type="text" class="col s12" name="search_ref" id="search_ref">';
                    } else if (selected_value == "Ref") {
                        search_input.innerHTML = '<input type="number" class="col s12" name="search_ref" id="search_ref" min="1">';
                    } else {
                        search_input.innerHTML = '<input type="number" class="col s12" name="search_ref" id="search_ref" min="1500">';
                    }
                    });
                </script>
                <div align="center">
                    <input align="center" type="submit" class="waves-effect waves-teal btn" value="SEND" name="Research" >
                </div>
            </form>
            <div id="cache1" align="left" >
                <?php
                    if (isset($_POST['Research'])) {
                ?>
                <table>
                    <thead>
                        <tr>
                            <!--Information displayed following the search-->
                            <th>Authors (s)</th>
                            <th>Year</th>
                            <th>Title</th>
                            <th>Journal</th>
                            <th>Volume and page numbers</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            if ($Search != null) {
                                //Queries for each of the search fields
                                $reprefno = $test->query("SELECT GROUP_CONCAT(name_author, ', ', author_initial SEPARATOR ' & ')  as name_author, author_initial, year, title, journal, pages, Publ_IN FROM Reference_title join Reference_written_by on Reference_title.ref_no = Reference_written_by.ref_no JOIN Reference_authors on Reference_written_by.author_no = Reference_authors.author_no where Reference_title.ref_no= '" . $Search . "'");
                            
                                $repauthor = $test->query("SELECT Reference_title.ref_no, year, title, journal, pages, Publ_IN FROM Reference_title join Reference_written_by on Reference_title.ref_no = Reference_written_by.ref_no JOIN Reference_authors on Reference_written_by.author_no = Reference_authors.author_no where name_author LIKE '%" .$Search. "%' ORDER BY year ASC");

                                $reptitle = $test->query("SELECT Reference_title.ref_no, GROUP_CONCAT(name_author,', ', author_initial SEPARATOR ' & ') as name_author, author_initial, year, journal, pages, Publ_IN, title FROM Reference_title join Reference_written_by on Reference_title.ref_no = Reference_written_by.ref_no JOIN Reference_authors on Reference_written_by.author_no = Reference_authors.author_no where title LIKE '%" . $Search ."%' GROUP BY Reference_title.ref_no ORDER BY year ASC");
                            
                                $repjournal = $test->query("SELECT Reference_title.ref_no, GROUP_CONCAT(name_author,', ', author_initial SEPARATOR ' & ') as name_author, author_initial, year, title, pages, Publ_IN, journal FROM Reference_title join Reference_written_by on Reference_title.ref_no = Reference_written_by.ref_no JOIN Reference_authors on Reference_written_by.author_no = Reference_authors.author_no where journal LIKE '%" . $Search ."%' GROUP BY Reference_title.ref_no ORDER BY year ASC");

                                $repyear = $test->query("SELECT Reference_title.ref_no, GROUP_CONCAT(name_author,', ', author_initial SEPARATOR ' & ') AS name_author, author_initial, title, journal, pages, Publ_IN, year FROM Reference_title join Reference_written_by on Reference_title.ref_no = Reference_written_by.ref_no JOIN Reference_authors on Reference_written_by.author_no = Reference_authors.author_no where year= '" . $Search . "' GROUP BY Reference_title.ref_no ORDER BY Reference_title.ref_NO ASC");
                            
                                if ($choix == "Ref") {
                                    //Display of fields for a search by reference number
                                    while ($resultrefno=$reprefno->fetch()) {
                        ?>

                        <tr>
                            <td><?php echo $resultrefno['name_author']?></td>
                            <td><?php
                                if ($resultrefno['Publ_IN'] != null) {
                                    echo $resultrefno['year'] . ", publ. In: (" . $resultrefno['Publ_IN'] . ")";
                                } else {
                                    echo $resultrefno['year'];
                                } ?></td>
                            <td><?php echo $resultrefno['title']?></td>
                            <td><?php echo $resultrefno['journal']?></td>
                            <td id="pages"><?php echo $resultrefno['pages']?></td>
                        </tr>

                        <?php } }
                            if ($choix == "Author") {
                                //Display of fields for a search by author
                                while ($resultauthor=$repauthor->fetch()) {
                                    $id=$resultauthor['ref_no'];
                                    $author = $test->query("SELECT GROUP_CONCAT(name_author,', ', author_initial SEPARATOR ' & ') as name_author, author_initial FROM Reference_authors JOIN Reference_written_by on Reference_authors.Author_NO =Reference_written_by.Author_NO WHERE ref_no ='" . $id . "'");
                                    while ($name=$author->fetch()) {
                        ?>
                            <tr>
                                <td><?php echo $name['name_author']?></td>
                                <td><?php
                                if ($resultauthor['Publ_IN'] != null) {
                                    echo $resultauthor['year'] . ", publ. In: (" . $resultauthor['Publ_IN'] . ")";
                                }
                                else {
                                    echo $resultauthor['year'];
                                } ?></td>
                                <td><?php echo $resultauthor['title']?></td>
                                <td><?php echo $resultauthor['journal']?></td>
                                <td id="pages"><?php echo $resultauthor['pages']?></td>
                            </tr>

                            <?php } } }
                                if ($choix == "Title") {
                                    //Display of fields for a search by title 
                                    while ($resulttitle=$reptitle->fetch()) {
                            ?>
                            <tr>
                                <td><?php echo $resulttitle['name_author']?></td>
                                <td><?php
                                    if ($resulttitle['Publ_IN'] != null) {
                                        echo $resulttitle['year'] . ", publ. In: (" . $resulttitle['Publ_IN'] . ")";
                                    }
                                    else {
                                        echo $resulttitle['year'];
                                    } ?></td>
                                <td><?php echo $resulttitle['title']?></td>
                                <td><?php echo $resulttitle['journal']?></td>
                                <td id="pages"><?php echo $resulttitle['pages']?></td>
                            </tr>
                    
                        <?php } }
                            if($choix == "Journal") {
                                //Display of fields for a search by journal
                                while($resultjournal=$repjournal->fetch()){
                        ?>
                            <tr>
                                <td><?php echo $resultjournal['name_author']?></td>
                                <td><?php
                                    if ($resultjournal['Publ_IN'] != null) {
                                        echo $resultjournal['year'] . ", publ. In: (" . $resultjournal['Publ_IN'] . ")";
                                    }
                                    else {
                                        echo $resultjournal['year'];
                                    } ?></td>
                                <td><?php echo $resultjournal['title']?></td>
                                <td><?php echo $resultjournal['journal']?></td>
                                <td id="pages"><?php echo $resultjournal['pages']?></td>
                            </tr>

                        <?php } }
                            if ($choix == "Year") {
                                //Display of fields for a search by year
                                while ($resultyear=$repyear->fetch()) {
                        ?>
                            <tr>
                                <td><?php echo $resultyear['name_author']?></td>
                                <td><?php
                                    if ($resultyear['Publ_IN'] != null) {
                                        echo $Search . ", publ. In: (" . $resultyear['Publ_IN'] . ")";
                                    }
                                    else {
                                        echo $Search;
                                    } ?></td>
                                <td><?php echo $resultyear['title']?></td>
                                <td><?php echo $resultyear['journal']?></td>
                                <td id="pages"><?php echo $resultyear['pages']?></td>
                            </tr>
                        <?php } } ?>
                    </tbody>
                    <!--Button to copy all results-->
                    <button onclick="copyStringWithNewLineToClipBoard(this)">Copy all search</button>
                </table>
                <script>
                    //Function to copy the results according to a predefined format with a line break
                    function copyStringWithNewLineToClipBoard(button){
                    var row = button.parentNode.parentNode;
                    var cells = row.getElementsByTagName("td");
                    var text = "";
                    for (var i = 0; i < cells.length; i++) {
                        if(cells[i].id === 'pages') {
                            text += cells[i].innerText;
                            text += "\n";
                        }
                        else{
                            text += cells[i].innerText + ", ";
                        }
                    }
                    const mySmartTextarea = document.createElement('textarea');
                    mySmartTextarea.innerHTML = text;
                    document.body.appendChild(mySmartTextarea);
                    mySmartTextarea.select();
                    document.execCommand('copy');
                    document.body.removeChild(mySmartTextarea);
                    }
                </script>     
                <?php } } ?>
            </div>
        </div>
    </div>
</html>