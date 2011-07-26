$(function() {
  $('a.help').colorbox({
    onClosed: function() {
      $.colorbox({
        href: '/help_confirm',
        onClosed: function() {
          setTimeout(function() {
            $('#help_response_message').pop_message()
          }, 2000)
        }
      })
    }
  })

  $('form.help').submit(function() {
    $.colorbox.close()
    return false;
  })

  $('a.response').colorbox();
})


