// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function appendErrors(xhr) {
  var validation_messages = xhr.responseJSON;
  for (var key in validation_messages) {
    if (validation_messages.hasOwnProperty(key)){
      $('#' + key).after('<small class="error">' + validation_messages[key] + '</small>');
    }
  }
};

function listenToForm() {
  $(".new_user").on("ajax:success", function(e, data, status, xhr) {
    
  }).bind("ajax:error", function(e, xhr, status, error) {
    $('small.error').remove();
    appendErrors(xhr);
  });
};

$(function() {
  listenToForm();
});
