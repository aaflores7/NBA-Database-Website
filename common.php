<?php 
// Edit the database name (mynbadb), host (localhost), port number (3306), username (root), and password (password) as per your database configuration.
$db = new PDO("mysql:dbname=mynbadb;host=localhost;port=3306", "root", "password");

// Optionally, you can change the error mode attribute. The current setting throws exceptions on errors.
$db -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
?>
