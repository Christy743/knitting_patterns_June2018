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

        var patt_array = response.sort(function(pat1, pat2) {
          if (pat1["name"] < pat2["name"]) {
            return -1;
          }
          if (pat1["name"] > pat2["name"]) {
            return 1;
          }
            return 0;
        });

        let patterns = patt_array.forEach(pattern => {
          let newPattern = new Pattern(pattern)
          let patternHtml = newPattern.formatIndex()
          $('#all_patterns').append(patternHtml)
        });
      });
    });

    function Pattern(pattern) {
      this.name = pattern.name
      this.id = pattern.id
    };

    Pattern.prototype.formatIndex = function() {
      let patternHtml = `
        <a href="/patterns/${this.id}" data-id="${this.id}" class="show_pattern"><li>${this.name}</li></a>
      `
      return patternHtml
    };
})

 $(function() {
   $("#new_comment").on("submit", function(e) {
     e.preventDefault();

     $.ajax({
       type: this.method,
       url: this.action,
       dataType: 'json',
       data: $(this).serialize(),
     }).success(function( response ) {
       $("#comment_content").val(null);
       $("div#comments ul").append(`<li>${response.content}</li>`);
       $("input[type=submit]").removeAttr('disabled');
     });
  });
})

$(function() {
  $(".more_info").on("click", function(e) {
    e.preventDefault();

    $.ajax({
      type: this.method,
      url: this.href,
      dataType: 'json',
      data: $(this).serialize(),
    }).success(function( response ) {
      $(".more_info").hide();
      $("#commented").append(`${response.content}`);
    })
  })
})
