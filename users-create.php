<?php
  include("common.php"); 
  $successMessage = "";
  $errorMessage = "";
  if($_SERVER["REQUEST_METHOD"]=="POST"){
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $suffix = $_POST["suffix"];
    if(empty($suffix)){
      $suffix = NULL;
    }
    $username = $_POST["username"];
    $role = $_POST["role"];
    $password = $_POST["password"];
    $cpassword = $_POST["confirm_password"];
    do{
      if(empty($password) || empty($username) || empty($role)){
        $errorMessage = "All the fields are required";
        break;
      }else if($password != $cpassword){
        $errorMessage = "Passwords do not match";
        break;
      }else{
        $query = "SELECT user_id from users where username='$username';";
        $check = $db -> query($query);
        $check_id = $check -> fetch();
        if($check_id){
          $errorMessage = "Username already exists";
          break;
        }
        $query = "INSERT INTO users (first_name, last_name, suffix, password, username, role) VALUES ('$first_name', '$last_name', '$suffix', '$password', '$username', '$role');";
        $db -> query($query);
        
        $first_name="";
        $last_name="";
        $suffix="";
        $password="";
        $cpassword="";
        $username="";
        $role="";
  
        $successMessage = "User created successfully";
        header("Location: /nba database/index.php");
        exit;
      }
    }while(false);
  }
?>

<?php 
  include("top.php");
  ?>
  <div id="index-page-content">
    <div class="card-header">
      <div>
        <div>
          <h1>
            Create NBA ID
          </h1>
        </div>
        <div id="intro-text">
          <div>Your NBA ID grants access to our nba database.</div>
          <div>Already have an account? <a href="login.php">Login</a></div>
        </div>
      </div>
    </div>
    <div id="frame_login">
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
      <div class="center">
        <div class="col-md-12">
          <div id="sign-up-form">
            <form action="users-create.php" method="post">
              <div class="mb-3">
                <input type="text" class="form-control check_username" placeholder="Username" name="username">
                <small class="error_username" style = "color:red;"></small>
              </div>
              <div class="mb-3">
                <input type="password" class="form-control" placeholder="Password" name="password" required>
              </div>
              <div class="mb-3">
                <input type="password" class="form-control" placeholder="Confirm Password" name="confirm_password" required>
              </div>
              <div class="mb-3">
                <label>First Name</label>
                <input type="text" class="form-control" placeholder="Enter First Name" name="first_name">
              </div>
              <div class="mb-3">
                <label>Last Name</label>
                <input type="text" class="form-control" placeholder="Enter Last Name" name="last_name">
              </div>
              <div class="mb-3">
                <label>Suffix</label>
                <input type="text" class="form-control" placeholder="Suffix" name="suffix">
              </div>
              <div class="mb-3">
                <label>Select Role</label>
                <select name="role" class="form-select">
                  <option value="user" selected="selected">User</option>
                  <option value="admin">Admin</option>
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
              <div class="mb-3">
                <button type="submit" name="createUser" class="btn btn-primary btn-submit">Create Account</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>