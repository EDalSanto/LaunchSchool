var games = [{
  "title": "The Legend of Zelda: Majora's Mask 3D",
  "id": 1,
  "category": "Nintendo 3DS"
}, {
  "title": "Super Smash Bros.",
  "id": 2,
  "category": "Nintendo 3DS"
}, {
  "title": "Super Smash Bros.",
  "id": 3,
  "category": "Nintendo WiiU"
}, {
  "title": "LEGO Batman 3: Beyond Gotham",
  "id": 4,
  "category": "Nintendo WiiU"
}, {
  "title": "LEGO Batman 3: Beyond Gotham",
  "id": 5,
  "category": "Xbox One"
}, {
  "title": "LEGO Batman 3: Beyond Gotham",
  "id": 6,
  "category": "PlayStation 4"
}, {
  "title": "Far Cry 4",
  "id": 7,
  "category": "PlayStation 4"
}, {
  "title": "Far Cry 4",
  "id": 8,
  "category": "Xbox One"
}, {
  "title": "Call of Duty: Advanced Warfare",
  "id": 9,
  "category": "PlayStation 4"
}, {
  "title": "Call of Duty: Advanced Warfare",
  "id": 10,
  "category": "Xbox One"
}]

$(function() {
  var $checkboxes = $('input[type=checkbox]');

  $checkboxes.on('change', function(e) {
    var $clickedCheckBox = $(this);
    var gameConsole = $clickedCheckBox.val();
    var isChecked = $clickedCheckBox.prop('checked');
    
    var idsToRemove = games.filter(function(game) {
      return game["category"] === gameConsole;
    }).map(function(game) {
      return game["id"]; 
    });

    idsToRemove.forEach(function(id) {
      var liToHide = $('li[data-id=' + id + ']'); 
      liToHide.toggle();
    });
  });
});
