$(function() {

  $('.container_board').hover(function() {
    $(this).find('.more-btn').addClass('more-btn_show')
  })

  $('.section_links-wrapper').hover(function() {
    $(this).find('.more-btn').addClass('more-btn_show')
  })

  $('.container_board').mouseleave(function() {
    $(this).find('.more-btn').removeClass('more-btn_show')
  })

  $('.more-btn').click(function() {
    $(this).addClass('more-btn_show');
    $(this).parent().find('.more-menu').addClass('show-more-menu')
  })

  $('.container-menu').mouseleave(function() {
    $(this).parent().find('.more-menu').removeClass('show-more-menu')
  })

});
