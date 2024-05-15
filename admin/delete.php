<?php
  session_start();
  include("../common.php");
  if(isset($_GET["player_id"])){
    $player_id = $_GET["player_id"];
    $extensions = ['jpg', 'jpeg', 'png'];
    foreach ($extensions as $extension) {
      if (file_exists("../files/images/players/$player_id.$extension")) {
        $destination = "../files/images/players/$player_id.$extension";
        unlink($destination);
        break;
      }
    }
    $query = "DELETE FROM plays_for WHERE player_id = '$player_id';";
    $db -> query($query);
    $query = "DELETE FROM player_country WHERE player_id = '$player_id';";
    $db -> query($query);
    $query = "DELETE FROM players WHERE player_id = '$player_id';"; 
    $db -> query($query);
    $_SESSION["status"] = "Player Deleted";
    $_SESSION["status_code"] = "success";
    header("Location: players.php");
  }else if(isset($_GET["user_id"])){
    $user_id = $_GET["user_id"];
    $query = "DELETE FROM users WHERE user_id = '$user_id';";
    $db -> query($query);
    $_SESSION["status"] = "User Profile Deleted";
    $_SESSION["status_code"] = "success";
    header("Location: users.php");
  } else if(isset($_GET["coach_id"])){
    $coach_id = $_GET["coach_id"];
    $extensions = ['jpg', 'jpeg', 'png'];
    foreach ($extensions as $extension) {
      if (file_exists("../files/images/coaches/$coach_id.$extension")) {
        $destination = "../files/images/coaches/$coach_id.$extension";
        unlink($destination);
        break;
      }
    }
    $query = "DELETE FROM coach_country WHERE coach_id = '$coach_id';";
    $db -> query($query);
    $query = "DELETE FROM coached_by WHERE coach_id = '$coach_id';";
    $db -> query($query);
    $query = "DELETE FROM coaches WHERE coach_id = '$coach_id';";
    $db -> query($query);
    $_SESSION["status"] = "Coach Deleted";
    $_SESSION["status_code"] = "success";
    header("Location: coaches.php");
  } else if(isset($_GET["team_id"])){
    $team_id = $_GET["team_id"];
    $extensions = ['jpg', 'jpeg', 'png'];
    $query = "SELECT team_name from teams WHERE team_id = '$team_id';";
    $team = $db -> query($query);
    foreach($team as $t){
      $team_name = $t["team_name"];
    }
    foreach ($extensions as $extension) {
      if (file_exists("../files/images/Team Logos/$team_name.$extension")) {
        $destination = "../files/images/Team Logos/$team_name.$extension";
        unlink($destination);
        break;
      }
    }
    $query = "DELETE FROM plays_at WHERE team_id = '$team_id';";
    $db -> query($query);
    $query = "UPDATE coached_by SET team_id = NULL WHERE team_id = '$team_id'";
    $result = $db -> query($query);
    $query = "UPDATE plays_for SET team_id = NULL WHERE team_id = '$team_id'";
    $result = $db -> query($query);
    $query = "DELETE FROM teams WHERE team_id = '$team_id';";
    $db -> query($query);
    $_SESSION["status"] = "Team Deleted";
    $_SESSION["status_code"] = "success";
    header("Location: teams.php");
  } 
  exit;
?>
