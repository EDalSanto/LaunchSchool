$(function() {
  var $thumbnails = $('ul img');
  var $largeImages = $('figure');

  $thumbnails.click(function() {
    var $e = $(this);
    var clickedImgIndex = $thumbnails.index($e);
    var $visible = $('figure:visible');
    
    $('.active').removeClass('active');
    $e.addClass('active');

    $visible.stop().fadeOut(5000);
    $largeImages.eq(clickedImgIndex).delay(5000).fadeIn(5000);
  });
});
