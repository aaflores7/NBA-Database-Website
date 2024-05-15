<?php
    session_start();
    session_destroy();
    header("Location: /nba database/index.php");
    exit;
?>