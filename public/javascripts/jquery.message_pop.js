(function( $ ){

  $.fn.pop_message = function() {

    // there's no need to do $(this) because
    // "this" is already a jquery object

    // $(this) would be the same as $($('#element'));

    this.slideDown('normal', function(){

      // the this keyword is a DOM element

    });

    var pop = this

    console.log(this.find('a'))
    this.find('a').click(function() {
      pop.fadeOut('normal')
    })

  };
})( jQuery );

