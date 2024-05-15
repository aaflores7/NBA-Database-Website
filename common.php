<?php 
  $db = new PDO("mysql:dbname=mynbadb;host=localhost;port=3307", "root", "1234p@55w0rd");
  $db -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
?>