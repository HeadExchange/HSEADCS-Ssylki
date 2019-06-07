$( document ).ready(function() {
  $('.board_actions_popup').hide();
});

$(function() {
  $('.close').click(function() {
    $('.board_actions_popup').hide();
  });

  $('body').click(function(event) {
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
      console.log('blackout');
      $('.popup_blackout').show();
      // redraw_popup($btn_show_popup[0], $popup);
    }
  });
});
