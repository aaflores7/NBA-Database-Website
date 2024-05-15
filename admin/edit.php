<?php 
  include("menu.php");
  include("../common.php");
?>
<?php
  $player_id = "";
  $first_name = "";
  $last_name = "";
  $suffix = "";
  $team = "";
  $number = "";
  $position = "";
  $college = "";
  $country = "";
  $experience = "";
  $month = "";
  $day = "";
  $year = "";
  $errorMessage = "";
  $successMessage = "";

  if ($_SERVER["REQUEST_METHOD"] == "GET"){
    if(!isset($_GET["player_id"])){
      header("Location: /nba database/admin/players.php");
      exit;
    }

    $player_id = $_GET["player_id"];
    $player = $db -> query("SELECT * from players p LEFT JOIN 
        (plays_for pf join(teams t join 
        (plays_at pa join locations using(location_id)) 
        using (team_id)) using (team_id)) using (player_id) 
        where player_id = '$player_id';
    ");
    $row = $player -> fetch();

    if(!$row){
      header("Location: /nba database/admin/players.php");
      exit;
    }
    $first_name = $row["first_name"];
    $last_name = $row["last_name"];
    $suffix = $row["suffix"];
    $team_name = $row["team_name"];
    $team = $row["team_id"];
    $number = $row["jersey_num"];
    $position = $row["position"];
    $college = $row["college"];
    $experience = $row["experience"];
    $birthdate = explode(" ", $row["birthday"]);
    $month = $birthdate[0];
    $day = $birthdate[1];
    $year = $birthdate[2];
    $countrydb = $db -> query("SELECT c.country_id, c.country_name from players p join(player_country pc join countries c using(country_id)) using (player_id) where p.player_id = '$player_id';");
    foreach($countrydb as $c){
      $country = $c["country_id"];
      $country_name = $c["country_name"];
    }
  }
?>
<?php 
 $teams = $db -> query("SELECT DISTINCT team_name, team_id from teams ORDER BY team_name ASC;");
 $positions = $db -> query("SELECT DISTINCT position from players ORDER BY position ASC;");
 $countries = $db -> query("SELECT DISTINCT country_name, country_id from countries ORDER BY country_name ASC");
?>

<div id="frame">
  <h2>Edit Player Information</h2>
  <?php
    if ($errorMessage != ""){
      ?>
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
          <?=$errorMessage?>
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      <?php
    }
  ?>
  <div id="image-section">
    <div id="player-image">
      <?php 
          $file_path = "";
          $extensions = ["png", "jpg", "jpeg"];
          foreach ($extensions as $ext) {
              if (file_exists("../files/images/players/$player_id.$ext")) {
                  $file_path = "../files/images/players/$player_id.$ext";
                  break;
              }
          }
          $file_path = $file_path ?: "../files/images/default.png";
      ?>
      <img src="<?= $file_path ?>" style="width: 300px" alt="NBA Sample Image"/>
    </div>
    <div id="team-logo">
      <?php 
        if($team == NULL){
          ?>
            <div id="profile_name">FREE AGENT</div>
          <?php
        }else{
          ?>
            <img src="../files/images/Team Logos/<?=$team_name?>.png" alt="NBA Sample Image" style="width:300px"/>
          <?php
          }
        ?>
    </div>
  </div>

  <form method="post" action="code.php" enctype="multipart/form-data">
    <label for="image"> Image: </label>
    <input type="file" name="image" id="image" accept=".jpg, .jpeg, .png" value="">
    <input type="hidden" name="player_id" value="<?=$player_id?>">
    <div class="fill-up-info">

      <div>
        <label for="first_name">Full Name</label>
        <input type="text" name="first_name" id="name" value="<?=$first_name?>" placeholder="First Name" required>
        <input type="text" name="last_name" id="name" value="<?=$last_name?>" placeholder="Last Name" required>
        <input type="text" name="suffix" id="name" value="<?=$suffix?>" placeholder="Suffix">
      </div>

      <div>
        <label for="team">Team</label>
        <select name="team_id" id="team">
          <?php 
            if($team == NULL){
              ?>
                <option value="" selected="selected">Select Team</option>
              <?php
            }else{
              ?>
                <option value="">Select Team</option>
              <?php
            }
          ?>
          <?php 
            foreach($teams as $row){
              if($row["team_id"] == $team){
                ?>
                <option value="<?=$row["team_id"]?>" selected="selected"><?=$row["team_name"]?></option>
                <?php
              }else{?>
                <option value="<?=$row["team_id"]?>"><?=$row["team_name"]?></option>
              <?php
              }
            }
          ?>
        </select>
      </div>


      <div>
        <label for="number">Jersey Number</label>
        <input type="number" class="check_jerseynumber" name="jersey_num" id="number" value="<?=$number?>" required>
      </div>

      <div>
        <label for="position">Position</label>
        <select name ="position" id="position" required>
         <?php 
            foreach($positions as $row){
              if ($row["position"] == $position){
                ?>
                <option value="<?=$row["position"]?>" selected="selected"><?=$row["position"]?></option>
                <?php
              }else{
                ?>
                <option value="<?=$row["position"]?>"><?=$row["position"]?></option>
                <?php
              }
            }
          ?>
        </select>
      </div>

      <div>
        <label for="college">College</label>
        <input type="text" name="college" id="college" value="<?=$college?>">
      </div>

      <div>
        <label for="country">Country</label>
        <select name="country_id" id="country">
          <?php 
            foreach($countries as $row){
              if($row["country_id"] == $country){
                ?>
                <option value="<?=$row["country_id"]?>" selected="selected"><?=$row["country_name"]?></option>
                <?php
              }else{
                ?>
                <option value="<?=$row["country_id"]?>"><?=$row["country_name"]?></option>
                <?php
              }
            }
          ?>
        </select>
      </div>
      <div>
        <label for="experience">Years of Experience</label>
        <input type="string" name="experience" id="experience" value="<?=$experience?>" required>
      </div>
      <div>
        <label for="birthday">Birthday</label>
        <input type="text" name="month" id="month" value = "<?=$month?>" required>
        <input type="text" name="day" id="day" value="<?=$day?>" required>
        <input type="text" name="year" id="year" value="<?=$year?>" required>
      </div>
  
      <?php
      if ($successMessage != ""){
        ?>
          <div class="alert alert-success alert-dismissible fade show" role="alert">
            <?=$successMessage?>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
          </div>
        <?php
      }
    ?>
      <div>
        <button type = "submit" class = "btn btn-primary" name="updatebtn">Save</button>
        <a class= "btn btn-primary" href="players.php">Cancel</a>
      </div>
    </div>
  </form>
</div>