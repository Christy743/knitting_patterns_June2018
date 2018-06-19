$(function() {
  $("form.button_to").on("submit", function(e) {
    //alert("You clicked SUBMIT")
    //url = this.action
    //data = $(this).serialize();
      //debugger
          //{
    //  'authenticity_token': $("input[name='authenticity_token']").attr("value"),
    //  'favorite': $("input[value='put']").attr("value"),
    //  'unfavorite': $("input[value='delete']").attr("value")
    //};

    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      url: this.action,
      data: $(this).serialize(),
      success: function(response) {
        //console.log(response)
        //callback(response);
        return response.json();

        //work on one, i.e., delete to see how that looks
        //like Avi's video in appending to a div or h tag in the view
        //location.action = location.action
        //window.location.reload();
        //location.reload(false)
        //location.reload()
        //debugger
        //What I want to do is have a response of
        //favorite or unfavorite with my toggle button:
        //if (action === put) {
        //  "You have favorited this pattern."
        //} else {
        //  "You have unfavorited this pattern."
        //}
        //var $ul = $("div.comments ul")
        //$ul.append(response)
      }
    });

      //$.ajax({
      //  url: $("form.button_to").attr("action"),
      //  type: "POST",
      //  data: $("form.button_to").serialize(),
      //  success: function() {
      //    alert("You've Favorited This Pattern.")
      //  }
      //});
    e.preventDefault();
  });
})
