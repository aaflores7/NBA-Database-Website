<?php 
    include("top.php");
    include("common.php");
    if(!isset($_SESSION['username'])){
        header("Location: index.php");
        exit;
    }
?>

<div id="wallpaper">
    <img src="files/images/coaches-wallpaper.png" alt = "NBA Coaches Wallpaper"/>
</div>

<div id="frame">
    <div id=search-bar>
        <h2>All Coaches</h2>
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
                    $teams = $db->query("SELECT *
                    FROM teams t JOIN coached_by cb ON t.team_id = cb.team_id JOIN coaches c ON cb.coach_id = c.coach_id
                    JOIN plays_at pa ON t.team_id = pa.team_id
                    JOIN locations l ON pa.location_id = l.location_id
                    JOIN loc_div ld ON l.location_id = ld.location_id
                    JOIN divisions d ON ld.division_id = d.division_id
                    WHERE d.division_id = ".$d["division_id"].";
                    ");
                    foreach($teams as $t){
                ?>
                <div class = "team">
                    <div class= "team-coach">
                        <img src="files/images/Team Logos/<?=$t["team_name"]?>.png" alt="NBA Sample Image" class="team-logo"/>
                        <img src ="files/images/Coaches/<?=$t["coach_id"]?>.png" alt="coach image" class = "coach-image"/>
                    </div>
                    <div><h4><?=$t["first_name"]." ".$t["last_name"]." ".$t["suffix"]?></h4></div>
                    <div><?=$t["location_name"]?> <?=$t["team_name"]?></div>
                </div>
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