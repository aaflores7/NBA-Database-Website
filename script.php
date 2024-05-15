<style>
  @import url("https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap");
  @import url("https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;400;600&display=swap");
</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<linl rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"/>

<linl rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>

<script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<?php 
  if(isset($_SESSION["status"]) && $_SESSION["status"]!=""){
    ?>
    <script>
      swal({
        title: "<?=$_SESSION["status"]?>",
        // text: "You clicked the button!",
        icon: "<?=$_SESSION["status_code"]?>",
        button: "OK Done!",
      });
    </script>
    <?php
    unset($_SESSION["status"]);
  }
?>
