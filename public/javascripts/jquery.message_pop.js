(function( $ ){

  $.fn.pop_message = function() {
  
    // there's no need to do $(this) because
    // "this" is already a jquery object

    // $(this) would be the same as $($('#element'));
        
    this.fadeIn('normal', function(){

      // the this keyword is a DOM element

    });

  };
})( jQuery );

