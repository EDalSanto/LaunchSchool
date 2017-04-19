function myForEach(array, func) {
  for (var i = 0; i < array.length; i++) {
    func(array[i]);
  }
}

var min = Infinity;
var getMin = function(value) {
  min = value <= min ? value : min;
};

//myForEach([4, 5, 12, 23, 3], getMin);     // undefined
//console.log(min);                         // 3

function myFilter(array, func) {
  var newArr = [];

  myForEach(array, function(element) {
    if (func(element)) {
      newArr.push(element)
    }
  });

  return newArr;
}

//var isPythagoreanTriple = function(triple) {
//  return Math.pow(triple.a, 2) + Math.pow(triple.b, 2) === Math.pow(triple.c, 2);
//};
//
//console.log(myFilter([{a: 3, b: 4, c: 5}, {a: 5, b: 12, c: 13},
//          {a: 1, b: 2, c: 3}], isPythagoreanTriple));
//// returns [{a: 3, b: 4, c: 5}, {a: 5, b: 12, c: 13}]

function myMap(array, func) {
  var newArr = [];

  array.forEach(function(element) {
    newArr.push(func(element));
  });

  return newArr;
}

//var plusOne = function(n) { return n + 1; };

//console.log(myMap([1, 2, 3, 4], plusOne));       // [2, 3, 4, 5]

//function getBooksTitle(books) {
//  var booksTitle = myMap(books, function(book) {
//    return book.title;
//  });
//  
//  return booksTitle;
//}
//
//var books = [
//  {
//    title: 'JavaScript and JQuery: Interactive Front-End Web Development',
//    author: 'Jon Ducket',
//    edition: '1st',
//  },
//  {
//    title: 'Eloquent JavaScript: A Modern Introduction to Programming',
//    author: 'Haverbeke',
//    edition: '2nd',
//  },
//  {
//    title: 'Learning Web Design: A Beginner\'s Guide to HTML, CSS, JavaScript, and Web Graphics',
//    author: 'Jennifer Niederst Robbins',
//    edition: '4th',
//  },
//];
//
//var getTitle = function(book) {
//  return book['title'];
//};
//
//console.log(getBooksTitle(books));
//// console output
//[
//  'JavaScript and JQuery: Interactive Front-End Web Development',
//  'Eloquent JavaScript: A Modern Introduction to Programming',
//  'Learning Web Design: A Beginner\'s Guide to HTML, CSS, JavaScript, and Web Graphics'
//]

function myReduce(array, func, initial) {
  var res = initial || array[0];

  array.forEach(function(value) {
    res = func(res, value);
  });

  return res;
}

//var smallest = function(result, value) {
//  return result <= value ? result : value;
//};
//
//var sum = function(result, value) {
//  return result + value;
//};
//
//console.log(myReduce([5, 12, 15, 1, 6], smallest));           // 1
//console.log(myReduce([5, 12, 15, 1, 6], sum, 10));            // 49
//
//
//function longestWord(words) {
//  return myReduce(words, longest); 
//}
//
//var longest = function(result, currentWord) {
//  return currentWord.length >= result.length ? currentWord : result;
//};
//
//console.log(longestWord(['abc', 'launch', 'targets', '']));      // "targets"
//

function myOwnEvery(array, func) {
  for (var i = 0; i < array.length; i++) {
    if (!func(array[i])) { 
      return false;
    }
  }

  return true;
}

var isAString = function(value) {
  return typeof value === 'string';
};

//console.log(myOwnEvery(['a', 'a234', '1abc'], isAString));       // true

function areAllNumbers(array) {
  return myOwnEvery(array, isANumber);
}

var isANumber = function(value) {
  return typeof value === 'number';
};

//console.log(areAllNumbers([1, 5, 6, 7, '1']));             // false
//console.log(areAllNumbers([1, 5, 6, 7, 1]));               // true

function totalArea(rectangles) {
  var areas = rectangles.map(function(innerArray) {
    return innerArray[0] * innerArray[1]
  });

  var total = areas.reduce(function(acc, val) {
    return acc + val;
  });

  return total;
}

function totalSquareArea(rectangles) {
  var squares = rectangles.filter(function(innerArray) {
    return innerArray[0] === innerArray[1];
  });

  var areas = squares.map(function(innerArray) {
    return innerArray[0] * innerArray[1]
  });

  var total = areas.reduce(function(acc, val) {
    return acc + val;
  });

  return total;
}

var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

//console.log(totalArea(rectangles)); // 141
//console.log(totalSquareArea(rectangles)); // 121

