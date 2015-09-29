$(document).ready(function(){
  $(".feed-image").on("click", function(event){
    modalId = $(event.currentTarget).data("target")
    $(modalId).modal("show")
  })
})
