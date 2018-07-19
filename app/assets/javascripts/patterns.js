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
      //Put the list in alphabetical order using sort?
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
        //debugger
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
      this.content = pattern.content
      this.comments = pattern.comments
    }

    Pattern.prototype.formatIndex = function() {
      let patternHtml = `
        <a href="/patterns/${this.id}" data-id="${this.id}" class="show_pattern"><li>${this.name}</li></a>
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

$(function() {
  $(".pattern_list").on("click", function(e) {
    e.preventDefault();

    $.ajax({
      type: "GET",
      url: this.href,
      dataType: 'json',
    }).success(function( response ){
      //debugger
      //$(".more_info").hide();
      //var id = $(this).response("id");
      //$("div#more").append(response);
      //$("input[type=click]").removeAttr('disabled');
      let patterns = response.forEach(pattern => {
        let newPattern = new Pattern(pattern)
        let patternHtml = newPattern.formatIndex()
        $('#more').append(patternHtml)
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
      <a href="/patterns/${this.id}" data-id="${this.id}" class="show_pattern"><li>${this.content}</li></a>
    `
    return patternHtml
  }
})
