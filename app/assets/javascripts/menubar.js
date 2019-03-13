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

  $('#modeSwitcher').click(function() {
    $('body').addClass('dark-mode')
  })

  // $('.search__submit').click(function() {
  //   $('.search__textfield').addClass('search__textfield_opened')
  // })

})
