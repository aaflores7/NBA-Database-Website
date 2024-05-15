<?php 
  include("menu.php");
  include("../common.php");
?>
<?php
  $coach_id = "";
  $first_name = "";
  $last_name = "";
  $suffix = "";

  if ($_SERVER["REQUEST_METHOD"] == "GET"){
    if(!isset($_GET["coach_id"])){
      header("Location: /nba database/admin/coaches.php");
      exit;
    }
    $coach_id = $_GET["coach_id"];
    $coach = $db -> query("SELECT * from coaches LEFT JOIN (coached_by cb JOIN teams t using(team_id)) using(coach_id)  where coach_id = '$coach_id';");
    $row = $coach -> fetch();

    if(!$row){
      header("Location: /nba database/admin/coaches.php");
      exit;
    }
    $first_name = $row["first_name"];
    $last_name = $row["last_name"];
    $suffix = $row["suffix"];
    $team_name = $row["team_name"];
    $team_id = $row["team_id"];
    $countrydb = $db -> query("SELECT cn.country_id, cn.country_name from coaches c join(coach_country cc join countries cn using(country_id)) using (coach_id) where c.coach_id = '$coach_id';");
    foreach($countrydb as $c){
      $country = $c["country_id"];
      $country_name = $c["country_name"];
    }
  }
  $teams = $db -> query("SELECT DISTINCT team_name, team_id from teams ORDER BY team_name ASC;");
  $countries = $db -> query("SELECT DISTINCT country_name, country_id from countries ORDER BY country_name ASC");
?>
<div id="frame">
  <h2>Edit Coach Information</h2>
  <div id="image-section">
    <div id="player-image">
      <?php 
        if(file_exists("../files/images/coaches/$coach_id.png")){
        ?>
        <img src="../files/images/coaches/<?=$coach_id?>.png" style="width: 300px" alt="NBA Sample Image"/>
      <?php }else if(file_exists("../files/images/coaches/$coach_id.jpg")){
        ?>
        <img src="../files/images/coaches/<?=$coach_id?>.jpg" style="width: 300px" alt="NBA Sample Image"/>
      <?php
        }else if(file_exists("../files/images/coaches/$coach_id.jpeg")){
        ?>
        <img src="../files/images/coaches/<?=$coach_id?>.jpeg" style="width: 300px" alt="NBA Sample Image"/>
      <?php
        }
      else{?>
        <img src="../files/images/default.png" style="width: 300px" alt="NBA Sample Image"/>
      <?php }
      ?>
    </div>
    <div id="team-logo">
      <?php 
        if($team_id == NULL){
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
    <input type="hidden" name="coach_id" value="<?=$coach_id?>">
    <div class="fill-up-info">
      <div>
        <label>Full Name</label>
        <input type="text" name="first_name" id="name" placeholder = "First name" value="<?=$first_name?>" required>
        <input type="text" name="last_name" id="name" placeholder= "Last name" value="<?=$last_name?>" required>
        <input type="text" name="suffix" id="name" placeholder= "Suffix" value="<?=$suffix?>">
      </div>
      <div>
        <label for="team">Team</label>
        <select name="team_id" id="team">
          <?php 
            if($team_id == NULL){
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
              if($row["team_id"] == $team_id){
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
        <label for="country">Country</label>
        <select name="country_id" id="country" required>
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
        <button type = "submit" class = "btn btn-primary" name="updatecoachbtn">Save</button>
        <a class= "btn btn-primary" href="coaches.php">Cancel</a>
      </div>
    </div>
  </form>
</div>