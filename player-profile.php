<?php 
    include("top.php");
    include("common.php");
    if(!isset($_SESSION['username'])){
        header("Location: index.php");
        exit;
    }
?>

<?php 
    $player_id = $_GET["player_id"];
    $player = $db -> query("
        SELECT * 
        FROM players p 
        JOIN (plays_for pf 
            JOIN (teams t 
                JOIN (plays_at pa 
                    JOIN locations 
                    USING(location_id)) 
                USING (team_id)) 
            USING (team_id)) 
        USING (player_id) 
        WHERE player_id = '$player_id';
    ");
    foreach($player as $p){
        $team_name = $p["team_name"];
        $player_name = $p["first_name"] . " " . $p["last_name"];
        if($p["suffix"]!= null){
            $player_name = $player_name . " " . $p["suffix"];
        }
        $position = $p["position"];
        $number = $p["jersey_num"];
        $team_abbrv = $p["team_abbrv"];
        $birth_date = $p["birthday"];
        $countrydb = $db -> query("
            SELECT c.two_letter_code, c.country_name 
            FROM players p 
            JOIN (player_country pc 
                JOIN countries c 
                USING(country_id)) 
            USING (player_id) 
            WHERE p.player_id = '$player_id';
        ");
        foreach($countrydb as $c){
            $country = strtolower($c["two_letter_code"]);
            $country_name = $c["country_name"];
        }
        $experience = $p["experience"];
        $college = $p["college"];
        $color = $p["team_color"];
        $location = $p["location_name"];
    } 
?>

<div id="player-all-details" style="background-color:<?=$color?>">
    <div id="image-section">
        <div class="team-logo">
            <img src="files/images/Team Logos/<?=$team_name?>.png" style="height: 300px;" alt="NBA Sample Image" id="team-image"/>
        </div>
        <div id="player-image">
            <?php 
                $file_path = "";
                $extensions = ["png", "jpg", "jpeg"];
                foreach ($extensions as $ext) {
                    if (file_exists("files/images/players/$player_id.$ext")) {
                        $file_path = "files/images/players/$player_id.$ext";
                        break;
                    }
                }
                $file_path = $file_path ?: "files/images/default.png";
            ?>
            <img src="<?= $file_path ?>" style="height: 100%; width: auto" alt="NBA Sample Image"/>
        </div>
        <div id="player-main-text">
            <div><?=$location." ".$team_name?>|#<?=$number?>|<?=$position?></div>
            <div id="profile_name"><?=$player_name?></div>
        </div>  
    </div>
    <div id="stats-container">
        <div class = "item item-1"><div class="data"><div>Experience</div><div><?=$experience?></div></div></div>
        <div class = "item item-2"><div class="data"><div>College</div><div><?=$college?></div></div></div>
        <div class = "item item-3"><div class="data"><div>Birthday</div><div><?=$birth_date?></div></div></div>
        <div class = "item item-4">
            <div class="data">
                <div>Country</div>
                <div>
                    <img src="https://flagcdn.com/w20/<?=$country?>.png" srcset="https://flagcdn.com/w40/<?=$country?>.png 2x" width="20" alt="Flag"> 
                    <?=$country_name?>
                </div>  
            </div>
        </div> 
    </div>
</div>

<?php include("bottom.html")?>