<?php 
  include("top.php");
  include("common.php");
  if(!isset($_SESSION['username'])){
    header("Location: index.php");
    exit;
  }
?>

<?php 
  $team_id = $_GET["team_id"];
  $team = $db -> query("SELECT * FROM teams t JOIN (plays_at pa JOIN locations USING (location_id)) USING (team_id) WHERE t.team_id = $team_id;");
  foreach($team as $t){
    $team_name = $t["team_name"];
    $color = $t["team_color"];
    $location = $t["location_name"];
  }
?>
<div id = "team-all-details" style="background-color:<?=$color?>">
  <div id = "image-section">
  <div id="team-profile-logo">
      <?php 
        $file_path = "";
        $extensions = ["png", "jpg", "jpeg"];
        foreach ($extensions as $ext) {
            if (file_exists("files/images/Team Logos/$team_name.$ext")) {
                $file_path = "files/images/Team Logos/$team_name.$ext";
                break;
            }
        }
        $file_path = $file_path ?: "files/NBA/nba-favicon.png";
      ?>
      <img src="<?= $file_path ?>" style="width: 300px;"  alt="NBA Sample Image"/>
    </div>
    <div id="team-main-text">
      <div id="profile_name"><?=$location?> <?=$team_name?></div>
    </div> 
  </div>
</div>

<?php 
  $players = $db -> query("SELECT * FROM (players p JOIN (plays_for pf JOIN teams t USING (team_id)) USING (player_id)) JOIN (player_country pc JOIN countries c USING(country_id)) USING (player_id) WHERE t.team_id = $team_id;");
?>
<div id = "frame">
  <div id=search-bar>
    <h2>Roster</h2>
  </div>
  <div>
    <table id="example" class="player-list table table-striped">
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
          foreach($players as $row){
            $player_name = $row["first_name"] . " " . $row["last_name"];
            if($row["suffix"]!= null){
              $player_name = $player_name . " " . $row["suffix"];
            }
            ?>
              <tr>
                <td><a href="http://localhost/nba%20database/player-profile.php?player_id=<?=$row["player_id"]?>"><?=$player_name?></a></td>
                <td><?=$row["team_abbrv"]?></td>
                <td><?=$row["jersey_num"]?></td>
                <td><?=$row["position"]?></td>
                <td><?=$row["college"]?></td>
                <td><img
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























<?php include("bottom.html")?>