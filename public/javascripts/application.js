$(function() {
  $('a.help').colorbox()

  $('form.help').submit(function() {
    $.colorbox.close()
    return false;
  })
})
