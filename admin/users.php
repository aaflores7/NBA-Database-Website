<?php 
  include("menu.php");
  include("../common.php");

  $roles = $db -> query("SELECT DISTINCT role FROM users;");

  $query = "SELECT * FROM users";
   if(isset($_GET["role"])){
    if(strlen(trim($_GET["role"]))!=0){
      $query = $query . " WHERE role = '".$_GET["role"]."'";
    }
   }
  $query = $query . ";";
  $rows = $db -> query($query);

?>

<!-- Modal -->
<div class="modal fade" id="addUser" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Add User</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="code.php" method="post">
        <div class="modal-body">
          <div class="mb-3">
            <input type="text" class="form-control check_username" placeholder="Username" name="username" required>
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
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" name="registerbtn" class="btn btn-primary">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>


<div id="frame">
    <div id="filter-bar">
        <form action="users.php" method="GET">
            <?php
            if($_SESSION["role"]=="admin"){?>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addUser">
                    Add User
                </button>
            <?php
            }
            ?>
            <div id="search-bar">
                <h2>Users</h2>
                <input type="submit" value="Search">
            </div>
            <div id="filter">
                <div class="filter-dropdown">
                    <select name ="role" class="filter-dropdown-option">
                        <option value="">All Roles</option>
                        <option value="admin">Admin</option>
                        <option value="user">User</option>
                    </select>
                </div>
            </div>
        </form>
    </div>
    <div>
        <table id="example" class="player-list table table-striped">
            <thead>
                <tr>
                    <th>USERNAME</th>
                    <th>PASSWORD</th>
                    <th>NAME</th>
                    <th>ROLE</th>
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
                        <td><?=$row["username"]?></td>
                        <td><?=$row["password"]?></td>
                        <td>
                            <?=$row["first_name"]?> <?=$row["last_name"]?> <?=$row["suffix"]?>
                        </td>
                        <td><?=$row["role"]?></td>
                        <?php
                        if($_SESSION["role"]=="admin"){?>
                            <td>
                                <a class="btn btn-primary btn-actions" href="edit-user.php?user_id=<?=$row["user_id"]?>">Edit</a>
                                <a class="btn btn-danger btn-actions" href="delete.php?user_id=<?=$row["user_id"]?>">Delete</a>
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
</div>
<?php //include("bottom.html"); ?> 