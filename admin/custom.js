$(document).ready(function(){
  $(".check_username").keyup(function(e){
    var username = $(".check_username").val();
    $.ajax({
      type: "POST",
      url: "code.php",
      data: {
        "check_submit_btn": 1,
        "username": username,
      },
      success: function (response){
        $(".error_username").text(response);
      }
    })
  });

  $(".check_username_edit").keyup(function(e){
    var username = $(".check_username_edit").val();
    var current_username = $(".current_username").val();
    $.ajax({
      type: "POST",
      url: "code.php",
      data: {
        "check_submit_btn_6": 1,
        "username": username,
        "current_username": current_username,
      },
      success: function (response){
        $(".error_username").text(response);
      }
    })
  });

  $(".check_jerseynumber, .check_team").on("input change", function(e){
    var jerseyNumber = $(".check_jerseynumber").val();
    var team_id = $(".check_team").val();
    $.ajax({
      type: "POST",
      url: "code.php",
      data: {
        "check_submit_btn_2": 1,
        "jerseyNumber": jerseyNumber,
        "team_id": team_id,
      },
      success: function(response){
        $(".error_jerseynumber").text(response);
      }
    })
  });

  $("check_conference").on("input change", function(e){
    var conference = $(".check_conference").val();
    $.ajax({
      type: "POST",
      url: "code.php",
      data: {
        "check_submit_btn_3": 1,
        "conference": conference,
      },
      success: function(response){
        $(".error_conference").text(response);
      }
    })
  });

  $(".check_teamname_edit").keyup(function(e){
    var teamname = $(".check_teamname_edit").val();
    var current_team_name = $(".current_teamname").val();
    $.ajax({
      type: "POST",
      url: "code.php",
      data: {
        "check_submit_btn_4": 1,
        "teamname": teamname,
        "current_team_name": current_team_name,
      },
      success: function(response){
        $(".error_teamname").text(response);
      }
    })
  });

  $(".check_teamname").keyup(function(e){
    var teamname = $(".check_teamname").val();
    $.ajax({
      type: "POST",
      url: "code.php",
      data: {
        "check_submit_btn_5": 1,
        "teamname": teamname,
      },
      success: function(response){
        $(".error_teamname").text(response);
      }
    })
  });

  $(".check_location").keyup(function(e){
    var location = $(".check_location").val();
    $.ajax({
      type: "POST",
      url: "code.php",
      data: {
        "check_submit_btn_7": 1,
        "location": location,
      },
      success: function(response){
        $(".error_location").text(response);
      }
    })
  });
});