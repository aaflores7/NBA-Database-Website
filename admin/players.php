<?php 
  include("menu.php");
  include("common.php");
?>

<?php 
  $teams = $db -> query("SELECT DISTINCT team_name, team_id from teams ORDER BY team_name ASC;");
  $positions = $db -> query("SELECT DISTINCT position from players ORDER BY position ASC;");
  $colleges = $db -> query("SELECT DISTINCT college from players ORDER BY college ASC;");
  $countries = $db -> query("SELECT DISTINCT country_name, country_id from countries ORDER BY country_name ASC;");

  $query = "SELECT * FROM (players p LEFT JOIN (plays_for pf JOIN teams t USING (team_id)) USING (player_id)) JOIN (player_country pc JOIN countries c USING(country_id)) USING (player_id) ";
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

<div class="modal fade" id="addPlayer" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Add New Player</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="code.php" method="post" enctype="multipart/form-data">
        <div class="modal-body">
          <label for="image"> Image: </label>
          <input type="file" name="image" id="image" accept=".jpg, .jpeg, .png" value="">
          <div class="mb-3">
            <label>First Name</label>
            <input type="text" class="form-control" placeholder="Enter First Name" name="first_name" required>
          </div>
          <div class="mb-3">
            <label>Last Name</label>
            <input type="text" class="form-control" placeholder="Enter Last Name" name="last_name" required>
          </div>
          <div class="mb-3">
            <label>Suffix</label>
            <input type="text" class="form-control" placeholder="Suffix" name="suffix">
          </div>
          <div class="mb-3">
            <label for="team">Team</label>
            <select name="team_id" class="form-control check_team" required>
              <?php 
                foreach($teams as $row){
                  ?>
                    <option value="<?=$row["team_id"]?>"><?=$row["team_name"]?></option>
                  <?php
                }
              ?>
            </select>
          </div>

          <div class="mb-3">
            <label>Jersey Number</label>
            <input type="number" name="jersey_num" class="form-control check_jerseynumber" placeholder="Number">
            <small class = "error_jerseynumber" style="color: red"></small>
          </div>

          <div class="mb-3">
            <label>Position</label>
            <select name ="position" class="form-control" required>
            <?php 
                foreach($positions as $row){
                  ?>
                  <option value="<?=$row["position"]?>"><?=$row["position"]?></option>
                  <?php
                }
              ?>
            </select>
          </div>

          <div class="mb-3">
            <label for="college">College</label>
            <input type="text" name="college" class="form-control" placeholder="College">
          </div>

          <div class="mb-3">
            <label for="country">Country</label>
            <select name="country_id" id="country" class="form-control" required>
              <?php 
                foreach($countries as $row){
                  ?>
                  <option value="<?=$row["country_id"]?>"><?=$row["country_name"]?></option>
                  <?php
                }
              ?>
            </select>
          </div>
          <div class="mb-3">
            <label for="experience">Years of Experience</label>
            <input type="text" name="experience" id="experience" placeholder="Experience" class="form-control" required>
          </div>
          <div class="mb-3">
            <label for="birthday">Birthday</label>
            <input type="text" name="month" id="month" placeholder="Month" class="form-control" required>
            <input type="number" name="day" id="day" placeholder="Day" class="form-control" required>
            <input type="number" name="year" id="year" placeholder="Year" class="form-control" required>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" name="addplayerbtn" class="btn btn-primary">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>

<?php 
  $teams = $db -> query("SELECT DISTINCT team_name, team_id from teams ORDER BY team_name ASC;");
  $positions = $db -> query("SELECT DISTINCT position from players ORDER BY position ASC;");
  $colleges = $db -> query("SELECT DISTINCT college from players ORDER BY college ASC;");
  $countries = $db -> query("SELECT DISTINCT country_name, country_id from countries ORDER BY country_name ASC;");

?>
  <div id="frame">
    <div id="filter-bar">
      <form action="players.php" method="GET">
      <?php
        if($_SESSION["role"]=="admin"){?>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addPlayer">
          Add Player
        </button>
        <?php
        }
      ?>
        <div id="search-bar">
          <h2>Players</h2>
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
          <?php
            if($_SESSION["role"]=="admin"){?>
              <th>ACTIONS</th>
              <?php
            }
          ?>
        </tr>
      </thead>
      <tbody>

      <?php 
        foreach($rows as $row){
          ?>
            <tr>
            <td>
              <?=$row["first_name"]?> <?=$row["last_name"]?> <?=$row["suffix"]?>
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
              <?php
                if($_SESSION["role"]=="admin"){?>
                  <td>
                    <a class="btn btn-primary btn-actions" href="edit.php?player_id=<?=$row["player_id"]?>">Edit</a>
                    <a class="btn btn-danger btn-actions" href="delete.php?player_id=<?=$row["player_id"]?>">Delete</a>
                  </td>
                <?php
                }
              ?>
            </tr>
          <?php
        }
      ?>
      </tbody>
    </table>
  </div>
</div>
<?php include("../bottom.html"); ?>