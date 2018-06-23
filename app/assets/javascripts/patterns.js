$(function() {
  $(".pattern_list").on("click", function(e) {
    e.preventDefault();
    history.pushState(null, null, "patterns")

    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      url: this.href,
      dataType: 'json',
      data: $(this).serialize(),
    }).success(function( response ) {
      $(".pattern_list").html("All Patterns")
        let patterns = response.forEach(pattern => {
          let newPattern = new Pattern(pattern)
          let patternHtml = newPattern.formatIndex()
          $('#all_patterns').append(patternHtml)
        });
      });
  });

  $(document).on('click', ".show_pattern", function(e) {
    e.preventDefault()
    let id = $(this).attr("data-id")
    fetch(`/patterns/${id}.json`)
    .then(response => response.json())
    .then(pattern => {
      console.log(pattern)
    })
  })
})

function Pattern(pattern) {
  this.name = pattern.name
  this.id = pattern.id
}

Pattern.prototype.formatIndex = function() {
  let patternHtml = `
    <a href="/patterns/${this.id}" data-id="${this.id}" class="show_pattern"><h1>${this.name}</h1></a>
  `
  return patternHtml
}



//$(function() {
//  $("form.button_to").on("submit", function(e) {
//      e.preventDefault();

//    $.ajax({
//      type: ($("input[name='_method']").val() || this.method),
//      url: this.action,
//      data: $(this).serialize(),
//    }).success(function( params ) {
        //var pattern = params;
        //$(".fav").text(pattern["delete"]);
//         if ( params === "delete" ) {
          //   $("form.button_to").html("hello")
           //$('#remove').on('click', function() {
           	//$('.favorite').remove();
             //$('#remove').addClass('hidden')
             //$('#add').removeClass('hidden')
//             $("You have unfavorited this pattern").append("#remove") ;
//           }


        // } else if ( params === "put") {
        //   return "You have favorited this pattern." ;
         //} else {
        //   return "This is not working?";
        // }; //closing of if statement
      //}); //closing of success params function
  //}); //closing of form button submit function
//}) //closing of opening function

//$('#add').on('click', function() {
//	$('#root').append("<div class='favorite'></div>");
//  $('#remove').removeClass('hidden')
//  $('#add').addClass('hidden')
//})

//$('#remove').on('click', function() {
//	$('.favorite').remove();
//  $('#remove').addClass('hidden')
//  $('#add').removeClass('hidden')
//})
