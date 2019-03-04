$(function(){
  let page = 2

  // $("#loadMoreBoards").on("click", function() {
  function loadMoreBoards() {
    let link = "boards?page=" + page

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
    let element = document.getElementById("loadMoreBoards")
    let rect = element.getBoundingClientRect()

    // console.log(windowHeight, rect)

    if ((rect.top - 200) <= windowHeight) {
      loadMoreBoards()
    }
  })
})
