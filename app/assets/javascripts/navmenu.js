$(function() {

  $(".navmenu__item").hover(function() {
    $(this).siblings(".navmenu__item").addClass("navmenu__item_hovered");
  }, function() {
    $(this).siblings(".navmenu__item").removeClass("navmenu__item_hovered");
  })

})
