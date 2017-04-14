function objectHasProperty(object, checkProperty) {
  for (property in object) {
    if (checkProperty === property) { return true; }
  }

  return false;
}

var pets = {
  cat: 'Simon',
  dog: 'Dwarf',
  mice: null,
};

//console.log(objectHasProperty(pets, 'dog'));       // true
//console.log(objectHasProperty(pets, 'lizard'));    // false
//console.log(objectHasProperty(pets, 'mice'));      // true

function incrementProperty(object, checkProperty) {
  if (objectHasProperty(object, checkProperty)) {
    object[checkProperty] += 1;
  } else {
    object[checkProperty] = 1; 
  }
}

var wins = {
  steve: 3,
  susie: 4,
};

//incrementProperty(wins, 'susie');   // 5
//console.log(wins);                               // { steve: 3, susie: 5 }
//incrementProperty(wins, 'lucy');    // 1
//console.log(wins);                               // { steve: 3, susie: 5, lucy: 1 }

function copyProperties(original, copy) {
  var copied = 0;

  for (property in original) {
    copy[property] = original[property];
    copied++;
  }

  return copied;
}

var hal = {
  model: 9000,
  enabled: true,
};

var sal = {};

//console.log(copyProperties(hal, sal));  // 2
//console.log(sal);                       // { model: 9000, enabled: true }

function wordCount(str) {
  hist = {};
  words = str.split(' ');

  words.forEach(function(word) {
    incrementProperty(hist, word); 
  });

  return hist;
}

//console.log(wordCount('box car cat bag box'));    // { box: 2, car: 1, cat: 1, bag: 1 }

// input: string
// output: histogram of only repeated chars, case insensitive
function repeatedCharacters(string) {
  var lowerCaseString = string.toLowerCase(); 
  var countObject = {};
  
  for (var i = 0; i < lowerCaseString.length; i++) {
    if (lowerCaseString[i] in countObject) {
      countObject[lowerCaseString[i]] += 1;
    } else {
      countObject[lowerCaseString[i]] = 1;
    }
  }

  for (letter in countObject) {
    if (countObject[letter] === 1) {
      delete countObject[letter];
    }
  }

  return countObject;
}

repeatedCharacters('Programming');    // { r: 2, g: 2, m: 2 }
repeatedCharacters('Combination');    // { o: 2, i: 2, n: 2 }
repeatedCharacters('Pet');            // {}
repeatedCharacters('Paper');          // { p: 2 }
repeatedCharacters('Baseless');       // { s: 3, e: 2 }
