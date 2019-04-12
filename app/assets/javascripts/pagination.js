// let page = 2
//
// function getAjaxRoute() {
//   if ($('body').hasClass('boards')) {
//     if ($('body').hasClass('index')) {
//       return 'boards'
//     } else if ($('body').hasClass('show')) {
//       return ''
//     }
//   }
// }
//
// function loadMoreBoards() {
//   let link = getAjaxRoute() + "?page=" + page
//
//   $.ajax({
//     url: link,
//     dataType: "script"
//   }).done(function(data) {
//     console.log("success")
//   }).fail(function() {
//     console.log("error")
//   }).always(function() {
//     console.log("complete")
//   })
//
//   page = page + 1
// }
//
// $(function(){
//   $(document).on("scroll", function() {
//     let windowHeight = $(window).height()
//     let element = document.getElementById("loadMoreBoards")
//     let rect = element.getBoundingClientRect()
//
//
//     if ((rect.top - 200) <= windowHeight) {
//       loadMoreBoards()
//     }
//   })
// })
