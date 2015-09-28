$(document).ready(function(){
  $("a[class='create-adventure']").on("click", function(){
    var location = $(this).data("location");
    var Latitude = $(this).data("latitude");
    var Longitude = $(this).data("longitude");
    var image = $(this).data("image");
    var userId = $(this).data("user");
    console.log(location,Latitude,Longitude,image,userId);
    $.ajax({
      type: "POST",
      url: "/adventures",
      data: {adventure: {user_id: userId, location_name: location, latitude: Latitude, longitude: Longitude, location_img_url: image}},
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
