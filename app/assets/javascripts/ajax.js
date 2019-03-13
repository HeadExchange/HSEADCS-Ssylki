$("a[data-remote]").on("ajax:success", function(event) {

  $('#link_board_id').select2({
    placeholder: "Выберите подборку"
  });

})
