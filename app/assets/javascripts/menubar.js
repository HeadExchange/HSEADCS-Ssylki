$(function() {

  $('.menubar .image_avatar').click(function() {
    $('.menu-dropdown_settings').addClass('menu-dropdown_shown')
    $('.menu-dropdown_add').removeClass('menu-dropdown_shown')
  })

  $('.icon_add').click(function() {
    $('.menu-dropdown_add').addClass('menu-dropdown_shown')
    $('.menu-dropdown_settings').removeClass('menu-dropdown_shown')
  })

  $('.menu-dropdown_add').mouseleave(function() {
    $(this).removeClass('menu-dropdown_shown')
  })

  $('.menu-dropdown_settings').mouseleave(function() {
    $(this).removeClass('menu-dropdown_shown')
  })

  $(window).click(function () {
    $('.search__textfield').removeClass('search__textfield_opened')
  })

  $('.search__submit').click(function(event) {
    $('.search__textfield').addClass('search__textfield_opened')
    event.stopPropagation()
  })

  $(".menubar_middle__item:not(:has(a))").addClass("active")

  $('.icon_burger').click(function() {
    $(this).removeClass('shown_element')
    $('.menu-dropdown_burger').toggleClass('menu-dropdown_shown')
    $('.icon_close').addClass('shown_element')
  })

  $('.icon_close').click(function() {
    $(this).removeClass('shown_element')
    $('.menu-dropdown_burger').toggleClass('menu-dropdown_shown')
    $('.icon_burger').addClass('shown_element')
  })

  $('.icon_search').click(function() {
    $(this).removeClass('shown_element')
    $('.menu-dropdown_search').toggleClass('menu-dropdown_shown')
    $('.cancel').addClass('shown_element')
  })

  $('.cancel').click(function() {
    $(this).removeClass('shown_element')
    $('.menu-dropdown_search').toggleClass('menu-dropdown_shown')
    $('.icon_search').addClass('shown_element')
  })

})
