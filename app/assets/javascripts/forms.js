$(function() {

  $('#togglePasswordVisibility').click(function() {

    let toggle = document.getElementById("togglePasswordVisibility")
    let password = document.getElementById("password")

    toggle.src="/assets/eye-off.svg";

    if (password.type === "password") {
      password.type = "text";
    }
    else {
      password.type = "password";
      toggle.src="/assets/eye.svg";
    }
  })

  /* Disable Button */

  // $(':input[type="submit"]').prop('disabled', true);
  // $('input[type!="submit"]').keyup(function() {
  //   if($(this).val() != '') {
  //      $(':input[type="submit"]').prop('disabled', false);
  //   }
  // })

})
