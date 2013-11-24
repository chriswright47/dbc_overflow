// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(function() {
  $('form[data-remote=true]').on('ajax:complete', function(event, response, error) {

    $(this).replaceWith(response.responseText);
  });
  $(document).on('submit', '#new_answer', function(event, response) {
    event.preventDefault();
    url = this.action;
    answer = {body: $(this.answer_body).val()}
    $.post( url, answer, function(response) {
      $('.answer_list').prepend(response);
      $('#new_answer_form').replaceWith('<p>answer successfuly created!</p>');
      $('#new_answer').remove();
    });

  });

});