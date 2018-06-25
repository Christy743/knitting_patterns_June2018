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
      data: $(this).serialize(),
      success: function( response ){
        var $ul = $("div.comments ul")
        $ul.append(response)
        $("#comment_content").val("");
      }
    })
  })
})

$(function() {
  $("form.button_to").on("submit", function(e) {
      e.preventDefault();

    $.ajax({
      type: this.method,
      url: this.action,
      data: $(this).serialize(),
    }).success(function( params ) {
      window.location.reload();
    })
  })
})
