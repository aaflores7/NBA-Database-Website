$(document).ready(function (){
  $("#example").DataTable();
  $(".check_username").keyup(function(e){
    // alert("Hello! I am an alert box!!"); 
    var username = $(".check_username").val();
    // alert(username); 
    $.ajax({
      type: "POST",
      url: "admin/code.php",
      data: {
        "check_submit_btn": 1,
        "username": username,
      },
      success: function (response){
        $(".error_username").text(response);
      }
    })
  });
});