$(function(){
  let page = 2

  // $("#loadMoreLinks").on("click", function() {
  function loadMoreLinks() {
    let link = "links?page=" + page

    $.ajax({
      url: link,
      dataType: "script"
    }).done(function(data) {
      console.log("success", data)
    }).fail(function() {
      console.log("error")
    }).always(function() {
      console.log("complete")
    })

    page = page + 1
  }
  // })

  $(document).on("scroll", function() {
    let windowHeight = $(window).height()
    var element = document.getElementById("loadMoreLinks")
    var rect = element.getBoundingClientRect()

    console.log(windowHeight, rect)

    if ((rect.top - 200) <= windowHeight) {
      loadMoreLinks()
    }
  })
})
