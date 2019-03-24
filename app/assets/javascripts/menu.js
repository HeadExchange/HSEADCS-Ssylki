$(function() {

  $('.section_board').hover(function() {
    $(this).find('.button-more').addClass('button-more_shown')
  })

  $('.section_links-wrapper').hover(function() {
    $(this).find('.button-more').addClass('button-more_shown')
  })

  $('.section_board').mouseleave(function() {
    $(this).find('.button-more').removeClass('button-more_shown')
  })

  $('.section_boardInLinks').mouseleave(function() {
    $(this).find('.button-more').removeClass('button-more_shown')
  })

  $('.section_boardInLinks').hover(function() {
    $(this).find('.button-more').addClass('button-more_shown')
  })

  $('.button-more').click(function() {
    $(this).addClass('button-more_shown');
    $(this).parent().find('.menu-dropdown').addClass('menu-dropdown_shown')
  })

  $('.container__menu-dropdown').mouseleave(function() {
    $(this).parent().find('.menu-dropdown').removeClass('menu-dropdown_shown')
  })

  $('.link__settings').click(function() {
    $(this).parent().find('.menu-dropdown').addClass('menu-dropdown_shown')
  })

  $('.link__item').mouseleave(function() {
    $(this).find('.menu-dropdown').removeClass('menu-dropdown_shown')
  })

  $('.icon_sharelink').click(function() {
    $(this).parent().find('.container__share-url').addClass('container__share-url_shown')
  })

  $('.container__share-url').mouseleave(function() {
    $(this).removeClass('container__share-url_shown')
  })

})
