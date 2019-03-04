// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require select2
//# require turbolinks
//= require_tree .

$(function() {

  $('#link_board_id').select2 ({
    placeholder: "Выберите подборку"
  })

  $('.link__settings').click(function() {
    $(this).parent().find('.menu-dropdown').addClass('menu-dropdown_shown')
  })

  $('.link__item').mouseleave(function() {
    $(this).find('.menu-dropdown').removeClass('menu-dropdown_shown')
  })

});
