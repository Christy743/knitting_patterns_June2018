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
      $(".pattern_list").text("All Patterns")
        let patterns = response.forEach(pattern => {
          let newPattern = new Pattern(pattern)
          let patternHtml = newPattern.formatIndex()
          $('#all_patterns').append(patternHtml)
        });
      });
    });

    function Pattern(pattern) {
      this.name = pattern.name
      this.id = pattern.id
      this.content = pattern.content
      this.comments = pattern.comments
    }

    Pattern.prototype.formatIndex = function() {
      let patternHtml = `
        <a href="/patterns/${this.id}" data-id="${this.id}" class="show_pattern"><h1>${this.name}</h1></a>
      `
      return patternHtml
    }
})

 $(function() {
   $("#new_comment").on("submit", function(e) {
     e.preventDefault();

     $.ajax({
       type: this.method,
       url: this.action,
       dataType: 'json',
       data: $(this).serialize(),
     }).success(function( response ){
       $("#comment_content").val(null);
       $("div#comments ul").append(`<li>${response.content}</li>`);
       $("input[type=submit]").removeAttr('disabled');
     });
  });
});

//$(function() {
//  $(".next").on("click", function(e) {
//    e.preventDefault();

//    $.ajax({
//      type: ($("input[name='_method']").val() || this.method),
//      url: this.href,
//      dataType: 'json',
//      data: $(this).serialize(),
//    }).success(function(data){
//      console.log(data)
//    })
//  });
//})

//$(document).on('click', '.next', function() {
//  let id = $(this).attr('data-id');
//  fetch(`patterns/${id}/next`)
//})

  $(function() {
    $("#patt_list").each(function(e) {
      if (e != 0)
        $(this).hide();
    });

    $(".next").click(function() {
      if ($(".patts li:visible").next().length != 0)
          $(".patts li:visible").next().show().prev().hide();
      else {
          $(".patts li:visible").hide();
          $(".patts li:first").show();
      }
      return false;
    });

    $(".prev").click(function() {
      if ($(".patts li:visible").prev().length !=0)
          $(".patts li:visible").prev().show().next().hide();
      else {
          $(".patts li:visible").hide();
          $(".patts li:last").show();
      }
      return false;
    });
  });
