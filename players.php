<?php 
  include("top.php");
  include("common.php");
  // If the 'username' session variable is not set, redirect to index.php
  if(!isset($_SESSION['username'])){
    header("Location: index.php");
    exit;
  }

  if(isset($_SESSION["role"])){
    if($_SESSION["role"] == "admin"){
      header("Location: admin/users.php");
    }
  }
  $name = $_SESSION["name"];
?>

<?php 
  $teams = $db -> query("SELECT DISTINCT team_name, team_id from teams ORDER BY team_name ASC;");
  $positions = $db -> query("SELECT DISTINCT position from players ORDER BY position ASC;");
  $colleges = $db -> query("SELECT DISTINCT college from players ORDER BY college ASC");
  $countries = $db -> query("SELECT DISTINCT country_name, country_id from countries ORDER BY country_name ASC;");
  
  $query = "SELECT * FROM (players p JOIN (plays_for pf JOIN teams t USING (team_id)) USING (player_id)) JOIN (player_country pc JOIN countries c USING(country_id)) USING (player_id) ";
  $changed = false;
  if(isset($_GET["team"])){
    if(strlen(trim($_GET["team"]))!=0){
      $query = $query . " WHERE team_name LIKE '%".$_GET["team"]."%'";
      $changed = true;
    }
  }
  
  if(isset($_GET["position"])){
    if(strlen(trim($_GET["position"]))!=0){
    if($changed){
        $query = $query . " AND p.position = '".$_GET["position"]."'";
      }else{
        $query = $query . " WHERE p.position = '".$_GET["position"]."'";
        $changed = true;
      }
    }
  }
  
  if(isset ($_GET["college"])){
    if(strlen(trim($_GET["college"]))!=0){
      if($changed){
        $query = $query . " AND p.college = '".$_GET["college"]."'";
      }else{
        $query = $query . " WHERE p.college = '".$_GET["college"]."'";
        $changed = true;
      }
    }
  }
    
  if(isset ($_GET["country_name"])){
    if(strlen(trim($_GET["country_name"]))!=0){
      if($changed){
        $query = $query . " AND c.country_name = '".$_GET["country_name"]."'";
      }else{
        $query = $query . " WHERE c.country_name = '".$_GET["country_name"]."'";
        $changed = true;
      }
    }
  }
  
  $query = $query . ";";
  
  $rows = $db -> query($query);
  ?>

  <div id="player-page-banner">
    <div id="wallpaper">
        <img src="files/images/player-wallpaper.jpg" alt = "NBA Player Wallpaper"/>
    </div>
    <div id="welcome-msg"><div>Welcome <?=$name?>!</div></div>
  </div>
  <div id="frame">
    <div id="filter-bar">
      
      <form action="players.php" method="GET">
        <div id="search-bar">
          <h2>League Roster</h2>
          <input type="submit" value="Search">
        </div>
        <!-- <input type="text" name="name" placeholder="Search"> -->
      <div id="filter">
        <div class="filter-dropdown" >
          <select name="team" class="filter-dropdown-option" id="selectTeam">
          <option selected="selected" value="">All Teams</option>
          <?php 
            foreach($teams as $row){
              ?>
              <option value="<?=$row["team_name"]?>"><?=$row["team_name"]?></option>
              <?php
            }
          ?>
          </select>
        </div>
        <div class="filter-dropdown">
          <select name="position" class="filter-dropdown-option" id="selectPosition">
          <option selected="selected" value="">All Positions</option>
          <?php 
            foreach($positions as $row){
              ?>
              <option value="<?=$row["position"]?>"><?=$row["position"]?></option>
              <?php
            }
          ?>
          </select>
        </div>
        <div class="filter-dropdown">
          <select name="college" class="filter-dropdown-option" id="selectCollege">
          <option selected="selected" value="">All Colleges</option>
          <?php 
            foreach($colleges as $row){
              ?>
              <option value="<?=$row["college"]?>"><?=$row["college"]?></option>
              <?php
            }
          ?>
          </select>
        </div>

        <div class="filter-dropdown">
          <select name="country_name" class="filter-dropdown-option" id="selectCountry">
            <option selected="selected" value="">All Countries</option>
            <?php 
              foreach($countries as $row){
                ?>
                <option value="<?=$row["country_name"]?>"><?=$row["country_name"]?></option>
                <?php
              }
            ?>
          </select>
        </div>
      </div>
    </form>
    </div>
  <div>
    <table id="example" class = "player-list table table-striped">
      <thead>
        <tr>
          <th>NAME</th>
          <th>TEAM</th>
          <th>NUMBER</th>
          <th>POSITION</th>
          <th>COLLEGE</th>
          <th>COUNTRY</th>
        </tr>
      </thead>
      <tbody>

      <?php 
        foreach($rows as $row){
          ?>
            <tr>
            <td>
              <a href="http://localhost/nba%20database/player-profile.php?player_id=<?=$row["player_id"]?>">
                  <?=$row["first_name"]?> <?=$row["last_name"]?> <?=$row["suffix"]?>
              </a>
            </td>
              <td><?=$row["team_abbrv"]?></td>
              <td><?=$row["jersey_num"]?></td>
              <td><?=$row["position"]?></td>
              <td><?=$row["college"]?></td>
              <td>
                <img
                  src="https://flagcdn.com/w20/<?=strtolower($row["two_letter_code"])?>.png"
                  srcset="https://flagcdn.com/w40/<?=strtolower($row["two_letter_code"])?>.png 2x"
                  width="20"
                  alt="Flag">
              </td>
            </tr>
          <?php
        }
      ?>
      </tbody>
    </table>
  </div>
</div>
<?php include("bottom.html"); ?>