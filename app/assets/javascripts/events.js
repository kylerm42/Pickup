(function() {
  $(function() {
    return $('a.load-more-events').on('inview', function(e, visible) {
      if (!visible) {
        return;
      }
      return $.getScript($(this).attr('href'));
    });
  });
 
}).call(this);