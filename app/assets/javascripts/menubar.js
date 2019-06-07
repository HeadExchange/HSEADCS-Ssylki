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
    $('.search__textfield').focus();
    event.stopPropagation()
  })

  $('.search__submit').click(function() {
    console.log('hide qs');
    $('.menubar_middle').hide()
  })

  $('body').click(function(event) {
    //if($(event.target).closest('.search').length)
    //  return;
    //else
    //console.log('show qs');
    ($('.menubar_middle').show())
  })

  $(".menubar_middle__item:not(:has(a))").addClass("active")

  $( document ).ready(function() {
    $('.icon_close').hide();
    $('.search_close').hide();
  });

  $('.icon_burger').click(function() {
    $(this).hide();
    $('.burger_menu').addClass('menu-dropdown_shown')
    $('.icon_close').show();
  })

  $('.icon_close').click(function() {
    $(this).hide();
    $('.burger_menu').removeClass('menu-dropdown_shown')
    $('.icon_burger').show();
  })

  $('.icon_search').click(function() {
    $(this).hide();
    $('.menu-dropdown_search').addClass('menu-dropdown_shown')
    $('.search_close').show();
  })

  $('.search_close').click(function() {
    $(this).hide();
    $('.menu-dropdown_search').removeClass('menu-dropdown_shown')
    $('.icon_search').show();
  })

});
