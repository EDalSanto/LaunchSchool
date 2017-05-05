$(function() {
  var $blinds = $('[id^=blind]');
  var speed = 250;  // How fast we run the animation to completion
  var delay = 1500; // How long to wait between completions
  
  function playComic() {
    $blinds.each(function(index) {
      var $blind = $blinds.eq(index); 
      var blindDelay = delay * (index + 1) + speed; 
      $blind.delay(blindDelay).animate({
        top: "+=" + $blind.height(),
        height: 0,
      }, 250) 
    });
  }

  $('a').on('click', function(e) {
    e.preventDefault();

    $blinds.finish(); 
    // Undo playcomic() style affects by removing style attribute
    $blinds.removeAttr('style');
    playComic();
  });

  playComic();
});
