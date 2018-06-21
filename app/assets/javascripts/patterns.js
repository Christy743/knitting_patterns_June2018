$(function() {
  $("form.button_to").on("submit", function(e) {
      e.preventDefault();

    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      url: this.action,
      data: $(this).serialize(),
    }).success(function( params ) {
         if ( params === "delete" ) {
           alert( "You have unfavorited this pattern." );
         } else {
           alert( "You have favorited this pattern." );
         }; //closing of if statement
      }); //closing of success params function
  }); //closing of form button submit function
}) //closing of opening function
