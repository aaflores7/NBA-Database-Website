<?php 
    include("top.php"); 
    if(!empty($_SESSION["username"])){
        switch($_SESSION["role"]){
            case "admin":
                header("Location: admin/users.php");
                break;
            case "user":
                header("Location: players.php");
                break;
        }
        exit;
    }
?>
<div id="index-page-content">
    <div class="card-header">
        <div>
            <div>
                <h1>
                    Sign in with your nba id
                </h1>
            </div>
        </div>
    </div>
    <div id="frame_login">
        <?php 
            if(isset($_GET["login"]) && $_GET["login"] == "failed"){
        ?>
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <?=htmlspecialchars("Incorrect username/password. Please Try Again.")?>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <?php
            }
        ?>
        <div class="center">
            <form method="post" action="login.php">
                <div class="mb-3">
                    <input type="text" placeholder="Username" class = "form-control" name="username" required>
                </div>
                <div class="mb-3">
                    <input type="password" placeholder="Password" class="form-control" name="password" required>
                </div>
                <div class="mb-3">
                    <a href="users-create.php">Don't have an NBA ID?</a>
                </div>
                <div class="mb-3">
                    <button type="submit" name="loginUser" class="btn btn-primary btn-submit">Sign In</button>
                </div>
            </form>
        </div>
    </div>
</div>