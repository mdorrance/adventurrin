$(document).ready(function(){
  createAdventure();
  deleteAdventure();
});

function createAdventure() {
  $("a[class='create-adventure']").on("click", function(event){
    var location = $(this).data("location");
    var Latitude = $(this).data("latitude");
    var Longitude = $(this).data("longitude");
    var image = $(this).data("image");
    var userId = $(this).data("user");
    $.ajax({
      type: "POST",
      url: "/adventures",
      data: {adventure: {user_id: userId, location_name: location, latitude: Latitude, longitude: Longitude, location_img_url: image}},
      success: function(adventure) {
        renderAdventure(adventure);
        deleteAdventure();
      }
    });
  });
}
function renderAdventure(adventure) {
  $(".saved-adventures").append(
    "<div class='panel panel-default' data-id='"
      + adventure.id
      + "'><div class='row'><div class='panel-body'><div class='col-sm-4'><img class='img-responsive' src='"
      + adventure.location_img_url
      + "'></div><div class='col-sm-8'><button type='button' class='close pull-right delete-adventure'>&times;</button><h5 class='text-left'>"
      + adventure.location_name
      + "</h5></div></div></div></div>"
  )
}

function deleteAdventure() {
  $(".saved-adventures").delegate(".delete-adventure", "click", function(event){
    event.preventDefault();
    var $adventure = $(this).closest(".panel")
    $.ajax({
      type: "DELETE",
      url: "/adventures/" + $adventure.attr('data-id'),
      success: function() {
        $adventure.remove();
      },
      error: function() {
        $adventure.remove();
      }
    })
  })
}
