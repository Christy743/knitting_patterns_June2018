$(function() {
  console.log('patterns js loaded')
  $("form.button_to").on("submit", function(e) {
    alert("You clicked this button");
    e.preventDefault();
  });
})
