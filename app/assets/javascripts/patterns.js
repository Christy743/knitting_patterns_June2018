$(function() {
  $("form.button_to").on("submit", function(e) {
      //$.ajax({
      //  method: "POST",
      //  url: this.action
      //}).success(function( response ) {
//        $("div.favs").html(response)
//        });
    e.preventDefault();
  });
})
