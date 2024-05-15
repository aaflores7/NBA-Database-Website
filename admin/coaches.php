<?php 
  include("menu.php");
  include("../common.php");
  // If the 'username' session variable is not set, redirect to index.php
  if($_SESSION["role"]!="admin"){
    header("Location: ../coaches.php");
    exit;
  }
  $name = $_SESSION["name"];
?>

<?php 
  $countries = $db -> query("SELECT DISTINCT country_name, country_id from countries ORDER BY country_name ASC");
  $teams = $db -> query("SELECT DISTINCT team_name, team_id from teams ORDER BY team_name ASC;");
  $divisions = $db -> query("SELECT DISTINCT division_name, division_id from divisions ORDER BY division_name ASC");
  $query = "SELECT *
  FROM coaches c LEFT JOIN coach_country cc ON c.coach_id = cc.coach_id 
  LEFT JOIN countries co ON cc.country_id = co.country_id
  LEFT JOIN coached_by cb ON c.coach_id = cb.coach_id 
  LEFT JOIN teams t ON cb.team_id = t.team_id 
  LEFT JOIN plays_at pa ON t.team_id = pa.team_id
  LEFT JOIN locations l ON pa.location_id = l.location_id
  LEFT JOIN loc_div ld ON l.location_id = ld.location_id
  LEFT JOIN divisions d ON ld.division_id = d.division_id";

  $changed = false;
  if(isset($_GET["team"])){
    if(strlen(trim($_GET["team"]))!=0){
      $query = $query . " WHERE t.team_name LIKE '%".$_GET["team"]."%'";
      $changed = true;
    }
  }

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

  if(isset ($_GET["country_name"])){
    if(strlen(trim($_GET["country_name"]))!=0){
      if($changed){
        $query = $query . " AND co.country_name = '".$_GET["country_name"]."'";
      }else{
        $query = $query . " WHERE co.country_name = '".$_GET["country_name"]."'";
        $changed = true;
      }
    }
  }

  $query = $query . ";";
  $rows = $db -> query($query);

?>

<div class="modal fade" id="addCoach" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Add Coach</h1>
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
            <label for="team">Available Teams</label>
            <select name="team_id" class="form-control">
              <option selected="selected" value="">Select Team</option>
              <?php 
                foreach($teams as $row){
                  $check = $db -> query("SELECT * FROM coached_by WHERE team_id = ".$row["team_id"].";");
                  if($check -> rowCount() == 0){
                    ?>
                      <option value="<?=$row["team_id"]?>"><?=$row["team_name"]?></option>
                    <?php
                  }
                }
              ?>
            </select>
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
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" name="addcoachbtn" class="btn btn-primary">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>

<?php
  $countries = $db -> query("SELECT DISTINCT country_name, country_id from countries ORDER BY country_name ASC");
  $teams = $db -> query("SELECT DISTINCT team_name, team_id from teams ORDER BY team_name ASC;");
  $divisions = $db -> query("SELECT DISTINCT division_name, division_id from divisions ORDER BY division_name ASC");
?>

  <div id="frame">
    <div id="filter-bar">
      <form action="coaches.php" method="GET">
      <?php
        if($_SESSION["role"]=="admin"){?>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCoach">
          Add Coach
        </button>
        <?php
        }
      ?>
        <div id="search-bar">
          <h2>Coaches</h2>
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
          <th>DIVISION</th>
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
              <td><?=$row["division_name"]?></td>
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
                    <a class="btn btn-primary btn-actions" href="edit-coach.php?coach_id=<?=$row["coach_id"]?>">Edit</a>
                    <a class="btn btn-danger btn-actions" href="delete.php?coach_id=<?=$row["coach_id"]?>">Delete</a>
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