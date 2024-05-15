<?php 
    include("menu.php");
    include("../common.php");

    $coach_id = "";
    $first_name = "";
    $last_name = "";
    $suffix = "";

    if ($_SERVER["REQUEST_METHOD"] == "GET"){
        if(!isset($_GET["team_id"])){
            header("Location: /nba database/admin/teams.php");
            exit;
        }
        $team_id = $_GET["team_id"];
        $team = $db -> query("SELECT * from teams t LEFT JOIN (plays_at pa JOIN locations l USING (location_id)) USING (team_id) WHERE team_id = '$team_id';");
        $row = $team -> fetch();
        if(!$row){
            header("Location: /nba database/admin/teams.php");
            exit;
        }
        $team_name = $row["team_name"];
        $found_year = $row["found_year"];
        $team_abbrv = $row["team_abbrv"];
        $team_color = $row["team_color"];
        $location_name = $row["location_name"];
    }
    $locations = $db -> query("SELECT DISTINCT location_name, location_id from locations ORDER BY location_name ASC;");
    $conferences = $db -> query("SELECT DISTINCT conference_name, conference_id from conferences ORDER BY conference_name ASC");
    $divisions = $db -> query("SELECT DISTINCT division_name, division_id from divisions ORDER BY division_name ASC");
?>
<div id="frame">
    <h2>Edit Team Information</h2>
    <div id="image-section">
      <?php 
          $file_path = "";
          $extensions = ["png", "jpg", "jpeg"];
          foreach ($extensions as $ext) {
              if (file_exists("../files/images/Team Logos/$team_name.$ext")) {
                  $file_path = "../files/images/Team Logos/$team_name.$ext";
                  break;
              }
          }
          $file_path = $file_path ?: "../files/NBA/nba-favicon.png";
      ?>
      <img src="<?= $file_path ?>" style="max-height: 100%; width: auto;"  alt="NBA Sample Image"/>
    </div>
    <form method="post" action="code.php" enctype="multipart/form-data">
        <input type="hidden" name="team_id" value="<?=$team_id?>">
        <input type="hidden" value = "<?=$team_name?>" class="current_teamname">
        <div class="fill-up-info">
            <label for="image"> Team Logo: </label>
            <input type="file" name="image" id="image" accept=".jpg, .jpeg, .png" value="">
            <div>
                <label>Team Name</label>
                <input type="text" class="form-control check_teamname_edit" placeholder="Enter Team Name" name="team_name" value= "<?=$team_name?>" required>
                <small class="error_teamname" style = "color:red;"></small>
            </div>
            <div>
            <label>Location</label>
            <select name="location_id" id="location" class="form-control" required>
                <?php 
                  foreach($locations as $row){
                    if($row["location_name"] == $location_name){
                      ?>
                      <option value="<?=$row["location_id"]?>" selected><?=$row["location_name"]?></option>
                      <?php
                    }
                    else{
                      ?>
                      <option value="<?=$row["location_id"]?>"><?=$row["location_name"]?></option>
                      <?php
                    }
                  }
                ?>
            </select>
            </div>
            <div>
                <label>Year Founded</label>
                <input type="number" class="form-control" placeholder="Year" name="found_year" value = "<?=$found_year?>"required>
            </div>
            <div>
                <label>Team Abbreviation</label>
                <input type="text" maxlength = "3" class="form-control" placeholder="Abbreviation" name="team_abbrv" value="<?=$team_abbrv?>"required>
            </div>
            <div>
                <label>Team Color</label><br>
                <input type="color" name="team_color" value="<?=$team_color?>" required>
            </div>
            <div>
                <button type = "submit" class = "btn btn-primary" name="updateteambtn">Save</button>
                <a class= "btn btn-primary" href="teams.php">Cancel</a>
            </div>
        </div>
    </form>
</div>