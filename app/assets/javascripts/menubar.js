$(function() {

  $('.image_avatar').click(function() {
    $('.menu-dropdown_edit').addClass('menu-dropdown_shown')
  })

  $('.menu-dropdown__close').click(function() {
    $('.menu-dropdown_edit').removeClass('menu-dropdown_shown')
  })

  $('.icon_add').click(function() {
    $('.menu-dropdown_add').addClass('menu-dropdown_shown')
    $('.menu-dropdown_edit').removeClass('menu-dropdown_shown')
  })

  $('.menu-dropdown__close').click(function() {
    $('.menu-dropdown_add').removeClass('menu-dropdown_shown')
  })

});
