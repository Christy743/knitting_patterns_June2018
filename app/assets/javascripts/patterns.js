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

// $(function() {
//   $(".comments li").each(function(e) {
//     if (e != 0)
//       $(this).hide();
//   });
//
//   $(".next").click(function() {
//     if ($(".comments li:visible").next().length != 0)
//         $(".comments li:visible").next().show().prev().hide();
//     else {
//         $(".comments li:visible").hide();
//         $(".comments li:first").show();
//     }
//     return false;
//   });
//
//   $(".prev").click(function() {
//     if ($(".comments li:visible").prev().length !=0)
//         $(".comments li:visible").prev().show().next().hide();
//     else {
//         $(".comments li:visible").hide();
//         $(".comments li:last").show();
//     }
//     return false;
//   });
// });
