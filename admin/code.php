<?php
  session_start();
  include("../common.php");
  //add user username check
  if(isset($_POST["check_submit_btn"])){
    $username = $_POST["username"];
    $query = "SELECT user_id from users where username='$username';";
    $check = $db -> query($query);
    $check_id = $check -> fetch();
    if($check_id){
      echo "Username already exists. Please try another.";
    }
  }
    //edit user username check
  if(isset($_POST["check_submit_btn_6"])){
    $username = $_POST["username"];
    $current_username = $_POST["current_username"];
    $query = "SELECT user_id from users where username='$username' and username != '$current_username';";
    $check = $db -> query($query);
    $check_id = $check -> fetch();
    if($check_id){
      echo "Username already exists. Please try another.";
    }
  }

  if(isset($_POST["check_submit_btn_7"])){
    $location = $_POST["location"];
    $query = "SELECT location_id from locations where location_name='$location';";
    $check = $db -> query($query);
    $check_id = $check -> fetch();
    if($check_id){
      echo "Location already exists. Please try another.";
    }
  }
  
  if(isset($_POST["check_submit_btn_2"])){
    $jerseyNumber = $_POST["jerseyNumber"];
    $team_id = $_POST["team_id"]; 
    if(!empty($jerseyNumber)){
      $check = $db -> query("SELECT * FROM (players p JOIN (plays_for pf JOIN teams t USING (team_id)) USING (player_id)) WHERE t.team_id = $team_id AND p.jersey_num = $jerseyNumber;");
      $check_id = $check -> fetch();
      if($check_id){
        echo "Jersey Number Already Used. Please try another.";
      }
    }
  }
  
  
  if(isset($_POST["check_submit_btn_4"])){
    $team_name = $_POST["teamname"];
    $current_team_name = $_POST["current_team_name"];
    $query = "SELECT team_id from teams where team_name = '$team_name' and team_name != '$current_team_name';";
    $check = $db -> query($query);
    $check_id = $check -> fetch();
    if($check_id){
      echo "Team Already Exists. Please Try Another One.";
    }
  }

  if(isset($_POST["check_submit_btn_5"])){
    $team_name = $_POST["teamname"];
    $query = "SELECT team_id from teams where team_name = '$team_name';";
    $check = $db -> query($query);
    $check_id = $check -> fetch();
    if($check_id){
      echo "Team Already Exists. Please Try Another One.";
    }
  }
  
  if(isset($_POST["addplayerbtn"])){
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $suffix = $_POST["suffix"];
    if(empty($suffix)){
      $suffix = NULL;
    }
    $team = $_POST["team_id"];
    $number = $_POST["jersey_num"];
    if(empty($number)){
      $number = NULL;
    }
    $position = $_POST["position"];
    $college = $_POST["college"];
    if(empty($college)){
      $college = NULL;
    }
    $country = $_POST["country_id"];
    $experience = $_POST["experience"];
    $month = $_POST["month"];
    $day = $_POST["day"];
    $year = $_POST["year"];
    do{
      $query = "SELECT player_id from players where first_name = '$first_name' and last_name = '$last_name' and suffix = '$suffix' and position = '$position' and college = '$college' and experience = '$experience' and birthday = '$month $day $year';";
      $check = $db -> query($query);
      $check_id = $check -> fetch();
      if($check_id){
        $_SESSION["status"] = "Player Already Exists. Please Try Again.";
        $_SESSION["status_code"] = "error";
        header("Location: players.php");
      }else{
        $check = $db -> query("SELECT * FROM (players p JOIN (plays_for pf JOIN teams t USING (team_id)) USING (player_id)) WHERE t.team_id = $team AND p.jersey_num = $number;");
        $check_id = $check -> fetch();
        if($check_id){
          $_SESSION["status"] = "Jersey Number is Already Used. Please Try Another One.";
          $_SESSION["status_code"] = "error";
          header("Location: players.php");
        }else{
          $query = "INSERT INTO players (first_name, last_name, suffix, jersey_num, position, college, experience, birthday) VALUES ('$first_name', '$last_name', '$suffix', '$number', '$position', '$college', '$experience', '$month $day $year');";
          $db -> query($query);
          
          $query = "SELECT player_id from players where first_name = '$first_name' and last_name = '$last_name' and suffix = '$suffix' and position = '$position' and college = '$college' and experience = '$experience' and birthday = '$month $day $year';";
          $player_id = $db -> query($query);
          foreach($player_id as $p){
            $player_id = $p["player_id"];
          }
          if($_FILES["image"]["error"] === 4){
            echo 
            "<script> alert('Image does not exist'); .</script>";
          }
          else{
            $fileName = $_FILES["image"]["name"];
            $fileSize = $_FILES["image"]["size"];
            $tmpName = $_FILES["image"]["tmp_name"];
    
            $validImageExtension = ["jpg", "jpeg", "png"];
            $imageExtension = explode(".", $fileName);
            $imageExtension = strtolower(end($imageExtension));
            if(!in_array($imageExtension, $validImageExtension)){
              echo "<script> alert('Invalid image extension'); </script>";
            }
            else if($fileSize > 10000000){
              echo "<script> alert('Image size exceeds 1MB'); </script>";
            }
            else{
              $fileName = $player_id . "." . $imageExtension;
              $destination = "../files/images/players/" . $fileName;
              if (!file_exists(dirname($destination))) {
                mkdir(dirname($destination), 0777, true);
              }
              move_uploaded_file($tmpName, $destination);
            }
          } 
          $query = "INSERT INTO plays_for (player_id, team_id) VALUES ('$player_id', '$team');";
          $db -> query($query);
            
          $query = "INSERT INTO player_country (player_id, country_id) VALUES ('$player_id', '$country');";
          $db -> query($query);

          $_SESSION["status"] = "Player Successfully Added";
          $_SESSION["status_code"] = "success";
          header("Location: players.php");
        }
      }
    }while(false);
  }

  if(isset($_POST["updatebtn"])){
    $player_id = $_POST["player_id"];
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $suffix = $_POST["suffix"];
    if(empty($suffix)){
      $suffix = NULL;
    }
    $team = $_POST["team_id"];
    if(empty($team)){
      $team = NULL;
    }
    $number = $_POST["jersey_num"];
    if(empty($number)){
      $number = NULL;
    }
    $position = $_POST["position"];
    $college = $_POST["college"];
    if(empty($college)){
      $college = NULL;
    }
    $country = $_POST["country_id"];
    $experience = $_POST["experience"];
    $month = $_POST["month"];
    $day = $_POST["day"];
    $year = $_POST["year"];

    do{
      if(isset($_FILES["image"]) && $_FILES["image"]["error"]== UPLOAD_ERR_OK){
        $extensions = ['jpg', 'jpeg', 'png'];
        foreach ($extensions as $extension) {
          if (file_exists("../files/images/players/$player_id.$extension")) {
            $destination = "../files/images/players/$player_id.$extension";
            unlink($destination);
            break;
          }
        }
      }
      $fileName = $_FILES["image"]["name"];
      $fileSize = $_FILES["image"]["size"];
      $tmpName = $_FILES["image"]["tmp_name"];

      $validImageExtension = ["jpg", "jpeg", "png"];
      $imageExtension = explode(".", $fileName);
      $imageExtension = strtolower(end($imageExtension));
      if(!in_array($imageExtension, $validImageExtension)){
        echo "<script> alert('Invalid image extension'); </script>";
      }
      else if($fileSize > 10000000){
        echo "<script> alert('Image size exceeds 1MB'); </script>";
      }
      else{
        $fileName = $player_id . "." . $imageExtension;
        $destination = "../files/images/players/" . $fileName;
        if (!file_exists(dirname($destination))) {
          mkdir(dirname($destination), 0777, true);
        }
        move_uploaded_file($tmpName, $destination);
      }
      $query = "UPDATE players SET first_name = '$first_name', last_name = '$last_name', suffix = '$suffix',jersey_num = '$number', position = '$position', college = '$college', experience = '$experience', birthday = '$month $day $year' WHERE player_id = '$player_id';";
      $result = $db -> query($query);
      if($team != NULL){
        $query = "UPDATE plays_for SET team_id = '$team' WHERE player_id = '$player_id'";
        $result = $db -> query($query);
      }else{
        $query = "UPDATE plays_for SET team_id = NULL WHERE player_id = '$player_id'";
        $result = $db -> query($query);
      }
      $query = "UPDATE player_country SET country_id = '$country' WHERE player_id = '$player_id';";
      $result = $db -> query($query);

      $_SESSION["status"] = "Player Profile Updated";
      $_SESSION["status_code"] = "success";
      header("Location: players.php");
      exit;
    }while(false);
  }


  if(isset($_POST["registerbtn"])){
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $suffix = $_POST["suffix"];
    if(empty($suffix)){
      $suffix = NULL;
    }
    $username = $_POST["username"];
    $role = $_POST["role"];
    $password = $_POST["password"];
    $cpassword = $_POST["confirm_password"];

    if($password === $cpassword){
      $query = "SELECT user_id from users where username='$username';";
      $check = $db -> query($query);
      $check_id = $check -> fetch();
      if($check_id){
        $_SESSION["status"] = "Username Already Taken. Please Try Another One.";
        $_SESSION["status_code"] = "error";
        header("Location: users.php");
      }else{
        $query = "INSERT INTO users (first_name, last_name, suffix, password, username, role) VALUES ('$first_name', '$last_name', '$suffix', '$password', '$username', '$role');";
        $db -> query($query);
  
        if($db){
          $_SESSION["status"] = "User Profile Added";
          $_SESSION["status_code"] = "success";
          header("Location: users.php");
        }else{
          $_SESSION["status"] = "User Profile Not Added";
          $_SESSION["status_code"] = "error";
          header("Location: users.php");
        }
      }
    }else{
      $_SESSION["status"] = "Password and Confirm Password Does Not Match";
      $_SESSION["status_code"] = "warning";
      header("Location: users.php");
    }
  }

  if(isset($_POST["addcoachbtn"])){
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $suffix = $_POST["suffix"];
    if(empty($suffix)){
      $suffix = NULL;
    }
    $team = $_POST["team_id"];  
    if(empty($team)){
      $team = NULL;
    }
    $country = $_POST["country_id"];
    $query = "SELECT coach_id from coaches where first_name = '$first_name' and last_name = '$last_name' and suffix = '$suffix';";
    $check = $db -> query($query);
    $check_id = $check -> fetch();
    if($check_id){
      $_SESSION["status"] = "Coach Already Exists. Please Try Again.";
      $_SESSION["status_code"] = "error";
      header("Location: coaches.php");
    }else{
      $query = "INSERT INTO coaches (first_name, last_name, suffix) VALUES ('$first_name', '$last_name', '$suffix');";
      $db -> query($query);
      
      $query = "SELECT coach_id from coaches where first_name = '$first_name' and last_name = '$last_name' and suffix = '$suffix';";
      $coach_id = $db -> query($query);
      foreach($coach_id as $c){
        $coach_id = $c["coach_id"];
      }
      $query = "INSERT INTO coach_country (coach_id, country_id) VALUES ('$coach_id', '$country');";
      $db -> query($query);
      if($team != NULL){
        $query = "INSERT INTO coached_by (coach_id, team_id) VALUES ('$coach_id', '$team');";
      }else{
        $query = "INSERT INTO coached_by (coach_id) VALUES ('$coach_id');";
      }
      $db -> query($query);
      if($_FILES["image"]["error"] === 4){
        echo 
        "<script> alert('Image does not exist'); .</script>";
      }
      else{
        $fileName = $_FILES["image"]["name"];
        $fileSize = $_FILES["image"]["size"];
        $tmpName = $_FILES["image"]["tmp_name"];
    
        $validImageExtension = ["jpg", "jpeg", "png"];
        $imageExtension = explode(".", $fileName);
        $imageExtension = strtolower(end($imageExtension));
        if(!in_array($imageExtension, $validImageExtension)){
          echo "<script> alert('Invalid image extension'); </script>";
        }
        else if($fileSize > 10000000){
          echo "<script> alert('Image size exceeds 1MB'); </script>";
        }
        else{
          $fileName = $coach_id . "." . $imageExtension;
          $destination = "../files/images/coaches/" . $fileName;
          if (!file_exists(dirname($destination))) {
            mkdir(dirname($destination), 0777, true);
          }
          move_uploaded_file($tmpName, $destination);
        }
      } 
      $_SESSION["status"] = "Coach Successfully Added";
      $_SESSION["status_code"] = "success";
      header("Location: coaches.php");
    }
  }

  if(isset($_POST["updatecoachbtn"])){
    $coach_id = $_POST["coach_id"];
    $team_id = $_POST["team_id"];
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $suffix = $_POST["suffix"];
    if(empty($suffix)){
      $suffix = NULL;
    }
    $country= $_POST["country_id"];

    do{
      if(isset($_FILES["image"]) && $_FILES["image"]["error"] == UPLOAD_ERR_OK){
        $extensions = ['jpg', 'jpeg', 'png'];
        foreach ($extensions as $extension) {
          if (file_exists("../files/images/coaches/$coach_id.$extension")) {
            $destination = "../files/images/coaches/$coach_id.$extension";
            unlink($destination);
            break;
          }
        }
      }
      $fileName = $_FILES["image"]["name"];
      $fileSize = $_FILES["image"]["size"];
      $tmpName = $_FILES["image"]["tmp_name"];

      $validImageExtension = ["jpg", "jpeg", "png"];
      $imageExtension = explode(".", $fileName);
      $imageExtension = strtolower(end($imageExtension));
      if(!in_array($imageExtension, $validImageExtension)){
        echo "<script> alert('Invalid image extension'); </script>";
      }
      else if($fileSize > 10000000){
        echo "<script> alert('Image size exceeds 1MB'); </script>";
      }
      else{
        $fileName = $coach_id . "." . $imageExtension;
        $destination = "../files/images/coaches/" . $fileName;
        if (!file_exists(dirname($destination))) {
          mkdir(dirname($destination), 0777, true);
        }
        move_uploaded_file($tmpName, $destination);
      }
      if($team_id != NULL){
        $query = "UPDATE coached_by SET team_id = NULL WHERE team_id = '$team_id'";
        $result = $db -> query($query);
        $query = "UPDATE coached_by SET team_id = '$team_id' WHERE coach_id = '$coach_id'";
        $result = $db -> query($query);
      }else{
        $query = "UPDATE coached_by SET team_id = NULL WHERE coach_id = '$coach_id'";
        $result = $db -> query($query);
      }
      $query = "UPDATE coaches SET first_name = '$first_name', last_name = '$last_name', suffix = '$suffix' WHERE coach_id = '$coach_id';";
      $result = $db -> query($query);
      $query = "UPDATE coach_country SET country_id = '$country' WHERE coach_id = '$coach_id';";
      $result = $db -> query($query);
      $_SESSION["status"] = "Coach Profile Updated";
      $_SESSION["status_code"] = "success";
      header("Location: coaches.php");
      exit;
    }while(false);
  }

  //ADD TEAM
  if(isset($_POST["addteambtn"])){
    $team_name = $_POST["team_name"];
    $location_id = $_POST["location_id"];
    $found_year = $_POST["found_year"];
    $team_abbrv = $_POST["team_abbrv"];
    $team_color = $_POST["team_color"];
    $query = "SELECT team_id from teams where team_name = '$team_name';";
    $check = $db -> query($query);
    $check_id = $check -> fetch();
    if($check_id){
      $_SESSION["status"] = "Team Already Exists. Please Try Again.";
      $_SESSION["status_code"] = "error";
      header("Location: teams.php");
    }else{
      $query = "INSERT INTO teams (team_name, found_year, team_abbrv, team_color) VALUES ('$team_name', '$found_year', '$team_abbrv', '$team_color');";
      $db -> query($query);
      $query = "SELECT team_id from teams where team_name = '$team_name';";
      $check = $db -> query($query);
      foreach($check as $c){
        $team_id = $c["team_id"];
      }
      $query = "INSERT INTO plays_at (team_id, location_id) VALUES ('$team_id', '$location_id');";
      $db -> query($query);

      if($_FILES["image"]["error"] === 4){
        echo 
        "<script> alert('Image does not exist'); .</script>";
      }
      else{
        $fileName = $_FILES["image"]["name"];
        $fileSize = $_FILES["image"]["size"];
        $tmpName = $_FILES["image"]["tmp_name"];
    
        $validImageExtension = ["jpg", "jpeg", "png"];
        $imageExtension = explode(".", $fileName);
        $imageExtension = strtolower(end($imageExtension));
        if(!in_array($imageExtension, $validImageExtension)){
          echo "<script> alert('Invalid image extension'); </script>";
        }
        else if($fileSize > 10000000){
          echo "<script> alert('Image size exceeds 1MB'); </script>";
        }
        else{
          $fileName = $team_name . "." . $imageExtension;
          $destination = "../files/images/Team Logos/" . $fileName;
          if (!file_exists(dirname($destination))) {
            mkdir(dirname($destination), 0777, true);
          }
          move_uploaded_file($tmpName, $destination);
        }
      } 
      $_SESSION["status"] = "Team Successfully Added";
      $_SESSION["status_code"] = "success";
      header("Location: teams.php");
    }
  }

  if(isset($_POST["updateteambtn"])){
    $team_id = $_POST["team_id"];
    $team_name = $_POST["team_name"];
    $location = $_POST["location_id"];
    $found_year = $_POST["found_year"];
    $team_abbrv = $_POST["team_abbrv"];
    $team_color = $_POST["team_color"];

    do{
      if(isset($_FILES["image"]) && $_FILES["image"]["error"] == UPLOAD_ERR_OK){
        $extensions = ['jpg', 'jpeg', 'png'];
        foreach ($extensions as $extension) {
          if (file_exists("../files/images/Team Logos/$team_name.$extension")) {
            $destination = "../files/images/Team Logos/$team_name.$extension";
            unlink($destination);
            break;
          }
        }
      }
      $fileName = $_FILES["image"]["name"];
      $fileSize = $_FILES["image"]["size"];
      $tmpName = $_FILES["image"]["tmp_name"];

      $validImageExtension = ["jpg", "jpeg", "png"];
      $imageExtension = explode(".", $fileName);
      $imageExtension = strtolower(end($imageExtension));
      if(!in_array($imageExtension, $validImageExtension)){
        echo "<script> alert('Invalid image extension'); </script>";
      }
      else if($fileSize > 10000000){
        echo "<script> alert('Image size exceeds 1MB'); </script>";
      }
      else{
        $fileName = $team_name . "." . $imageExtension;
        $destination = "../files/images/Team Logos/" . $fileName;
        if (!file_exists(dirname($destination))) {
          mkdir(dirname($destination), 0777, true);
        }
        move_uploaded_file($tmpName, $destination);
      }

      $query = "UPDATE teams SET team_name = '$team_name', found_year = '$found_year', team_abbrv = '$team_abbrv', team_color = '$team_color' WHERE team_id = '$team_id';";
      $result = $db -> query($query);
      $query = "UPDATE plays_at SET location_id = '$location' WHERE team_id = '$team_id';";
      $result = $db -> query($query);
      $query = "UPDATE coaches SET first_name = '$first_name', last_name = '$last_name', suffix = '$suffix' WHERE coach_id = '$coach_id';";
      $result = $db -> query($query);
      $query = "UPDATE coach_country SET country_id = '$country' WHERE coach_id = '$coach_id';";
      $result = $db -> query($query);
      $_SESSION["status"] = "Team Profile Updated";
      $_SESSION["status_code"] = "success";
      header("Location: teams.php");
      exit;
    }while(false);
  }

  if(isset($_POST["addlocationbtn"])){
    $location_name = $_POST["location_name"];
    $division_id = $_POST["division_id"];
    $conference_id = $_POST["conference_id"];
    $query = "SELECT location_id from locations where location_name = '$location_name';";
    $check = $db -> query($query);
    $check_id = $check -> fetch();
    if($check_id){
      $_SESSION["status"] = "Location Already Exists. Please Try Again.";
      $_SESSION["status_code"] = "error";
      header("Location: locations.php");
    }else{
      $query = "INSERT INTO locations (location_name) VALUES ('$location_name');";
      $db -> query($query);
      $query = "SELECT location_id from locations where location_name = '$location_name';";
      $check = $db -> query($query);
      foreach($check as $c){
        $location_id = $c["location_id"];
      }
      $query = "INSERT INTO loc_conf (location_id, conference_id) VALUES ('$location_id', '$conference_id');";
      $db -> query($query);
      $query = "INSERT INTO loc_div (location_id, division_id) VALUES ('$location_id', '$division_id');";
      $db -> query($query);
      $_SESSION["status"] = "Location Successfully Added";
      $_SESSION["status_code"] = "success";
      header("Location: teams.php");
    }
  }
?>