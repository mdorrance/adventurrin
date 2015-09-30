$(document).ready(function(){
  $(".feed-image").on("click", function(event){
    modalId = $(event.currentTarget).data("target")
    $(modalId).modal("show");
  })

  $("#location-search").submit(function(event){
    modalId = $(event.currentTarget).data("data")
    $(modalId).modal("show")
    $("#pending-search").modal("show");
  })

  $("#update-feed").click(function(event){
    modalId = $(event.currentTarget).data("data")
    $(modalId).modal("show")
    $("#pending-feed-update").modal("show");
  })
})
