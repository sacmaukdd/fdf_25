$(document).on('turbolinks:load', function() {
  $(document).ready(function() {
    $('#select').click(function(){
      $('#form_suggest').submit();
    });
  });
});
