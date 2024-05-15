<?php
  session_start();
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>NBA Database</title>
    <meta
      name="keywords"
      content="NBA database, database, NBA, myNBA database"
    />
    <meta name="description" content="A page for my nba database" />
    <meta name="author" content="Angelo Louis A. Flores" />
    <link
      rel="icon"
      href="files/NBA/nba-favicon.png"
      type="image/icon type"
      width="auto"
    />
    <!-- <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
    /> -->
    <?php include "script.php"; ?>
    
    <link rel="stylesheet" type="text/css" href="style.css" />
    <script src="script.js"></script>
  </head>
  <body>
    <header>
      <div id="banner-bg">
        <div id="banner">
          <div id="nba-logo-banner">
            <img src="files/NBA/nba-logo.png" alt="NBA logo" />
          </div>
          <div id="banner-options">
            <?php
              if(isset($_SESSION["username"])){?>
                <div><a href="players.php">PLAYERS</a></div>
                <div><a href="coaches.php">COACHES</a></div>
                <div><a href="teams.php">TEAMS</a></div>
                <div><a class="btn btn-primary" href="/nba database/logout.php">Log out</a></div>
                <?php
              }
            ?>
          </div>
        </div>
      </div>
    </header>
  </body>
</html>
