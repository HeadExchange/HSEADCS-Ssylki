$(function() {

  $('.container_board').hover(function() {
    $(this).find('.more-btn').addClass('more-btn_show')
  })

  $('.container_board').mouseleave(function() {
    $(this).find('.more-btn').removeClass('more-btn_show')
  })

  $('.more-btn').hover(function() {
    $(this).parent().find('.more-menu').addClass('show-more-menu')
  })

  $('.container-menu').mouseleave(function() {
    $(this).parent().find('.more-menu').removeClass('show-more-menu')
  })

  $('#more-btn-link').hover(function() {
    $(this).parent().find('.link__settings').addClass('link__settings_show')
  })

  $('#more-btn-link').mouseleave(function() {
    $(this).parent().find('.link__settings').removeClass('link__settings_show')

  $('.link__settings').hover(function() {
    $(this).addClass('link__settings_show')
  })
  
  })

});
