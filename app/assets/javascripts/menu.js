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

  if($(window).width() < 481) {
    $('.edit_close').click(function() {
      $('.link__item').find('.menu-dropdown').removeClass('menu-dropdown_shown')
    })
  } else {
    $('.link__item').mouseleave(function() {
      $(this).find('.menu-dropdown').removeClass('menu-dropdown_shown')
    })
  }

  $('.icon_privacy').click(function() {
    $(this).parent().find('.container__share-url').addClass('container__share-url_shown')
    $(this).parent().find('.share-url').addClass('opened')
  })

  $('.container__share-url').mouseleave(function() {
    $(this).removeClass('container__share-url_shown')
    $(this).parent().find('.share-url').removeClass('opened')
  })

  $('.icon__bookmark').click(function(evt) {

    if (!$(this).hasClass('active')) {
      $(this).attr('src', '/assets/blackbookmark.svg')
      $(this).addClass("active")
    } else {
        $(this).attr('src', '/assets/bookmark.svg')
        $(this).removeClass("active")
    }

    evt.preventDefault()
  })

  $('.menu-privacy__toggle').click(function(evt) {

    if (!$(this).hasClass('active')) {
      $(this).addClass('active')
    } else {
        $(this).removeClass("active")
    }

    evt.preventDefault()
  })

  // $('.button_copy').click(function(evt) {
  //
  //   if (!$('.menu-privacy__toggle.toggle_sharelink').hasClass('active')) {
  //     $('.menu-privacy__toggle.toggle_sharelink').addClass('active')
  //     $(this).addClass('active')
  //   } else {
  //       $('.menu-privacy__toggle.toggle_sharelink').removeClass("active")
  //       $(this).removeClass('active')
  //   }
  //
  //   evt.preventDefault()
  // })

  $('.button_privacy').click(function() {
    if (!$('.container__menu-privacy').hasClass("opened")) {
      $(this).parent().find('.container__menu-privacy').show()
      $(this).parent().find('.container__menu-privacy').addClass("opened")
      $(".container__menu-privacy.opened .share-url").addClass("opened")
    } else {
      $(this).parent().find('.container__menu-privacy').hide()
      $(this).parent().find('.container__menu-privacy').removeClass("opened")
      $(".container__menu-privacy.opened .share-url").removeClass("opened")
    }
  })

  $(document).mouseup(function(e) {
    var container = $(".container__menu-privacy")

    if (!container.is(e.target) && container.has(e.target).length === 0) {
      container.hide()
    }
  })

})
