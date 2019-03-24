$(function() {

  $('.menubar .image_avatar').click(function() {
    $('.menu-dropdown_edit').addClass('menu-dropdown_shown')
    $('.menu-dropdown_add').removeClass('menu-dropdown_shown')
  })

  $('.icon_add').click(function() {
    $('.menu-dropdown_add').addClass('menu-dropdown_shown')
    $('.menu-dropdown_edit').removeClass('menu-dropdown_shown')
  })

  $('.menu-dropdown_add').mouseleave(function() {
    $(this).removeClass('menu-dropdown_shown')
  })

  $('.menu-dropdown_edit').mouseleave(function() {
    $(this).removeClass('menu-dropdown_shown')
  })

  $(window).click(function () {
    $('.search__textfield').removeClass('search__textfield_opened')
  })

  $('.search__submit').click(function(event) {
    $('.search__textfield').addClass('search__textfield_opened')
    event.stopPropagation()
  })

})
