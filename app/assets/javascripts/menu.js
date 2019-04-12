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

  $('.icon_privacy').click(function() {
    $(this).parent().find('.container__share-url').addClass('container__share-url_shown')
    $(this).parent().find('.share-url').addClass('opened')
  })

  $('.container__share-url').mouseleave(function() {
    $(this).removeClass('container__share-url_shown')
    $(this).parent().find('.share-url').removeClass('opened')
  })

  $('.icon__bookmark').click(function() {

    const bookmarktoggle = $(".icon__bookmark")

    if (bookmarktoggle.src="/assets/bookmark.svg") {
      bookmarktoggle.src="/assets/blackbookmark.svg"
    }

    else if (bookmarktoggle.src="/assets/blackbookmark.svg") {
      bookmarktoggle.src="/assets/bookmark.svg"
    }
  })

})
