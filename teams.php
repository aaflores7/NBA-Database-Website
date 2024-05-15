<?php 
  include("top.php");
  include("common.php");
  if(!isset($_SESSION['username'])){
    header("Location: index.php");
    exit;
  }
?>
<div id="frame">
  <div id=search-bar>
    <h2>All Teams</h2>
  </div>
    
  <div id = "teams-container">
    <div class = "divisions-list">
      <?php
        $divisions = $db->query("SELECT * FROM divisions;");
        foreach($divisions as $d){
          ?>
          <div>
             <h3><?=$d["division_name"]?></h3>
          </div>
          <div class = "division">
            
            <?php
              $teams = $db->query("
              SELECT *
              FROM teams t 
              JOIN plays_at pa ON t.team_id = pa.team_id
              JOIN locations l ON pa.location_id = l.location_id
              JOIN loc_div ld ON l.location_id = ld.location_id
              JOIN divisions d ON ld.division_id = d.division_id
              WHERE d.division_id = ".$d["division_id"]."
          ");
              foreach($teams as $t){
                ?>
                <a href="team-profile.php?team_id=<?=$t["team_id"]?>">
                  <div class = "team">
                    <img src="files/images/Team Logos/<?=$t["team_name"]?>.png" alt="NBA Sample Image" id="team-image"/>
                    <div><?=$t["location_name"]?> <?=$t["team_name"]?></div>
                  </div>
                </a>
                <?php
              }
            ?>
          </div>
          <?php
        }
      ?>
    </div>
  </div>
<div> 

<?php include("bottom.html")?>