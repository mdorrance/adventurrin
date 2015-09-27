$(document).ready(function(){
  $("a[class='create-adventure']").on("click", function(){
    var adventureParams = $(this).data("adventure");

    $.ajax({
      type: "POST",
      url: "/adventures",
      data: adventureParams,
      success: function(adventure) {
        renderAdventure(adventure)
      }
    });
  });
});

function renderAdventure(adventure) {
  $("#saved-adventures").append(
    "<div class='panel panel-default'><div class='row'><div class='panel-body'><div class='col-sm-4'><img class='img-responsive' src='"
      + adventure.location_img_url
      + "'></div><div class='col-sm-8'><h5 class='text-left'>"
      + adventure.location_name
      + "</h5></div></div></div></div>"
  )
}
