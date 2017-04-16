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

//repeatedCharacters('Programming');    // { r: 2, g: 2, m: 2 }
//repeatedCharacters('Combination');    // { o: 2, i: 2, n: 2 }
//repeatedCharacters('Pet');            // {}
//repeatedCharacters('Paper');          // { p: 2 }
//repeatedCharacters('Baseless');       // { s: 3, e: 2 }

function getSelectedColumns(numbers, cols) {
  var result = [];
  for (var i = 0, outerLength = numbers.length; i < outerLength; i++) {
    for (var j = 0, innerLength = cols.length; j < innerLength; j++) {
      if (!result[j]) {
        result[j] = [];
      }

      result[j][i] = numbers[i][cols[j]];
    }
  }

  return result;
}

// Given array of number arrays
var array1 = [[1, 2, 3], [4, 5 ,6], [7, 8 ,9]];
var array2 = [[1, 2, 3], [1, 2, 3], [1, 2, 3]];

// array1 in row/column format
// [[1, 2, 3],
//  [4, 5, 6],
//  [7, 8, 9]]

//console.log(getSelectedColumns(array1, [0]));     // [[1]]; expected [[1, 4, 7]]
//console.log(getSelectedColumns(array1, [0, 2]));  // [[1, 4], [3, 6]]; expected [[1, 4, 7], [3, 6, 9]]
//console.log(getSelectedColumns(array2, [1, 2]));  // [[2, 2], [3, 4]]; expected [[2, 2, 2], [3, 3, 3]]

function makeDoubler(caller) {
  return function(num) { 
    console.log("This function was called by " + caller + ".");
    return num + num;
  }
}

var doubler = makeDoubler('Victor');
console.log(doubler(5));                 // 10
// This function was called by Victor.
