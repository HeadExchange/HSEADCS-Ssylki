$(function() {
  $('.cover a').each(function() {
    $(this).on('click', function(e) {
      e.preventDefault();
      var scrollTo = $(this).attr('href');
      var whitespace = scrollTo == '#s1' ? 70 : 30
      $('html,body').animate({
        scrollTop: $(scrollTo).offset().top - whitespace
      }, 1000);
    });
  });

  $('#buttonClear').click(function() {
    $('.section__pages').addClass('clear')
    $('.page').addClass('clear')
    $('.card').addClass('active')
    $('#buttonClear').hide()
    $('#buttonRefresh').display()
  })

});
