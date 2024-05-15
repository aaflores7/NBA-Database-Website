<?php
  session_start();
  if (!isset($_SESSION['username']) || $_SESSION["role"] != "admin") {
    header("Location: ../index.php");
    exit;
  }
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Panel</title>
  <link
    rel="icon"
    href="../files/NBA/nba-favicon.png"
    type="image/icon type"
    width="auto"
  />
  <?php include "../script.php"; ?>
  <link href="style.css" rel="stylesheet" type="text/css">
  <script src="../script.js"></script>
  <script src="custom.js"></script>
</head>
<body>
  <div id="overall">
    <div id="menu">
      <div id="nba-logo-banner">
        <div>
          <img src="../files/NBA/nba-favicon.png" alt="NBA logo" />
        </div>
        <div>Admin Panel</div>
      </div>
      <div id = "menu-options">
        <a href="users.php"><div>Users</div></a>
        <a href="players.php"><div>Players</div></a>
        <a href="coaches.php"><div>Coaches</div></a>
        <a href="teams.php"><div>Teams</div></a>
        <a href="../logout.php"><div>Logout</div></a>
      </div>
    </div>
