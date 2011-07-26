$(function() {
  $('a.help').colorbox({
    onClosed: function() {
      $.colorbox({
        href: '/help_confirm'
      })
    }
  })

  $('form.help').submit(function() {
    $.colorbox.close()
    return false;
  })
})
