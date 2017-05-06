$(function() {
  var $canvas = $('#canvas');
  
  function getFormObject($f) {
    var obj = {};

    $f.serializeArray().forEach(function(input) {
      obj[input.name] = input.value; 
    });
    
    return obj;
  }

  // jQuery function can take optional object for html and css properties of element
  function createElement(inputs) {
    var $d = $('<div />', {
      "class": inputs.shape_type,
      data: inputs, 
      css: { 
        top: parseInt(inputs.start_y, 10),
        left: parseInt(inputs.start_x, 10)
      }
    });

    return $d;
  }

  $('form').submit(function(e) {
    e.preventDefault();

    var inputs = getFormObject($(this));
    var $newDiv = createElement(inputs);

    $canvas.append($newDiv);
  }); 

  function resetElement($element) {
    $element.css({
      top: parseInt($element.data().start_y, 10),
      left: parseInt($element.data().start_x, 10)
    });
  }

  function animateElement($element) {
    $element.animate({
      top: parseInt($element.data().end_y, 10),
      left: parseInt($element.data().end_x, 10)
    }, 1000);
  }

  $('#animate').click(function(e) {
    e.preventDefault();

    var $createdElements = $canvas.find('div');

    $createdElements.each(function() {
      $(this).stop();
      resetElement($(this));
      animateElement($(this));
    });
  });

  $('#stop').click(function() {
    var $createdElements = $canvas.find('div');

    $createdElements.stop();
  });
});
