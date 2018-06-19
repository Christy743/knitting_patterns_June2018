$(function() {
  $(".pattern_list").on("click", function(e) {
    e.preventDefault();
    fetch(`/users.json`)
      .then(response => response.json())
      .then(data => console.log(data))
  });

})

//$(function() {
//  $("a.pattern_list").on("click", function(e) {
    //$.ajax({
    //  url: this.href,
    //  datatype: 'script'
    //});

//    e.preventDefault();
//  });
//})
