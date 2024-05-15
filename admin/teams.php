<?php 
  include("menu.php");
  include("../common.php");
  // If the 'username' session variable is not set, redirect to index.php
?>

<?php 
  $locations = $db -> query("SELECT DISTINCT location_name, location_id from locations ORDER BY location_name ASC;");
  $divisions = $db -> query("SELECT DISTINCT division_name, division_id from divisions ORDER BY division_name ASC");
  $conferences = $db -> query("SELECT DISTINCT conference_name, conference_id from conferences ORDER BY conference_name ASC");
  $query = "SELECT * FROM teams t JOIN plays_at pa ON t.team_id = pa.team_id 
    JOIN locations l ON pa.location_id = l.location_id
    JOIN loc_div ld ON l.location_id = ld.location_id
    JOIN divisions d ON ld.division_id = d.division_id JOIN loc_conf lc ON l.location_id = lc.location_id
    JOIN conferences co ON lc.conference_id = co.conference_id";

  $changed = false;
  if(isset ($_GET["division_name"])){
    if(strlen(trim($_GET["division_name"]))!=0){
      if($changed){
        $query = $query . " AND d.division_name = '".$_GET["division_name"]."'";
      }else{
        $query = $query . " WHERE d.division_name = '".$_GET["division_name"]."'";
        $changed = true;
      }
    }
  }

  if(isset ($_GET["conference_name"])){
    if(strlen(trim($_GET["conference_name"]))!=0){
      if($changed){
        $query = $query . " AND co.conference_name = '".$_GET["conference_name"]."'";
      }else{
        $query = $query . " WHERE co.conference_name = '".$_GET["conference_name"]."'";
        $changed = true;
      }
    }
  }

  $query = $query . ";";

  $rows = $db -> query($query);
?>

<div class="modal fade" id="addTeam" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Add Team</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="code.php" method="post" enctype="multipart/form-data">
        <div class="modal-body">
          <label for="image"> Team Logo: </label>
          <input type="file" name="image" id="image" accept=".jpg, .jpeg, .png" value="">
          <div class="mb-3">
            <label>Team Name</label>
            <input type="text" class="form-control check_teamname" placeholder="Enter Team Name" name="team_name" required>
            <small class="error_teamname" style = "color:red;"></small>
          </div>
          <div class = "mb-3">
            <label>Location</label>
            <select name="location_id" id="location" class="form-control" required>
                <?php 
                  foreach($locations as $row){
                    ?>
                    <option value="<?=$row["location_id"]?>"><?=$row["location_name"]?></option>
                    <?php
                  }
                ?>
            </select>
            </div>
            <div class="mb-3">
              <label for="found_year">Year Founded</label>
              <input type="number" id="found_year" class="form-control" placeholder="Year" name="found_year" min="1946" max="<?php echo date("Y"); ?>" required>
            </div>
          <div class="mb-3">
            <label>Team Abbreviation</label>
            <input type="text" maxlength = "3" class="form-control" placeholder="Abbreviation" name="team_abbrv" required>
          </div>
          <div>
            <label>Team Color</label><br>
            <input type="color" name="team_color" required>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" name="addteambtn" class="btn btn-primary">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>


<div class="modal fade" id="addLocation" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Add Location</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="code.php" method="post" enctype="multipart/form-data">
        <div class="modal-body">
          <div class="mb-3">
            <label>Location</label>
            <input type="text" class="form-control check_location" placeholder="Enter Location" name="location_name" required>
            <small class="error_location" style = "color:red;"></small>
          </div>
          <div class="mb-3">
            <label for="conference">Conference</label>
            <select name="conference_id" id="conference" class="form-control" required>
              <?php 
                foreach($conferences as $row){
              ?>
              <option value="<?=$row["conference_id"]?>"><?=$row["conference_name"]?></option>
              <?php
                }
              ?>
            </select>
          </div>
          <div class="mb-3">
            <label for="division">Division</label>
            <select name="division_id" id="division" class="form-control" required>
              <?php 
                foreach($divisions as $row){
              ?>
              <option value="<?=$row["division_id"]?>"><?=$row["division_name"]?></option>
              <?php
                }
              ?>
            </select>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" name="addlocationbtn" class="btn btn-primary">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>

<?php
   $divisions = $db -> query("SELECT DISTINCT division_name, division_id from divisions ORDER BY division_name ASC");
   $conferences = $db -> query("SELECT DISTINCT conference_name, conference_id from conferences ORDER BY conference_name ASC");
?>

  <div id="frame">
    <div id="filter-bar">
      <form action="teams.php" method="GET">
      <?php
        if($_SESSION["role"]=="admin"){?>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addTeam">
          Add Team
        </button>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addLocation">
          Add Location
        </button>
        <?php
        }
      ?>
        <div id="search-bar">
          <h2>Teams</h2>
          <input type="submit" value="Search">
        </div>
      <div id="filter">
        <div class="filter-dropdown" >
          <select name="division_name" class="filter-dropdown-option" id="selectTeam">
          <option selected="selected" value="">All Divisions</option>
          <?php 
            foreach($divisions as $row){
              ?>
              <option value="<?=$row["division_name"]?>"><?=$row["division_name"]?></option>
              <?php
            }
          ?>
          </select>
        </div>

        <div class="filter-dropdown" >
          <select name="conference_name" class="filter-dropdown-option" id="selectTeam">
          <option selected="selected" value="">All Conferences</option>
          <?php 
            foreach($conferences as $row){
              ?>
              <option value="<?=$row["conference_name"]?>"><?=$row["conference_name"]?></option>
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
          <th>LOCATION</th>
          <th>TEAM NAME</th>
          <th>DIVISION</th>
          <th>CONFERENCE</th>
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
              <?=$row["location_name"]?>
            </td>
              <td><?=$row["team_name"]?></td>
              <td><?=$row["division_name"]?></td>
              <td><?=$row["conference_name"]?></td>
              <?php
                if($_SESSION["role"]=="admin"){?>
                  <td>
                    <a class="btn btn-primary btn-actions" href="edit-team.php?team_id=<?=$row["team_id"]?>">Edit</a>
                    <a class="btn btn-danger btn-actions" href="delete.php?team_id=<?=$row["team_id"]?>">Delete</a>
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