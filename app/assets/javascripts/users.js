// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

(function ($, window, document, undefined) {

  var errorTemplate = '<small class="error">{validation-messages}</small>'

  function appendErrors(xhr) {
    var validationMessages = xhr.responseJSON;
    for (var key in validationMessages) {
      if (validationMessages.hasOwnProperty(key)){
        var $input = $('#' + key);
        $input.addClass('error')
        $input.after(errorTemplate.replace('{validation-messages}', validationMessages[key]));
      }
    }
  };

  (function listenToForm() {
    $("form").on("ajax:success", function(e, data, status, xhr) {
      
    }).bind("ajax:error", function(e, xhr, status, error) {
      debugger;
      $('input.error').removeClass('error');
      $('small.error').remove();
      appendErrors(xhr);
    });
  })();

}(jQuery, this, this.document));
