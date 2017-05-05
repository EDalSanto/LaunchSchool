function getLuhnTotal(cc_number) {
  var odd_total = 0;
  var even_total = 0;

  cc_number = cc_number.split("").reverse();
  for (var i = 0, len = cc_number.length; i < len; i++) {
    if (i % 2 == 1) {
      cc_number[i] = (+cc_number[i] * 2) + "";
      if (cc_number[i].length > 1) {
        cc_number[i] = +cc_number[i][0] + +cc_number[i][1];
      }
      else {
        cc_number[i] = +cc_number[i];
      }
      odd_total += cc_number[i];
    }
    else {
      even_total += +cc_number[i];
    }
  }

  return odd_total + even_total;
}

$(function() {
  $("nav a").on("mouseenter", function() {
    $(this).next("ul").addClass('opened');
  });

  $("nav").on("mouseleave", function() {
    $(this).find("ul ul").removeClass('opened');
  });

  $("button, .button").on("click", function(e) {
    e.preventDefault();

    $(this).addClass("clicked");
  });

  $(".toggle").on("click", function(e) {
    e.preventDefault();

    $(this).next(".accordion").toggleClass("opened")
  });

  $("form").on("submit", function(e) {
    e.preventDefault();
    var cc_number = $(this).find("[type=text]").val();
    var total = getLuhnTotal(cc_number);
    var isValid = (total % 10 === 0);

    $(this).find(".success").toggle(isValid);
    $(this).find(".error").toggle(!isValid);
  });

  $("ul a").on("click", function(e) {
    e.preventDefault();

    var monthStones = {
      "January": "garnet",
      "February": "amethyst",
      "October": [ "opal", "tourmaline" ],
      "December": [ "turquoise", "zircon", "tanzanite" ],
    }

    var month = $(this).text(),
        $stone = $("#birthstone"),
        stoneValue = monthStones[month];

    $stone.text('This is your birthstone: ' + stoneValue);
  });
});
