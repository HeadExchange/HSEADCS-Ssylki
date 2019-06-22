$( document ).ready(function() {
  $('.board_actions_popup').hide();
});

$(function() {
  $('.actions_close').click(function() {
    $('.board_actions_popup').hide();
    $('body').css('overflow','auto');
  });

  $('body').click(function(event) {
    $('body').css('overflow','auto');
    //event.preventDefault();

    var $target = $(event.target);
    var is_popup = $target.hasClass('board_actions_popup');
    var inside_popup = $target.parents('.board_actions_popup').length;

    var $btn_show_popup = $target.hasClass('js-ellipsis') ? $target : $target.parents('.js-ellipsis');
    var $popup = $btn_show_popup.parent().find('.board_actions_popup');

    if (!is_popup && !$btn_show_popup.length && !inside_popup)
      $('.board_actions_popup').hide();
    else if ($btn_show_popup.length) {
      $('.board_actions_popup').hide();
      // показать popup
      $popup.show();
      $('body').css('overflow','hidden');
      $('.popup_blackout').addClass("blackout_shown")
      console.log('blackout');
      // redraw_popup($btn_show_popup[0], $popup);
    }
  });

  //$('.privacy_settings').click(function() {
  //  $('.board_actions_popup').hide();
  //  $('.board_actions_privacy').show();
  //  $('body').css('overflow','hidden');
  //});

  $('.privacy_settings').click(function() {
    console.log('menu privacy should appear');
    var privacyContainer = $(this).parents(".main.mobile").find(".container__menu-privacy")

    if (!$('.container__menu-privacy').hasClass("opened")) {
      privacyContainer.show().addClass("opened")
      $(".container__menu-privacy.opened .share-url").addClass("opened")
    } else {
      privacyContainer.hide().removeClass("opened")
      $(".container__menu-privacy.opened .share-url").removeClass("opened")
    }
    
    $('body').css('overflow','hidden');
    $('.board_actions_popup').hide();

  })

  $(document).mouseup(function(e) {
    var container = $(".container__menu-privacy")

    if (!container.is(e.target) && container.has(e.target).length === 0) {
      container.hide()
    }
  })

  $('.actions_close').click(function() {
    $('.board_actions_privacy').hide();
    $('body').css('overflow','auto');
  });

});
