$(function() {

  $('#team li a').click(function(e) {
    e.preventDefault();
    // this => the element being clicked
    var $e = $(this);

    // modal position - scrollTop() calculates current scrolled distance from
    // window top
    $e.siblings('.modal').css({
      top: $(window).scrollTop() + 30,
    });

    // display all the previous sibling divs of target
    // note how don't need to change display
    $e.prevAll('div').fadeIn(400);
  });
  
  // Remove modal - click
  $('.modal-layer, a.close').click(function(e) {
    e.preventDefault();

    $('.modal-layer, .modal').filter(":visible").fadeOut(400);
  });

  // Remove modal - esc
  $(document).keyup(function(e) {
    if (e.which === 27) {
      $('.modal-layer, .modal').filter(":visible").fadeOut(400);
    }
  });

});
