<?php
include("common.php"); 
session_start();

if(isset($_POST["username"]) && isset($_POST["password"])){
    $username = $_POST["username"];
    $password = $_POST["password"];
    $query = "SELECT * from users where username='$username' and password='$password';";
    $check = $db -> query($query);
    $check_id = $check -> fetch();
    if(!$check_id){
        header("Location: index.php?login=failed");
        exit;
    }
    $_SESSION["username"] = $username;
    $_SESSION["role"] = $check_id["role"];
    $_SESSION["name"] = $check_id["first_name"];

    if($_SESSION["role"] == "admin")
        header("Location: admin/users.php");
    else if($_SESSION["role"] == "user")
        header("Location: players.php");
    exit;
} else {
    header("Location: index.php?login=failed");
    exit;
}   
?>