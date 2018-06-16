$(function() {
  $("form.button_to").on("submit", function(e) {
    debugger
      //$.ajax({
      //  url: this.action,
      //  method: "POST",
      //  url: this.action
      //}).success(function( response ) {
//        $("div.favs").html(response)
      //  });
    e.preventDefault();
  });
})
