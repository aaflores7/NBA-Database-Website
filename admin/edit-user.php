<?php 
  include("menu.php");
  include("../common.php");
?>
<?php
  $user_id = "";
  $first_name = "";
  $last_name = "";
  $suffix = "";
  $password = "";
  $username = "";
  $role = "";
  $errorMessage = "";
  $successMessage = "";

  if ($_SERVER["REQUEST_METHOD"] == "GET"){
    if(!isset($_GET["user_id"])){
      header("Location: /nba database/users.php");
      exit;
    }

    $user_id = $_GET["user_id"];
    $player = $db -> query("SELECT * from users where user_id = '$user_id';
    ");
    $row = $player -> fetch();

    if(!$row){
      header("Location: /nba database/index.php");
      exit;
    }

    $first_name = $row["first_name"];
    $last_name = $row["last_name"];
    $suffix = $row["suffix"];
    $username = $row["username"];
    $password = $row["password"];
    $role = $row["role"];
  }else{
    $user_id = $_POST["user_id"];
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $suffix = $_POST["suffix"];
    $username = $_POST["username"];
    $password = $_POST["password"];
    $role = $_POST["role"];
    $current_username = $_POST["current_username"];

    do{
      if(empty($username) || empty($password) || empty($role)){
        $errorMessage = "All the fields are required";
        break;
      }else if($username != $current_username){
        $query = "SELECT user_id from users where username='$username';";
        $check = $db -> query($query);
        $check_id = $check -> fetch();
        if($check_id){
          $errorMessage = "Username already exists";
          break;
        }
      }
      $query = "UPDATE users SET first_name = '$first_name', last_name = '$last_name', suffix = '$suffix', username = '$username', password = '$password', role = '$role' WHERE user_id = '$user_id';";
      $result = $db -> query($query);
      $successMessage = "Saved information successfully";
      header("Location: /nba database/admin/users.php");
      exit;
    }while(false);
  }

?>
<?php 
  $roles = $db -> query("SELECT DISTINCT role FROM users;");
?>

<div id="frame">
  <h2>Edit User Information</h2>
  <?php
    if ($errorMessage != ""){
      ?>
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
          <?=$errorMessage?>
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      <?php
    }
  ?>
  <form method="post" action = "edit-user.php">
    <input type="hidden" name="user_id" value="<?=$user_id?>">
    <input type="hidden" class="current_username" name="current_username" value="<?=$username?>">
    <div class="fill-up-info">
      <div>
        <label>Username</label>
        <input type="text" name="username" class="check_username_edit" id="name" value="<?=$username?>" placeholder="username">
        <small class="error_username" style = "color:red;"></small>      
      </div>
      <div>
        <label>Password</label>
        <input type="text" name="password" id="name" value="<?=$password?>" placeholder="password">
      </div>
      <div>
        <label>Full Name</label>
        <input type="text" name="first_name" id="name" placeholder = "First name" value="<?=$first_name?>">
        <input type="text" name="last_name" id="name" placeholder= "Last name" value="<?=$last_name?>">
        <input type="text" name="suffix" id="name" placeholder= "Suffix" value="<?=$suffix?>">
      </div>
      <div>
        <label for="role">Role</label>
        <select name ="role">
         <?php 
            foreach($roles as $row){
              if ($row["role"] == $role){
                ?>
                <option value="<?=$row["role"]?>" selected="selected"><?=$row["role"]?></option>
                <?php
              }else{
                ?>
                <option value="<?=$row["role"]?>"><?=$row["role"]?></option>
                <?php
              }
            }
          ?>
        </select>
      </div>
      <?php
      if ($successMessage != ""){
        ?>
          <div class="alert alert-success alert-dismissible fade show" role="alert">
            <?=$successMessage?>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
          </div>
        <?php
      }
    ?>
      <div>
        <button type = "submit" class = "btn btn-primary">Save</button>
        <a class= "btn btn-primary" href="users.php">Cancel</a>
      </div>
    </div>
  </form>
</div>