var newReleases = [
  {
    'id': 70111470,
    'title': 'Die Hard',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/DieHard.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 654356453,
    'boxart': 'http://cdn-0.nflximg.com/images/2891/BadBoys.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
  {
    'title': 'The Chamber',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/TheChamber.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 675465,
    'title': 'Fracture',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/Fracture.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
];

function processReleaseData(data) {
  // Filter out for id and title precense 
  var idAndTitle = data.filter(function(obj) {
    return ('id' in obj && 'title' in obj);
  });

  var res = idAndTitle.map(function(obj) {
    return { id: obj.id, title: obj.title };
  });
  
  return res;
};

//console.log(processReleaseData(newReleases));

// should return:
// [{ id: 70111470, title: 'Die Hard'}, { id: 675465, title: 'Fracture' }];

function octalToDecimal(number) {
  // array of numbers, reduced into decimal
  var digits = number.split('').map(function(stringNum) {
    return parseInt(stringNum);
  });

  var decimal = digits.reverse().reduce(function(acc, value, index) {
    return acc + (value * (8**index)); 
  }, 0);

  return decimal;
}

//console.log(octalToDecimal('1'));           // 1
//console.log(octalToDecimal('10'));          // 8
//console.log(octalToDecimal('130'));         // 88
//console.log(octalToDecimal('17'));          // 15
//console.log(octalToDecimal('2047'));        // 1063
//console.log(octalToDecimal('011'));         // 9

function anagram(word, list) {
  var anagrams = list.filter(function(currentWord) {
    return word.split('').sort().join('') === currentWord.split('').sort().join('');
  });

  return anagrams;
}

//console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana'])); // [ "inlets" ]
//console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));  // [ "enlist", "inlets" ]

var bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

function processBands(bands) {
  return bands.map(function(band) {
    var updatedCountry = 'Canada';
    var titleCaseName = titleCasePhrase(band.name);
    var cleanedOfDots = removeDots(titleCaseName); 

    return { 
      name: cleanedOfDots,
      country: updatedCountry,
      active: band.active,
    }
  });

  return processed;
}

function titleCasePhrase(phrase) {
  var wordArr = phrase.split(' ');

  var updatedPhrase = wordArr.map(function(word) {
    var letters = word.split('');
    letters[0] = letters[0].toUpperCase();
    return letters.join('');
  }).join(' ');

  return updatedPhrase;
}

function removeDots(phrase) {
  return phrase.replace(/\./g, '');
}

//console.log(processBands(bands));

// should return:

//[
//  { name: 'Sunset Rubdown', country: 'Canada', active: false },
//  { name: 'Women', country: 'Canada', active: false },
//  { name: 'A Silver Mt Zion', country: 'Canada', active: true },
//]

var studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

const EXAM_WEIGHT = 0.65;
const EXERCISES_WEIGHT = 0.35;

function generateClassRecordSummary(scores) {
  var scoreData = Object.keys(scores).map(function(student) {
    return scores[student].scores;
  });

  var examData = scoreData.map(function(score) {
    return score.exams;
  });


  return {
    studentGrades: getFinalStudentGrades(scoreData),
    exams: getExamSummary(examData),
  }
}

// Transposes 2-D array by swapping columns and rows
function transpose(array) {
  // Use inner array for num columns and column index
  return array[0].map(function(col, colIdx) {
    // Map over each inner array for each column and select value at row and colIdx
    return array.map(function(row) {
      return row[colIdx];
    });
  });
}

function getExamSummary(examData) {
  var examsByNumber = transpose(examData);

  return examsByNumber.map(function(examScores) {
    return {
      average: findArrayAverage(examScores),
      minimum: Math.min(...examScores),
      maximum: Math.max(...examScores),
    }
  });
}

function getFinalStudentGrades(scoreData) {
  return scoreData.map(function(student) {
    var averageExamScore = findArrayAverage(student.exams);
    var totalExerciseScore = sumArray(student.exercises);
    var finalPercentGrade = Math.round(findFinalPercentGrade(averageExamScore, totalExerciseScore));
    var letterGrade = findLetterGrade(finalPercentGrade);
    var combinedFinalGrade = composeFinalGrade(finalPercentGrade, letterGrade);

    return combinedFinalGrade;
  });
}

function composeFinalGrade(percentGrade, letterGrade) {
  return String(percentGrade) + ' (' + letterGrade + ' )';
}

function findLetterGrade(percentGrade) {
  if (percentGrade >= 93) {
    return 'A';
  } else if (percentGrade >= 85) {
    return 'B';
  } else if (percentGrade >= 77) {
    return 'C';
  } else if (percentGrade >= 69) {
    return 'D'; 
  } else if (percentGrade >= 60) {
    return 'E';
  } else {
    return 'F';
  }
}

function findFinalPercentGrade(averageExamScore, totalExerciseScore) {
  return (averageExamScore * EXAM_WEIGHT) + (totalExerciseScore * EXERCISES_WEIGHT);
}

function findArrayAverage(arr) {
  var total = arr.reduce(function(acc, val) {
    return acc + val;
  });

  return total / arr.length;
}

function sumArray(arr) {
  return arr.reduce(function(acc, val) {
    return acc + val;
  });
}

//console.log(generateClassRecordSummary(studentScores));

// returns:

//{
//  studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
//  exams: [
//    { average: 75.6, minimum: 50, maximum: 100 },
//    { average: 86.4, minimum: 70, maximum: 100 },
//    { average: 87.6, minimum: 60, maximum: 100 },
//    { average: 91.8, minimum: 80, maximum: 100 },
//  ],
//}
